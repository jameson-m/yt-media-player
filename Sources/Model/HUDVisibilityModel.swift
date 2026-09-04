import Foundation
import Observation

@MainActor
@Observable
final class HUDVisibilityModel {
    typealias Scheduler = (TimeInterval, @escaping @MainActor () -> Void) -> () -> Void

    private(set) var isVisible = true
    var isPinned = false {
        didSet {
            if isPinned {
                cancelTimer()
                isVisible = true
            } else {
                scheduleHide(after: idleDelay)
            }
        }
    }

    private let idleDelay: TimeInterval
    private let leaveDelay: TimeInterval
    private let scheduler: Scheduler
    private var cancelPending: (() -> Void)?

    init(
        idleDelay: TimeInterval = 2.0,
        leaveDelay: TimeInterval = 0.6,
        scheduler: @escaping Scheduler = HUDVisibilityModel.mainQueueScheduler
    ) {
        self.idleDelay = idleDelay
        self.leaveDelay = leaveDelay
        self.scheduler = scheduler
    }

    func pointerMoved() {
        show()
    }

    func pointerExited() {
        guard !isPinned else { return }
        scheduleHide(after: leaveDelay)
    }

    func hideNow() {
        cancelTimer()
        isVisible = false
    }

    func show() {
        isVisible = true
        guard !isPinned else { return }
        scheduleHide(after: idleDelay)
    }

    private func scheduleHide(after delay: TimeInterval) {
        cancelTimer()
        cancelPending = scheduler(delay) { [weak self] in
            self?.isVisible = false
        }
    }

    private func cancelTimer() {
        cancelPending?()
        cancelPending = nil
    }

    static func mainQueueScheduler(
        _ delay: TimeInterval,
        _ block: @escaping @MainActor () -> Void
    ) -> () -> Void {
        let item = DispatchWorkItem { block() }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: item)
        return { item.cancel() }
    }
}
