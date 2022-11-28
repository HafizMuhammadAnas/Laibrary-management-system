import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="book-modal"
export default class extends Controller {
  connect() {
    console.log('i m stimulus!!')
  }
  initialize() {
    this.element.setAttribute("data-action", "click->book-modal#showModal")
  }
  showModal(event) {
    event.preventDefault()
    this.url = this.element.getAttribute("href")
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
