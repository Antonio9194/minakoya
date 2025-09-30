import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="guests"
export default class extends Controller {
  static targets = ["numberOfGuests"]
    open(event) {
    this.currentInput = event.currentTarget.dataset.type
    this.numberOfGuestsTarget.classList.toggle("d-none")
  }
}
