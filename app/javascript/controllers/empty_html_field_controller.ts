import {Controller} from "@hotwired/stimulus";

class EmptyHtmlFieldController extends Controller<HTMLFormElement> {
    static targets = ["input", "renderer"]

    declare readonly inputTarget: HTMLInputElement
    declare readonly rendererTarget: HTMLInputElement

    click(event: { preventDefault: () => void; }) {
        event.preventDefault();

        this.inputTarget.value = ""
        this.rendererTarget.innerHTML = ""
    }
}

import {application} from "./application"

application.register('empty-html-field', EmptyHtmlFieldController)