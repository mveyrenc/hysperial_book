import {Controller} from "@hotwired/stimulus";
import {Editor} from "@tiptap/core";
import {StarterKit} from "@syfxlin/tiptap-starter-kit";
import Document from '@tiptap/extension-document'
import Bold from '@tiptap/extension-bold'
import Paragraph from '@tiptap/extension-paragraph'
import Text from '@tiptap/extension-text'
import Subscript from '@tiptap/extension-subscript'
import Superscript from '@tiptap/extension-superscript'

class LightEditorController extends Controller {
    static targets = ["editor", "input"]

    connect() {
        const editor = new Editor({
            element: this.editorTarget,
            content: this.inputTarget.input ? JSON.parse(this.inputTarget.input) : '',
            extensions: [
                Document,
                Paragraph,
                Text,
                Subscript,
                Superscript
            ],
        });
        addEventListener("submit", function (e) {
            e.preventDefault();
            this.inputTarget.input = editor.getJSON();
        }, true);
    }
}

import {application} from "./application"

application.register('light-editor', LightEditorController)