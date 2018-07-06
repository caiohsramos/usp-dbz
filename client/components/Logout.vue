<template>
  <div>
    <p>Nome do usuario</p>
    <button type="submit" @click="logout">
      Logout
    </button>
  </div>
</template>

<script>
export default {

  methods: {
    async logout() {
      this.$store.commit("setToken", { token: ""});
		this.$router.go({path: "/"})
    }
  }
}
</script>

<style lang="scss">


</style>
