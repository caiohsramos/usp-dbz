<template>
  <div class=".aside__login">
    <p>Login</p>
    <input type="email" v-model="email"/>
    <input type="password" v-model="password"/>
    <br/>
    <button type="submit" @click="login" @submit.prevent>
      Login
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: ''
    }
  },

  methods: {
    async login() {
      // TODO: Implement login logic here
      // TIP: Method is `async` because it should use "await this.$axios"
		let t = await this.$axios.$post("/rpc/autenticar", {email:this.email, senha: this.password, });

      // Save token at global vuex store to be used by auth middleware
      this.$store.commit("setToken", { token: t});
      if(this.$store.getters.isAuthenticated){
          this.$store.commit("setEmail", { email: this.email});
      };
		this.$router.go({path: "/"});
    }
  }
}
</script>

<style lang="scss">
.aside__login {
    margin: auto;
}
</style>
