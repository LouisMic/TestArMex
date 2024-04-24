import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-show"
export default class extends Controller {
  static targets = ["show", "results"]

  filter(event) {
    event.preventDefault()

    const url = `./shows/?search=${this.showTarget.value}`
    // console.log(url)
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/plain","Content-Type": "application/json" }})
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.innerHTML = data
      })
  }
}
