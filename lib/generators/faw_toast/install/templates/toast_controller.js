import { Controller } from "@hotwired/stimulus"

// Toast controller for handling CSS animations
export default class extends Controller {
  static targets = ["progress"]

  connect() {
    // Get the duration from CSS variable or use the default
    const durationSeconds = parseFloat(document.documentElement.style.getPropertyValue('--faw-toast-duration') || '7');

    // Set the animation duration for the progress bar if it exists
    if (this.hasProgressTarget) {
      this.progressTarget.style.animationDuration = `${durationSeconds}s`;
    }
  }

  handleAnimationEnd(event) {
    // Only remove the toast when the slideOut animation completes
    if (event.animationName === 'faw-toast-slideOut') {
      this.element.remove();
    }
  }
}
