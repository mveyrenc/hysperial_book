import {Controller} from "@hotwired/stimulus";
import {Editor} from "@tiptap/core";
import {StandardKit} from "../editors";

class StandardEditorController extends Controller<HTMLFormElement> {
    static targets = ["editor", "input"]
    editor: Editor
    declare readonly editorTarget: HTMLInputElement
    declare readonly inputTarget: HTMLInputElement

    connect() {
        const initialContent = this.getInitialContent();

        this.editor = new Editor({
            element: this.editorTarget,
            content: initialContent,
            extensions: [StandardKit],
        });
        this.inputTarget.form.addEventListener("submit", this.saveEditorData.bind(this));
    }

    getInitialContent() {
        if (this.inputTarget && this.inputTarget.value) {
            return JSON.parse(this.inputTarget.value);
        }
        return {};
    }

    async saveEditorData(event: { preventDefault: () => void; }) {
        event.preventDefault();

        const outputData = this.editor.getJSON();
        this.inputTarget.value = JSON.stringify(outputData);
        this.inputTarget.form.submit();
    }
}

import {application} from "./application"

application.register('standard-editor', StandardEditorController)
