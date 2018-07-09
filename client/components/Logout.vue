<template>
  <div>
    <h2>{{user_name}}</h2> 
    <button class="lgout" type="submit" @click="logout">
      Logout
    </button><br/>
    <button class="btsave" type="submit" @click="save">
        Salvar plano
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
           this.$store.commit("setIngresso", { ano: ""});
            this.$store.commit("setDisc_state", { value: {} });
            this.$store.commit("setSem", { n: 9 });
	       this.$router.go({path: "/"})
        },
        async save(){
            let dis = this.$store.state.disc_state;
            let u = this.$store.state.u_id;
            let e = this.$store.state.ingresso;
            for (var key in dis){
                let ano = e + dis[key]*0.5;
                let result = this.$axios.$post("rpc/salva_plano",{id_disciplina: key, id_pessoa: u, ano_semestre: ano }, {headers: {Authorization: 'Bearer ' + this.$store.state.token}} )
                    .then(response =>{console.log(response)})
                    .catch(error =>{console.log(error.response)})
            }

        }
    },
    created(){
        let e = this.$store.state.email;
        this.$axios.$post("rpc/nome_usuario",{"email": e})
            .then(value => {
                this.user_name = value[0].nome;
            });
    }
}
</script>

<style lang="scss">
.btsave{
    margin:auto;
margin-top: 10px ;
}
.lgout{
    margin:auto;
    margin-top: 10px ;
}
</style>
