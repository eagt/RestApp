import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="qty-plus-minus"
export default class extends Controller {
  static targets = ["value"]  
  connect() {
    console.log("Connected")
  }

  //Increment / Decrement on the counter
  increment() {
    this.valueTarget.value = parseInt(this.valueTarget.value) + 1
  }
  decrement() {
    this.valueTarget.value = parseInt(this.valueTarget.value) - 1
  }
}



