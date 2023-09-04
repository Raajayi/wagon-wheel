import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="correct-answer"
export default class extends Controller {
  connect() {
    console.log("Controller connect to form: ", this.element);
  }

  onSubmit(event) {
    event.preventDefault();
    console.dir(event);
    console.dir(this.element);

    // Select the answer that happens to be correct.
    // Change it's class to highlight it
  }
}
