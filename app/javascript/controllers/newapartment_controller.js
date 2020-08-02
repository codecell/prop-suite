import { Controller } from 'stimulus'


export default class extends Controller {
  static targets = ["toggleapartmentform"]

  openapartmentform(event) {
    event.preventDefault()
    this.toggleapartmentformTarget.classList.toggle("d-none") 
  }
}





