import XCTest
@testable import YTMediaPlayer

@MainActor
final class FakeScheduler {
    private(set) var scheduled: [(delay: TimeInterval, block: () -> Void)] = []
    private(set) var cancelled = 0

    func schedule(_ delay: TimeInterval, _ block: @escaping @MainActor () -> Void) -> () -> Void {
        scheduled.append((delay, { block() }))
        return { [weak self] in self?.cancelled += 1 }
    }

    var lastDelay: TimeInterval? { scheduled.last?.delay }

    func fireLast() {
        scheduled.last?.block()
    }
}

@MainActor
final class HUDVisibilityModelTests: XCTestCase {
    func makeSUT() -> (HUDVisibilityModel, FakeScheduler) {
        let fake = FakeScheduler()
        let model = HUDVisibilityModel(idleDelay: 2.0, leaveDelay: 0.6) { delay, block in
            fake.schedule(delay, block)
        }
        return (model, fake)
    }

    func testInitiallyVisible() {
        let (model, _) = makeSUT()
        XCTAssertTrue(model.isVisible)
    }

    func testPointerMovedThenFireHides() {
        let (model, fake) = makeSUT()
        model.pointerMoved()
        XCTAssertEqual(fake.lastDelay, 2.0)
        fake.fireLast()
        XCTAssertFalse(model.isVisible)
    }

    func testHiddenThenPointerMovedShowsAgain() {
        let (model, fake) = makeSUT()
        model.pointerMoved()
        fake.fireLast()
        XCTAssertFalse(model.isVisible)
        model.pointerMoved()
        XCTAssertTrue(model.isVisible)
    }

    func testPointerExitedSchedulesLeaveDelayThenHides() {
        let (model, fake) = makeSUT()
        model.pointerExited()
        XCTAssertEqual(fake.lastDelay, 0.6)
        fake.fireLast()
        XCTAssertFalse(model.isVisible)
    }

    func testPinnedPreventsHideUntilUnpinned() {
        let (model, fake) = makeSUT()
        model.isPinned = true
        model.pointerMoved()
        fake.fireLast()
        XCTAssertTrue(model.isVisible)

        model.isPinned = false
        XCTAssertEqual(fake.lastDelay, 2.0)
    }

    func testEachNewEventCancelsPreviousTimer() {
        let (model, fake) = makeSUT()
        model.pointerMoved()
        XCTAssertEqual(fake.cancelled, 0)
        model.pointerMoved()
        XCTAssertEqual(fake.cancelled, 1)
        model.pointerExited()
        XCTAssertEqual(fake.cancelled, 2)
    }
}
