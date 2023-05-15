import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect() {
    console.log("Hello World!")
  }

  greet() {
    console.log(`Hello, ${this.nameTarget.value}!`)
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
