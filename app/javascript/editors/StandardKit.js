// from https://github.com/afomera/richer-text.js/blob/main/src/editor/extensions/RicherTextKit.js

import {Extension, Mark, Node} from "@tiptap/core";
import {Plugin} from "@tiptap/pm/state";

import {TextStyleKit} from '@tiptap/extension-text-style'
import {StarterKit} from "@syfxlin/tiptap-starter-kit";
import Code from '@tiptap/extension-code'
import Document from '@tiptap/extension-document'
import Paragraph from '@tiptap/extension-paragraph'
import Text from '@tiptap/extension-text'
import Typography from '@tiptap/extension-typography'
import Color from "@tiptap/extension-color"
import Dropcursor from "@tiptap/extension-dropcursor";
import Focus from "@tiptap/extension-focus";
import Highlight from "@tiptap/extension-highlight";
import Link from "@tiptap/extension-link";
import Placeholder from "@tiptap/extension-placeholder";
import Table from '@tiptap/extension-table'
import TableCell from '@tiptap/extension-table-cell'
import TableHeader from '@tiptap/extension-table-header'
import TableRow from '@tiptap/extension-table-row'
import TextAlign from "@tiptap/extension-text-align";
import TextStyle from '@tiptap/extension-text-style'

import Callout from "./extensions/Callout";
import CodeBlock from "./extensions/CodeBlock";
import CommandMenu from "./extensions/CommandMenu";
import BubbleMenu from "./extensions/BubbleMenu";
import EditorEvents from "./extensions/EditorEvents";
import Emoji from "./extensions/Emoji";
import FontSize from "./extensions/FontSize";
import HorizontalRule from "./extensions/HorizontalRule";
import SmilieReplacer from "./extensions/SmilieReplacer";
import ColorHighlighter from "./extensions/ColorHighlighter";
import Image from "./Image";


export const StandardKit = Extension.create({
    name: "standardKit",

    addOptions() {
        return {
            placeholder: 'Start typing...',
        }
    },

    addExtensions() {
        const extensions = [Document, Paragraph, Text];

        if (this.options.code !== false) {
            extensions.push(Code);
        }

        if (this.options.textStyleKit !== false) {
            extensions.push(TextStyleKit);
        }

        if (this.options.starterKit !== false) {
            extensions.push(StarterKit);
        }

        if (this.options.horizontalRule !== false) {
            extensions.push(HorizontalRule);
        }

        if (this.options.callout !== false) {
            extensions.push(Callout);
        }

        if (this.options.smilieReplacer !== false) {
            extensions.push(SmilieReplacer);
        }

        if (this.options.colorHighlighter !== false) {
            extensions.push(ColorHighlighter);
        }

        if (this.options.commandMenu !== false) {
            const calloutEnabled = this.options.callout !== false;
            const tablesEnabled = this.options.tables !== false;

            extensions.push(CommandMenu(calloutEnabled, tablesEnabled));
        }

        if (this.options.bubbleMenu !== false) {
            const calloutEnabled = this.options.callout !== false;
            const tablesEnabled = this.options.tables !== false;

            extensions.push(BubbleMenu(calloutEnabled, tablesEnabled));
        }

        if (this.options.dropcursor !== false) {
            extensions.push(Dropcursor.configure({
                color: 'pink'
            }));
        }

        if (this.options.focus !== false) {
            extensions.push(Focus.configure({
                className: 'has-focus',
                mode: "shallowest"
            }));
        }

        if (this.options.fontSize !== false) {
            extensions.push(FontSize);
        }

        if (this.options.highlight !== false) {
            extensions.push(
                Highlight.configure({
                    multicolor: true
                }),
            );
        }

        if (this.options.link !== false) {
            extensions.push(
                Link.configure({
                    openOnClick: false,
                    protocols: ["https", "mailto"]
                })
            );
        }

        if (this.options.placeholder !== false) {
            extensions.push(
                Placeholder.configure({
                    placeholder: this.options.placeholder,
                })
            );
        }

        if (this.options.tables !== false) {
            extensions.push(
                Table.configure({
                    resizable: false,
                }),
                TableRow,
                TableHeader,
                TableCell,
            )
        }

        if (this.options.emoji !== false) {
            extensions.push(Emoji);
        }

        extensions.push(
            EditorEvents,
            CodeBlock,
            TextStyle,
            Color,
            TextAlign.configure({
                types: ['paragraph', 'heading'],
            }),
        )

        return extensions;
    },
});