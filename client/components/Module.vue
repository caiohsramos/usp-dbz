<template>
    <div class="module" >
        <h3>{{name}}</h3> 
        <div class="inside_module">
            <div v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
                <Course :code="disciplina.codigo_disciplina" :name="disciplina.nome" status="cursada" :id="disciplina.id_disciplina" :plan="disciplina.ano_semestre"/> 
            </div>
       </div>
    </div>
</template>


<script>
import Course from '@/components/Course'
export default {
    
    props: ["name","id"],
    //bloqueadas cursadas e planejada
    components:{
        Course,
    },

    data(){
        return{
            disciplinas: [],
        };
    },
    created(){
        if(this.$store.getters.isAuthenticated){
            let u = this.$store.state.u_id;
            if(this.name ==""){
                this.$axios.$post('/rpc/list_obrigatorias_log',{"id": u})   
                    .then(value => {
                this.disciplinas=value;
                this.$store.commit("setTemp",{value: this.disciplinas})
                })
            }
            else{
                this.$axios.$post("/rpc/list_disciplinas_modulos_log",{"id": this.id, "u": u })   
            .then(value => {
                    this.disciplinas=value;
                })
            }
        }
        else{
            if(this.name ==""){
                this.$axios.$post('/rpc/list_obrigatorias',{"ano": 2012})   
                    .then(value => {
                this.disciplinas=value;
                })
            }
            else{
                this.$axios.$post("/rpc/list_disciplinas_modulos",{"id": this.id, "ano": 2012})   
            .then(value => {
                    this.disciplinas=value;
                })
            }

        }
    }
}

</script>

<style scoped>
.module{
    /*box-sizing: border-box;
    width:80% ;
    padding: 8px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 2px #333;
    margin:  auto;*/
    display: inline-block;
}
.inside_module{

    display:flex;
    flex-flow: row wrap;
    margin:auto;
    justify-content: center;
    background-color: #eee;
}
</style>
