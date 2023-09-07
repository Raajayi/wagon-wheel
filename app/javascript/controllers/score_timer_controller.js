import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="score-timer"
export default class extends Controller {

  static targets = ['resultstable']

  connect() {
    console.log("Connected")
    this.onGameEnd();
  }

  onGameEnd() {
    // Set the timer value here
    this.secondsValue = 10
    const preSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      if (this.secondsValue <= 0) {
        clearInterval(preSelectionInterval);
        this.resultstableTarget.classList.add("show");
        this.countdown()
      }
    }, 1000);
  }

  countdown() {
    // Set the timer value here
    this.secondsValue = 5
    const preSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      if (this.secondsValue <= 0) {
        clearInterval(preSelectionInterval);
        window.location = "/prizewheel";
      }
    }, 1000);
  }



}
