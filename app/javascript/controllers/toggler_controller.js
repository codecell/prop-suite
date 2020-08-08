import { Controller } from 'stimulus'


export default class extends Controller {
  static targets = ["canvas"]

  opencanvas(event) {
    event.preventDefault()
    this.canvasTarget.classList.toggle("d-none") 
  }

  get evet() {}

  set evet(event) {
    this.opencanvas(event)
  }
}





