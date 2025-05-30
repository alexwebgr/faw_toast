document.addEventListener('DOMContentLoaded', faw_init);
document.addEventListener('turbo:load', faw_init);

function faw_init() {
  function setupToastListeners() {
    const toasts = document.querySelectorAll('.faw-toast');

    toasts.forEach(function(toast) {
      toast.addEventListener('animationend', function(event) {
        // Only remove the toast when the slideOut animation completes
        if (event.animationName === 'faw-toast-slideOutRight' || 
            event.animationName === 'faw-toast-slideOutLeft' || 
            event.animationName === 'faw-toast-slideOutTop' || 
            event.animationName === 'faw-toast-slideOutBottom') {
          toast.remove();
        }
      });
    });
  }

  setupToastListeners();

  const observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      if (mutation.addedNodes.length) {
        setupToastListeners();
      }
    });
  });

  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
}
