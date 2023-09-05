import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="live-subscription"
export default class extends Controller {
  static values = { gameId: Number }
  static targets = ["live"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: (data) => {
          console.log(data);
          const html_live = `<div class="pulse">
              <div class="default"></div>
              <div class="transition"></div>
            </div>
            <h6>Live</h6>`
          console.log(this.liveTarget)
          this.liveTarget.innerHTML = html_live
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.gameIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}