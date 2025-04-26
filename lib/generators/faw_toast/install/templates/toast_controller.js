import { Controller } from "@hotwired/stimulus"

// Toast controller for handling CSS animations
export default class extends Controller {
  handleAnimationEnd(event) {
    // Only remove the toast when the slideOut animation completes
    if (event.animationName === 'faw-toast-slideOut') {
      this.element.remove();
    }
  }
}
