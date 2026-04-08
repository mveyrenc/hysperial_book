import {defineCustomElement} from 'vue'
import EditorContent from '@/custom-elements/TiptapEditor.vue'

const TiptapEditor = defineCustomElement(EditorContent)

export {TiptapEditor}

export function register() {
  customElements.define('tiptap-editor', TiptapEditor)
}
