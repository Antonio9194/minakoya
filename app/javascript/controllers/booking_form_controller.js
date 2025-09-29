import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = ["input", "value"]

    open() {
    this.inputTarget.classList.toggle("d-none")
  }

  updateValue() {
    this.valueTarget.textContent = this.inputTarget.value
  }
}
