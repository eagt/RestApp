import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sell"
export default class extends Controller {
  static targets = ["displayMesas", "displayProducts"]  

  connect() {
    console.log("Helllo")
    this.displayMesasTarget.hidden = true
    this.displayProductsTarget.hidden = true
  }

  buttonMesas() {
    this.displayMesasTarget.hidden = false
    this.displayProductsTarget.hidden = true
  }

  buttonProducts() {
    this.displayMesasTarget.hidden = true
    this.displayProductsTarget.hidden = false    
  }
}  

