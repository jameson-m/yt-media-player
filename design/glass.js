(function(){
  var KEY='ytmp-theme',root=document.documentElement;
  try{var t=localStorage.getItem(KEY);if(t)root.dataset.theme=t}catch(e){}
  var SPRITE='<svg xmlns="http://www.w3.org/2000/svg" style="position:absolute;width:0;height:0;overflow:hidden" aria-hidden="true">'
   +'<symbol id="i-play" viewBox="0 0 24 24"><path d="M8 5.6v12.8a1.1 1.1 0 0 0 1.66.95l10.8-6.4a1.1 1.1 0 0 0 0-1.9L9.66 4.65A1.1 1.1 0 0 0 8 5.6z"/></symbol>'
   +'<symbol id="i-pause" viewBox="0 0 24 24"><rect x="6" y="4.8" width="4.6" height="14.4" rx="1.4"/><rect x="13.4" y="4.8" width="4.6" height="14.4" rx="1.4"/></symbol>'
   +'<symbol id="i-forward" viewBox="0 0 24 24"><path d="M2.5 6.9v10.2a1 1 0 0 0 1.55.84L11.5 13.1v4a1 1 0 0 0 1.55.84l7.9-5.1a1 1 0 0 0 0-1.68l-7.9-5.1A1 1 0 0 0 11.5 6.9v4L4.05 6.06A1 1 0 0 0 2.5 6.9z"/></symbol>'
   +'<symbol id="i-backward" viewBox="0 0 24 24"><path transform="matrix(-1 0 0 1 24 0)" d="M2.5 6.9v10.2a1 1 0 0 0 1.55.84L11.5 13.1v4a1 1 0 0 0 1.55.84l7.9-5.1a1 1 0 0 0 0-1.68l-7.9-5.1A1 1 0 0 0 11.5 6.9v4L4.05 6.06A1 1 0 0 0 2.5 6.9z"/></symbol>'
   +'<symbol id="i-speaker" viewBox="0 0 24 24"><path d="M3.5 9.6v4.8a1 1 0 0 0 1 1h2.4l3.9 3.3a1 1 0 0 0 1.7-.8V6.1a1 1 0 0 0-1.7-.8L6.9 8.6H4.5a1 1 0 0 0-1 1z"/><path d="M15.3 9.3a3.9 3.9 0 0 1 0 5.4M18 6.6a7.6 7.6 0 0 1 0 10.8" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round"/></symbol>'
   +'<symbol id="i-speaker-low" viewBox="0 0 24 24"><path d="M5 9.6v4.8a1 1 0 0 0 1 1h2.4l3.9 3.3a1 1 0 0 0 1.7-.8V6.1a1 1 0 0 0-1.7-.8L8.4 8.6H6a1 1 0 0 0-1 1z"/><path d="M16.8 9.3a3.9 3.9 0 0 1 0 5.4" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round"/></symbol>'
   +'<symbol id="i-heart" viewBox="0 0 24 24"><path d="M12 20.4l-1.3-1.2C5.9 14.9 3 12.2 3 8.9 3 6.2 5.1 4 7.8 4c1.6 0 3.1.7 4.2 1.9C13.1 4.7 14.6 4 16.2 4 18.9 4 21 6.2 21 8.9c0 3.3-2.9 6-7.7 10.3L12 20.4z"/></symbol>'
   +'<symbol id="i-heart-o" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="1.9" d="M12 19.3l-.7-.6C6.6 14.5 4 12 4 9.1 4 6.8 5.8 5 8 5c1.4 0 2.8.7 3.6 1.9L12 7.4l.4-.5C13.2 5.7 14.6 5 16 5c2.2 0 4 1.8 4 4.1 0 2.9-2.6 5.4-7.3 9.6l-.7.6z"/></symbol>'
   +'<symbol id="i-link" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" d="M9.5 14.5l5-5M8.2 16.2l-.9.9a3.3 3.3 0 0 1-4.7-4.7l2.7-2.7a3.3 3.3 0 0 1 4.7 0M15.8 7.8l.9-.9a3.3 3.3 0 0 1 4.7 4.7l-2.7 2.7a3.3 3.3 0 0 1-4.7 0"/></symbol>'
   +'<symbol id="i-plus" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" d="M12 5.5v13M5.5 12h13"/></symbol>'
   +'<symbol id="i-more" viewBox="0 0 24 24"><circle cx="6" cy="12" r="1.9"/><circle cx="12" cy="12" r="1.9"/><circle cx="18" cy="12" r="1.9"/></symbol>'
   +'<symbol id="i-pin" viewBox="0 0 24 24"><path d="M14.5 3.2l6.3 6.3-1.4 1.4-1-.3-3.5 3.5.4 3.6-1.4 1.4-3.6-3.6-4.7 4.7-1.4-1.4 4.7-4.7-3.6-3.6 1.4-1.4 3.6.4 3.5-3.5-.3-1z"/></symbol>'
   +'<symbol id="i-pip" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="1.9" stroke-linejoin="round" d="M3.5 7A2.5 2.5 0 0 1 6 4.5h12A2.5 2.5 0 0 1 20.5 7v10a2.5 2.5 0 0 1-2.5 2.5H6A2.5 2.5 0 0 1 3.5 17z"/><rect x="11" y="11" width="7.5" height="5.5" rx="1.2"/></symbol>'
   +'<symbol id="i-gear" viewBox="0 0 24 24"><path d="M12 8.2a3.8 3.8 0 1 0 0 7.6 3.8 3.8 0 0 0 0-7.6zm8.2 2.5l-1.9-.4a6.6 6.6 0 0 0-.7-1.7l1.1-1.6-1.7-1.7-1.6 1.1a6.6 6.6 0 0 0-1.7-.7L13.3 3.8h-2.6l-.4 1.9a6.6 6.6 0 0 0-1.7.7L7 5.3 5.3 7l1.1 1.6a6.6 6.6 0 0 0-.7 1.7l-1.9.4v2.6l1.9.4c.2.6.4 1.2.7 1.7L5.3 17 7 18.7l1.6-1.1c.5.3 1.1.5 1.7.7l.4 1.9h2.6l.4-1.9c.6-.2 1.2-.4 1.7-.7l1.6 1.1 1.7-1.7-1.1-1.6c.3-.5.5-1.1.7-1.7l1.9-.4z"/></symbol>'
   +'<symbol id="i-chev" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" d="M7 10l5 5 5-5"/></symbol>'
   +'<symbol id="i-x" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" d="M7 7l10 10M17 7L7 17"/></symbol>'
   +'<symbol id="i-search" viewBox="0 0 24 24"><circle cx="10.5" cy="10.5" r="6" fill="none" stroke="currentColor" stroke-width="2"/><path d="M15 15l4.5 4.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></symbol>'
   +'<symbol id="i-waves" viewBox="0 0 24 24"><rect x="4" y="9" width="2.4" height="6" rx="1.2"><animate attributeName="height" values="6;12;6" dur="1.1s" repeatCount="indefinite"/><animate attributeName="y" values="9;6;9" dur="1.1s" repeatCount="indefinite"/></rect><rect x="8.5" y="6" width="2.4" height="12" rx="1.2"><animate attributeName="height" values="12;5;12" dur="0.9s" repeatCount="indefinite"/><animate attributeName="y" values="6;9.5;6" dur="0.9s" repeatCount="indefinite"/></rect><rect x="13" y="8" width="2.4" height="8" rx="1.2"><animate attributeName="height" values="8;14;8" dur="1.3s" repeatCount="indefinite"/><animate attributeName="y" values="8;5;8" dur="1.3s" repeatCount="indefinite"/></rect><rect x="17.5" y="10" width="2.4" height="4" rx="1.2"><animate attributeName="height" values="4;10;4" dur="1s" repeatCount="indefinite"/><animate attributeName="y" values="10;7;10" dur="1s" repeatCount="indefinite"/></rect></symbol>'
   +'</svg>';
  document.addEventListener('DOMContentLoaded',function(){
    document.body.insertAdjacentHTML('afterbegin',SPRITE);
    if(/embed/.test(location.search)){document.body.classList.add('embed');return}
    var b=document.createElement('button');b.className='theme-toggle glass';b.title='Toggle light / dark';b.textContent='◐';
    b.onclick=function(){
      var dark=root.dataset.theme==='dark'||(!root.dataset.theme&&matchMedia('(prefers-color-scheme:dark)').matches);
      root.dataset.theme=dark?'light':'dark';try{localStorage.setItem(KEY,root.dataset.theme)}catch(e){}
    };
    document.body.appendChild(b);
  });
})();
