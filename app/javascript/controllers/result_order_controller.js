import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result-order"
export default class extends Controller {

  static values = {
    newOrder: Array

  }
  static targets = ["player"]

  connect() {
    console.log(this.newOrderValue);
    setTimeout(() => {
      this.playerTargets.forEach(player => {
          const playerId = parseInt(player.dataset.userId)
          player.style.top = `${this.newOrderValue.indexOf(playerId) * 120}px`
      });
    }, 3000)
  }
}
