import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = [
    "calendar",
    "checkInValue",
    "checkOutValue",
    "checkInInput",
    "checkOutInput",
    "monthsWrapper",   // new
    "monthLabel"       // new
  ]

  connect() {
    // for the calendar slider
    this.currentIndex = 0
    this.showMonths()
  }

  open(event) {
    this.currentInput = event.currentTarget.dataset.type
    this.calendarTarget.classList.remove("d-none")
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

  // --- new methods for months navigation ---
  showMonths() {
    const months = this.monthsWrapperTarget.children
    Array.from(months).forEach((m, i) => {
      m.style.display = (i === this.currentIndex || i === this.currentIndex + 1) ? "block" : "none"
    })

    // optional: update the header label
    if (this.monthLabelTarget && months[this.currentIndex + 1]) {
      this.monthLabelTarget.textContent =
        months[this.currentIndex].querySelector("h4").textContent + " - " +
        months[this.currentIndex + 1].querySelector("h4").textContent
    }
  }

  nextMonth() {
    if (this.currentIndex < this.monthsWrapperTarget.children.length - 2) {
      this.currentIndex++
      this.showMonths()
    }
  }

  prevMonth() {
    if (this.currentIndex > 0) {
      this.currentIndex--
      this.showMonths()
    }
  }
}