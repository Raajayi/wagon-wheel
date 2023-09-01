import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content']

  static values = {
    seconds: Number
  }




  connect() {
    // console.log("Controller is live", this.element);
    // console.log("I am the submit button target", this.submitTarget);
    // console.log("I am the content target", this.contentTarget);

    // this.secondsValue = 29
    // console.log(this.secondsValue);
    // this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
    // setInterval(updateTimer(), 1000);
    this.countdown()
  }



  countdown() {
    console.log("Countdown has been activated");

    this.secondsValue = 30
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    // setInterval(this.updateTimer, 1000);
    setInterval(() => {
      this.secondsValue -= 1;
      // console.log(this.secondsValue);
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

      if (this.secondsValue <= 0) {
        this.submitTarget.click();
      }
    }, 1000);

    // if (this.secondsValue <= 0) {
    //   clearInterval()
    // }
    // setInterval(this.updateTimer, 1000);
    // if (this.secondsValue  <= 0) {
    //   console.log("Countdown is over");
    // }
  }

  // updateTimer() {
  //   // this.secondsValue -= 1;
  //   console.log(this.secondsValue);
  //   // this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
  // }




  // clearInterval()

}
