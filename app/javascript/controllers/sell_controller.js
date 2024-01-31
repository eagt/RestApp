import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sell"
export default class extends Controller {
  static targets = ["mesasCard", "productsCard"]
  

  connect() {
    console.log("Helllo")
    this.mesasCardTarget.hidden = true
    this.productsCardTarget.hidden = true
  }

  showMesasCard() {
    this.mesasCardTarget.hidden = false 
    this.productsCardTarget.hidden = true   
  }

  showProductsCard() {
    this.productsCardTarget.hidden = false   
    this.mesasCardTarget.hidden = true 
  }  
}


