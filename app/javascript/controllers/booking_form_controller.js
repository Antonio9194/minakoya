import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = ["calendar", "checkInValue", "checkOutValue", "checkInInput", "checkOutInput"]

  open(event) {
    this.currentInput = event.currentTarget.dataset.type
    this.calendarTarget.classList.toggle("d-none")
  }

  updateValue(event) {
    const date = event.currentTarget.dataset.day

    if (this.currentInput === "check_in") {
      this.checkInValueTarget.textContent = date
      this.checkInInputTarget.value = date
    } else if (this.currentInput === "check_out") {
      this.checkOutValueTarget.textContent = date
      this.checkOutInputTarget.value = date
    }

    this.calendarTarget.classList.add("d-none") 
  }
}