import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content', 'form']

  static values = {
    seconds: Number,
    correctAnswerId: String
  }

  connect() {
    console.log("Connected");
    console.log("Correct answer id", this.correctAnswerIdValue);
    this.countdown();

    const correctInputId = `response_answer_id_${this.correctAnswerIdValue}`
    console.log(correctInputId);
    console.log(document.getElementById(correctInputId));
    const correctAnswerElement = document.getElementById(correctInputId)
    console.dir(correctAnswerElement);
    console.log(correctAnswerElement.labels[0]);
    const correctLabelElement = correctAnswerElement.labels[0]
    correctLabelElement.innerHTML = "LGTM!!!"
    correctLabelElement.classList.add('bg-success')
    correctAnswerElement.value = "DGWREFWR"

  }

  countdown() {
    // Set the timer value here
    this.secondsValue = 10
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    const preSubmissionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        this.submitTarget.click();
        clearInterval(preSubmissionInterval)
      }
    }, 1000);
  }

  onSubmit(event) {
    event.preventDefault();
    // clearInterval(preSubmissionInterval)
    this.secondsValue = 5;
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    const postSubmissionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        // this.submitTarget.click();
        clearInterval(postSubmissionInterval)
      }
    }, 1000);


    console.dir(event);
    console.dir(this.formTarget);

    // Set the timer for correct answer here

    // Select the answer that happens to be correct.
    // Change it's class to highlight it.
    // X seconds later, submit form
  }
}
