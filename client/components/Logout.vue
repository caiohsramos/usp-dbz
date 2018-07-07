<template>
  <div>
    <h2>{{user_name}}</h2> 
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
            uid: null,
        }
    },
    methods: {
        async logout() {
           this.$store.commit("setToken", { token: ""});
           this.$store.commit("setUid", { id: null});
           this.$store.commit("setEmail", { email: ""});
	       this.$router.go({path: "/"})
        }
    },
    created(){
        let e = this.$store.state.email;
        this.$axios.$post("rpc/nome_usuario",{"email": e})
            .then(value => {
                this.user_name = value[0].nome;
            });
        this.$axios.$post("rpc/id_pessoa",{"email": e})
            .then(value => {
                this.$store.commit("setUid",{id: value[0].id})
            });
        
    }
}
</script>

<style lang="scss">


</style>
