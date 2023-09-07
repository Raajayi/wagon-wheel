import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['submit','content', 'form', 'radio', 'livetable']

  static values = {
    seconds: Number,
    correctAnswerId: String,
    firstQuestion: Boolean
  }

  connect() {
    if (this.firstQuestionValue) {
      this.livetableTarget.classList.remove("show");
      this.countdown()
    } else {
      this.onShowLadderEnd();
    }
  }

  onShowLadderEnd() {
    // Set the timer value here
    this.secondsValue = 5
    const preSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        clearInterval(preSelectionInterval);
        this.livetableTarget.classList.remove("show");
        this.countdown()
      }
    }, 1000);

  }

  countdown() {
    // Set the timer value here
    this.secondsValue = 20
    this.contentTarget.innerHTML = `<span class="count">${this.secondsValue}</span><span class="seconds">seconds</span>`;

    const preSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `<span class="count">${this.secondsValue}</span><span class="seconds">seconds</span>`;
      if (this.secondsValue <= 0) {
        clearInterval(preSelectionInterval)
        this.onTimerEnd()
      }
    }, 1000);
  }

  onTimerEnd() {
    const correctInputId = `response_answer_id_${this.correctAnswerIdValue}`
    const correctInputElement = document.getElementById(correctInputId)
    const correctLabelElement = correctInputElement.labels[0]
    // correctLabelElement.classList.add('bg-success')
    correctLabelElement.classList.add('correct')

    this.formTarget[2].disabled = true;
    this.formTarget[3].disabled = true;
    this.formTarget[4].disabled = true;
    this.formTarget[5].disabled = true;

    this.secondsValue = 5;
    this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;

    const postSelectionInterval = setInterval(() => {
      this.secondsValue -= 1;
      this.contentTarget.innerHTML = `Time remaining: ${this.secondsValue}`;
      if (this.secondsValue <= 0) {
        clearInterval(postSelectionInterval)

        this.formTarget[2].disabled = false;
        this.formTarget[3].disabled = false;
        this.formTarget[4].disabled = false;
        this.formTarget[5].disabled = false;

        this.formTarget.submit();
      }
    }, 1000);
  }
}
