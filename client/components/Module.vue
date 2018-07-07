<template>
    <div class="module" >
        <h3>{{name}}</h3> 
        <div class="inside_module">
            <div v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
                <Course :code="disciplina.codigo_disciplina" :name="disciplina.nome" status="cursada" :id="disciplina.id_disciplina"/> 
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
        if(this.name ==""){
            this.$axios.$post('/rpc/list_obrigatorias',{})   
                .then(value => {
            this.disciplinas=value;
            })
        }
        else{
            this.$axios.$post("/rpc/list_disciplinas_modulos",{"id": this.id})   
        .then(value => {
                this.disciplinas=value;
            })
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
