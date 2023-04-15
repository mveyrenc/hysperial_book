import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    message: {type: String, default: "Are you sure?"}
  }


  confirm(event) {
    let confirmed = confirm(this.messageValue)
    if (!confirmed) {
      event.preventDefault()
    }
  }
}
