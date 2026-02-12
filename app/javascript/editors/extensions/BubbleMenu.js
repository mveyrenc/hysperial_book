import { Extension } from "@tiptap/core";
import { Plugin, PluginKey } from "@tiptap/pm/state";

import { BubbleMenuPlugin } from "@tiptap/extension-bubble-menu";

const BubbleMenu = (pluginName) => Extension.create({
    name: pluginName || "bubbleMenu",

    addOptions() {
        return {
            pluginKey: "bubbleMenu",
            shouldShow: null,
            mode: "text",
            oembed: false,
            embedPath: "",
        }
    },

    addProseMirrorPlugins() {
        const element = document.createElement("tiptap-bubble-menu");
        element.editor = this.editor;
        element.mode = this.options.mode;
        element.embedPath = this.options.embedPath;
        element.oembed = this.options.oembed;

        const tippyOptions = element.tippyOptions || {
            interactive: true,
            placement: "top",
            theme: "bubble",
            allowHTML: true,
            maxWidth: "none",
            appendTo: () => document.body,
            trigger: "manual"
        };

        return [
            BubbleMenuPlugin({
                editor: this.editor,
                key: new PluginKey(this.options.pluginKey || "bubbleMenu"),
                element: element,
                shouldShow: this.options.shouldShow,
                tippyOptions: Object.assign(tippyOptions, {
                    duration: 0,
                    delay: 0,
                    onShow: () => {
                        element.isActive = this.editor.isActive.bind(this.editor);
                    },
                    onHide: () => {
                        element.editingLink = false;
                    },
                }),
            }),
        ];
    },
});

export default BubbleMenu;