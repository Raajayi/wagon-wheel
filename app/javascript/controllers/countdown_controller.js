import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content']

  static values = {
    seconds: Number
  }

  updateTimer() {
    this.contentTarget.innerHTML += "1second";
  }


  connect() {
    console.log("Controller is live", this.element);
    console.log("I am the submit button target", this.submitTarget);
    console.log("I am the content target", this.contentTarget);

    this.secondsValue = 29
    console.log(this.secondsValue);

    setInterval(updateTimer(), 1000);
  }

  countdown() {
    if (this.secondsValue  <= 0) {
      console.log("Countdown is over");
    }
  }




  // clearInterval()

}
