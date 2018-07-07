<template>
  <div>
    <!--<h2>{{user_name.nome}}</h2> -->
    <button type="submit" @click="logout">
      Logout
    </button>
  </div>
</template>

<script>
export default {
    data(){
        return{
            user_name: null,
        }
    },
    methods: {
        async logout() {
            this.$store.commit("setToken", { token: ""});
	       this.$router.go({path: "/"})
        }
    },
    created(){
        this.$axios.$post("rpc/nome_usuario",{"email": 'jef@ime.usp.br'})
            .then(value => {
                this.user_name = value[0];
            })
    }
}
</script>

<style lang="scss">


</style>
