import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content']

  static values = {
    seconds: Number
  }

  connect() {
    this.countdown()
  }

  countdown() {
    // Set the timer value here
    this.secondsValue = 15
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) { this.submitTarget.click(); }
    }, 1000);
  }
}
