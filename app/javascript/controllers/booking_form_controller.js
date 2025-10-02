import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [
    "calendar",
    "checkInValue",
    "checkOutValue",
    "checkInInput",
    "checkOutInput",
    "monthsWrapper"
  ]

  connect() {
    this.currentIndex = 0
    this.datesSelected = [] // store chosen dates
    this.showMonths()
  }

  open() {
    this.calendarTarget.classList.toggle("d-none")
  }

updateValue(event) {
  const date = event.currentTarget.dataset.day
  const clickedEl = event.currentTarget

  // clear highlights if 2 dates already selected
  if (this.datesSelected.length >= 2) {
    this.datesSelected = []
    this.checkInValueTarget.textContent = ""
    this.checkOutValueTarget.textContent = ""
    this.checkInInputTarget.value = ""
    this.checkOutInputTarget.value = ""

    // remove all highlights
    this.calendarTarget.querySelectorAll(".selected-date, .in-range").forEach(el => {
      el.classList.remove("selected-date", "in-range")
    })
  }

  // add new selection
  this.datesSelected.push(date)

  // always highlight clicked date
  clickedEl.classList.add("selected-date")

  if (this.datesSelected.length === 1) {
    this.checkInValueTarget.textContent = date
    this.checkInInputTarget.value = date
  } else if (this.datesSelected.length === 2) {
    this.checkOutValueTarget.textContent = date
    this.checkOutInputTarget.value = date

    // highlight range between check-in and check-out
    const [start, end] = this.datesSelected.sort()
    this.calendarTarget.querySelectorAll("[data-day]").forEach(el => {
      const d = el.dataset.day
      if (d > start && d < end) {
        el.classList.add("in-range")
      }
    })

    // close after 2nd pick
    this.calendarTarget.classList.add("d-none")
  }
}

  // --- months navigation ---
  showMonths() {
    const months = this.monthsWrapperTarget.children
    Array.from(months).forEach((m, i) => {
      m.style.display = (i === this.currentIndex || i === this.currentIndex + 1) ? "block" : "none"
    })
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