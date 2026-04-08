<template>
  <editor-content :editor="editor"/>
</template>

<script>
import Bold from '@tiptap/extension-bold'
import Document from '@tiptap/extension-document'
import Paragraph from '@tiptap/extension-paragraph'
import Text from '@tiptap/extension-text'
import {Editor, EditorContent} from '@tiptap/vue-3'

export default {
  components: {
    EditorContent,
  },

  data() {
    return {
      editor: null,
    }
  },

  mounted() {
    this.editor = new Editor({
      content: "<p>I'm running Tiptap with Vue.js. 🎉</p>",
      extensions: [Document, Paragraph, Text, Bold],
    })
  },

  beforeUnmount() {
    this.editor.destroy()
  },
}
</script>