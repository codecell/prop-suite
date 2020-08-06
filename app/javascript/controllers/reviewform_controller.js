import { Controller } from 'stimulus'


export default class extends Controller {
  static targets = ["togglereviewform"]

  openreviewform(event) {
    event.preventDefault()
    this.togglereviewformTarget.classList.toggle("d-none") 
  }

  get evet() {}

  set evet(event) {
    this.openreviewform(event)
  }
}





