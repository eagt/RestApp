import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sell"
export default class extends Controller {
  static targets = ["mesasCard"]  

  connect() {
    console.log("Helllo")
    this.mesasCardTarget.hidden = true
    console.log("Helllo")
  } 
}  




    //this.hasmesasCardTarget
    //this.hasproductsCardTarget.hidden = true
 

//  showMesasCard() {
//    this.mesasCardTarget.hidden = false 
//    //this.productsCardTarget.hidden = true   
//  }
//
//  showProductsCard() {
//   // this.productsCardTarget.hidden = false   
//    this.mesasCardTarget.hidden = true 
//  } 
  
  // Increment / Decrement on the counter
 //increment() {
 //  this.valueTarget.value = parseInt(this.valueTarget.value) + 1
 //}
 //decrement() {
 //  this.valueTarget.value = parseInt(this.valueTarget.value) - 1
 //}

