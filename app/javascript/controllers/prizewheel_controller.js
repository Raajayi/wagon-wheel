import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="prizewheel"
export default class extends Controller {

  static targets = ["spinElement", "resultElement"]

  connect() {
    console.log("Hello")
  }

  fire() {
    this.spinElementTarget.classList.add("spin");
    this.resultElementTarget.classList.add("reveal");
  }

}
