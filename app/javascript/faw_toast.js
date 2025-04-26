// Self-initializing toast handler
document.addEventListener('DOMContentLoaded', function() {
  console.log('DOMContentLoaded');
  // Function to handle toast animations
  function setupToastListeners() {
    // Find all toast elements
    const toasts = document.querySelectorAll('.faw-toast');

    // Add animation end listeners to each toast
    toasts.forEach(function(toast) {
      toast.addEventListener('animationend', function(event) {
        // Only remove the toast when the slideOut animation completes
        if (event.animationName === 'faw-toast-slideOut') {
          toast.remove();
        }
      });
    });
  }

  // Initial setup
  setupToastListeners();

  // Also handle dynamically added toasts (for turbo/ajax)
  const observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      if (mutation.addedNodes.length) {
        setupToastListeners();
      }
    });
  });

  // Start observing the document for added nodes
  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
});
