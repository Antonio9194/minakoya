import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="guests"
export default class extends Controller {
  static targets = ["numberOfGuests", "count"] 

  connect() {
    this.guestCount = 1
    this.updateDisplay()
  }

  open() {
    this.numberOfGuestsTarget.classList.toggle("d-none")
  }

  increase() {
    this.guestCount++
    this.updateDisplay()
  }

  decrease() {
    if (this.guestCount > 1) this.guestCount--
    this.updateDisplay()
  }

  updateDisplay() {
    if (this.hasCountTarget) {
      this.countTarget.textContent = this.guestCount
    }
  }
}