<template>
  <q-page class="flex flex-center">
    <q-btn
      color="primary"
      class="q-mr-md"
      label="Get Request to Arc Sandbox"
      @click="get"
    />

    <q-btn
      color="secondary"
      label="Post Request to Arc Sandbox"
      @click="post"
    />

    <div class="text-h3">{{results}}</div>
  </q-page>
</template>

<script>
export default {
  name: 'PageIndex',
  data () {
    return {
      api: 'http://localhost:3333',
      results: ''
    }
  },
  methods: {
    async get () {
      this.$q.loading.show()
      try {
        console.log('Get')
        const response = await this.$axios.get(this.api)
        console.log('Success!')
        this.results = response
      } finally {
        this.$q.loading.hide()
      }
    },
    async post () {
      this.$q.loading.show()
      try {
        console.log('Post')
        const response = await this.$axios.post(this.api)
        console.log('Success!')
        this.results = response
      } finally {
        this.$q.loading.hide()
      }
    }
  }
}
</script>
