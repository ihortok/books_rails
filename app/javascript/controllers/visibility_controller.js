import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dynamic" ]

  connect() {
    this.hiddenClass = "d-none"
    console.log(134)
  }

  toggle(event) {
    this.dynamicTargets.forEach(target => {
      target.classList.toggle(this.hiddenClass)
    })
  }
}
