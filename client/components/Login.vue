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
      password: '',
      id: '',
      ano: ''
    }
  },
  methods: {
    async login() {
      // TODO: Implement login logic here
      // TIP: Method is `async` because it should use "await this.$axios"
		let t = await this.$axios.$post("/rpc/autenticar", {email:this.email, senha: this.password, });
        let i = await this.$axios.$post("rpc/id_pessoa",{email: this.email});
      // Save token at global vuex store to be used by auth middleware
      this.$store.commit("setToken", { token: t});
      if(this.$store.getters.isAuthenticated){
          this.$store.commit("setEmail", { email: this.email});      
          this.$store.commit("setUid",{id: i[0].id}) 
          await this.$axios.$post("rpc/ingresso",{"id": i[0].id })
            .then(value => {
                this.$store.commit("setIngresso",{ano: value})
            });
      }
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
