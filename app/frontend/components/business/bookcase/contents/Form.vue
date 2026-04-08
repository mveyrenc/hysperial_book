<script setup lang="ts">
import {Form} from '@inertiajs/vue3'
</script>

<template>
  <Form action="/users" method="post">
    <input type="text" name="name"/>
    <input type="email" name="email"/>
    <button type="submit">Create User</button>
  </Form>
</template>