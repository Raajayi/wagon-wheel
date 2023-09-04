import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content', 'form']

  static values = {
    seconds: Number,
    correctAnswerId: String
  }

  connect() {
    // console.log("Connected");
    // console.log("Correct answer id", this.correctAnswerIdValue);
    this.countdown();

    // const correctInputId = `response_answer_id_${this.correctAnswerIdValue}`
    // console.log(correctInputId);
    // console.log(document.getElementById(correctInputId));
    // const correctInputElement = document.getElementById(correctInputId)
    // // console.dir(correctInputElement);
    // // console.log(correctInputElement.labels[0]);
    // const correctLabelElement = correctInputElement.labels[0]
    // // correctLabelElement.innerHTML = "LGTM!!!"
    // correctLabelElement.classList.add('bg-success')
    // correctLabelElement.classList.add('correct')
    // correctInputElement.value = "DGWREFWR"

  }

  countdown() {
    // Set the timer value here
    this.secondsValue = 10
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    const preSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        // this.submitTarget.click();
        clearInterval(preSelectionInterval)
        this.onTimerEnd()
      }
    }, 1000);
  }

  onTimerEnd() {
    const correctInputId = `response_answer_id_${this.correctAnswerIdValue}`
    const correctInputElement = document.getElementById(correctInputId)
    const correctLabelElement = correctInputElement.labels[0]
    correctLabelElement.classList.add('bg-success')
    correctLabelElement.classList.add('correct')

    this.secondsValue = 5;
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    const postSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        clearInterval(postSelectionInterval)
        this.submitTarget.click();
      }
    }, 1000);
  }
}
