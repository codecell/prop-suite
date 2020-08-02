import { Controller } from 'stimulus'


export default class extends Controller {
  static targets = ["mobilesidebar"]

  togglesidebar(event) {
    event.preventDefault()
    this.mobilesidebarTarget.classList.toggle("d-none") 
  }
}