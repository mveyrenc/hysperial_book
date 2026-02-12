import {Controller} from "@hotwired/stimulus";
import { Editor } from "@tiptap/core";
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

        // addEventListener("trix-initialize",function (event) {
        //     // initialize underline attribute
        //     Trix.config.textAttributes.underline = {
        //         tagName: "u",
        //         style: { textDecoration: "underline" },
        //         inheritable: true,
        //         parser: function (element) {
        //             var style = window.getComputedStyle(element);
        //             return style.textDecoration === "underline";
        //         },
        //     };
        //
        //     // create underline button
        //     let underlineEl = document.createElement("button");
        //     underlineEl.setAttribute("type", "button");
        //     underlineEl.setAttribute("data-trix-attribute", "underline");
        //     underlineEl.setAttribute("data-trix-key", "u");
        //     underlineEl.setAttribute("tabindex", -1);
        //     underlineEl.setAttribute("title", "underline");
        //     underlineEl.classList.add("trix-button", "trix-button--icon-underline");
        //     underlineEl.innerHTML = "U";
        //
        //     // add button to toolbar
        //     document.querySelector(".trix-button-group--text-tools").appendChild(underlineEl);
        //
        //     // remove unused toolbar buttons
        //     TrixController.UNUSED_TOOLBAR_CLASSES.forEach((cls) => {
        //         document.querySelector(cls).remove();
        //     });
        //
        //     // update toolbar icons
        //     TrixController.TOOLBAR_BUTTON_ICONS.forEach((group) => {
        //         document.querySelector(group.identifier).innerHTML = group.icon;
        //     });
        // }, true);
        //
        // addEventListener("trix-file-accept", function (e) {
        //     e.preventDefault();
        // }, true);
    }
}

import { application } from "./application"
application.register('light-editor', LightEditorController)