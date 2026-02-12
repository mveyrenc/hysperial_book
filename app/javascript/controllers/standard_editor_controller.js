import {Controller} from "@hotwired/stimulus";
import {Editor} from "@tiptap/core";
import {StarterKit} from "@syfxlin/tiptap-starter-kit";
// import Subscript from '@syfxlin/tiptap-starter-kit'
// import Superscript from '@syfxlin/tiptap-starter-kit'
// import Bold from '@syfxlin/tiptap-starter-kit'
// import Code from '@syfxlin/tiptap-starter-kit'
// import Italic from '@syfxlin/tiptap-starter-kit'
// import Strike from '@syfxlin/tiptap-starter-kit'
// import Highlight from '@syfxlin/tiptap-starter-kit'
// import Underline from '@syfxlin/tiptap-starter-kit'
// import Text from '@syfxlin/tiptap-starter-kit'
// import Heading from '@syfxlin/tiptap-starter-kit'
// import Paragraph from '@syfxlin/tiptap-starter-kit'
// import Document from '@syfxlin/tiptap-starter-kit'
// import Blockquote from '@syfxlin/tiptap-starter-kit'
// import HardBreak from '@syfxlin/tiptap-starter-kit'
// import CodeBlock from '@syfxlin/tiptap-starter-kit'
// import HorizontalRule from '@syfxlin/tiptap-starter-kit'
// import BulletList from '@syfxlin/tiptap-starter-kit'
// import OrderedList from '@syfxlin/tiptap-starter-kit'
// import ListItem from '@syfxlin/tiptap-starter-kit'
// import TaskList from '@syfxlin/tiptap-starter-kit'
// import TaskItem from '@syfxlin/tiptap-starter-kit'
// import Details from '@syfxlin/tiptap-starter-kit'
// import DetailsContent from '@syfxlin/tiptap-starter-kit'
// import DetailsSummary from '@syfxlin/tiptap-starter-kit'
// import Table from '@syfxlin/tiptap-starter-kit'
// import TableRow from '@syfxlin/tiptap-starter-kit'
// import TableCell from '@syfxlin/tiptap-starter-kit'
// import TableHeader from '@syfxlin/tiptap-starter-kit'
// import Emoji from '@syfxlin/tiptap-starter-kit'
// import Embed from '@syfxlin/tiptap-starter-kit'
// import Image from '@syfxlin/tiptap-starter-kit'
// import Audio from '@syfxlin/tiptap-starter-kit'
// import Video from '@syfxlin/tiptap-starter-kit'
// import Mermaid from '@syfxlin/tiptap-starter-kit'
// import Plantuml from '@syfxlin/tiptap-starter-kit'
// import MathBlock from '@syfxlin/tiptap-starter-kit'
// import MathInline from '@syfxlin/tiptap-starter-kit'
// import Uploader from '@syfxlin/tiptap-starter-kit'
// import Markdown from '@syfxlin/tiptap-starter-kit'
// import Clipboard from '@syfxlin/tiptap-starter-kit'
// import BlockMenu from '@syfxlin/tiptap-starter-kit'
// import FloatMenu from '@syfxlin/tiptap-starter-kit'
// import ClickMenu from '@syfxlin/tiptap-starter-kit'
// import History from '@syfxlin/tiptap-starter-kit'
// import Gapcursor from '@syfxlin/tiptap-starter-kit'
// import Dropcursor from '@syfxlin/tiptap-starter-kit'
class StandardEditorController extends Controller {
    static targets = ["editor", "input"]

    connect() {
        // const marksExtensions = [
        //     Subscript,
        //     Superscript,
        //     Bold,
        //     Code,
        //     Link,
        //     Italic,
        //     Strike,
        //     Highlight,
        //     Underline
        // ]
        // const nodesExtensions = [
        //     Text,
        //     Document,
        //     Heading,
        //     Paragraph,
        //     Blockquote,
        //     HardBreak,
        //     CodeBlock,
        //     HorizontalRule,
        //     BulletList,
        //     OrderedList,
        //     ListItem,
        //     TaskList,
        //     TaskItem,
        //     Details,
        //     DetailsContent,
        //     DetailsSummary,
        //     Table,
        //     TableRow,
        //     TableCell,
        //     TableHeader,
        //     Emoji,
        //     Embed,
        //     Image,
        //     Audio,
        //     Video,
        //     Mermaid,
        //     Plantuml,
        //     MathBlock,
        //     MathInline
        // ]
        //
        // const othersExtensions = [
        //     Uploader,
        //     Markdown,
        //     Clipboard,
        //     BlockMenu,
        //     FloatMenu,
        //     ClickMenu,
        //     History,
        //     Gapcursor,
        //     Dropcursor
        // ]
        const initialContent = this.getInitialContent();

        this.editor = new Editor({
            element: this.editorTarget,
            content: initialContent,
            extensions: [StarterKit],
        });
        this.inputTarget.form.addEventListener("submit", this.saveEditorData.bind(this));

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
    getInitialContent() {
        if (this.inputTarget && this.inputTarget.value) {
            return JSON.parse(this.inputTarget.value);
        }
        return {};
    }



    async saveEditorData(event) {
        event.preventDefault();

        const outputData = await this.editor.getJSON();
        this.inputTarget.value = JSON.stringify(outputData);
        this.inputTarget.form.submit();
    }
}

import {application} from "./application"

application.register('standard-editor', StandardEditorController)
