import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="game-subscription"
export default class extends Controller {
  static values = { gameId: Number }
  static targets = [ "avatar", "avatarContainer", "start" ]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: (data) => {
          if (data.name) {
            console.log(this.avatarTargets[0].dataset);
            //const currentAvatar = this.avatarTargets.find(avatar => parseInt(avatar.dataset.userId) === data.userId);
            // console.log(currentAvatar);
            console.log(data);
            //currentAvatar.classList.add("bg-success");
  
            //Enable Avatar
            const currentContainer = this.avatarContainerTargets.find(container => parseInt(container.dataset.userId) === data.userId);
            console.log(currentContainer);
            currentContainer.classList.add("connected");
  
            //Enable Current User
            //const currentUserContainer = this.
          } else {
            // we need to click the play button
            console.log(data.message)
            if (this.startTarget.parentElement.classList.contains('d-none')) {
              this.startTarget.click()
            }
          }
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
