<template>
  <div>
    <record-form v-model="form"
                 @submit="ContentsApi.update({ params: record, form})">
      <input type="text" name="name"/>
      <button type="submit">Create content</button>
    </record-form>
  </div>
</template>

<script>
import RecordForm from '.././organisms/RecordForm.vue';
import ContentsApi from '@/api/Bookcase/Contents/ContentsApi.js'
import _ from 'lodash'

export default {
  constants: {
    ContentsApi
  },
  components: {
    RecordForm
  },
  props: {
    record: {
      type: Object,
      required: true,
    },
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        record: _.omit(this.record, 'id'),
      }),
    };
  },
};
</script>