import { Controller } from "@hotwired/stimulus"

// Toast controller for handling CSS animations
export default class extends Controller {
  static targets = ["progress"]

  connect() {
    const durationSeconds = getComputedStyle(document.documentElement).getPropertyValue('--faw-toast-duration').trim();

    if (this.hasProgressTarget) {
      this.progressTarget.style.animationDuration = durationSeconds;
    }
  }

  handleAnimationEnd(event) {
    // Only remove the toast when the slideOut animation completes
    if (event.animationName === 'faw-toast-slideOut') {
      this.element.remove();
    }
  }
}
