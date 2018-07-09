<template>
    <div class="course">
        <div id="row1">
            <div class="course_status" :id="st" @click="increment()">{{st}}</div>
            <div class="course_counter">{{counter}}</div>
        </div>
        <div>{{code}}</div>
        <div>{{name}}</div>
    </div>

</template>


<script>
export default {
    props: ["code","name", "status","id","plan"],
    //bloqueadas cursadas e planejada

    data(){
        return{
            counter: null,
            result: null,
            st: "",
            enabled: true,
        }
    },
    methods:{
        increment(){
            if(this.enabled){
                this.counter =(this.counter+1)  % 8;
                this.$store.commit("addDisc", { id: this.id , prop: this.counter});
            this.result =this.$store.getters.disc_semestre(this.id);
            }
        }
    },
    created(){
        let u = this.$store.state.u_id;
        let ano = this.$store.state.ingresso;
        if(this.plan!=null){
            this.counter = (this.plan-ano)*2;
            this.$store.commit("addDisc",{id: this.id, prop:this.counter});
        }
        this.$axios.$post("rpc/is_cursada",{"id_disc": this.id, "id_pess": u})
            .then(value=> {
                if(value){this.st = "cursada";this.counter = null; this.enabled=false}
            });
        this.$axios.$post("rpc/is_cursando",{"id_disc": this.id, "id_pess": u})
            .then(value=> {
                if(value){this.st = "cursando";this.counter = null; this.enabled=false}
            });
    
    
    }

}

</script>

<style lang="scss">
.course{
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    margin: 10px;
    max-width: 100px;
    text-align: center;
}
#cursada{
  background-color: $primary-color;
}
#cursando{

  background-color: orange;
}
.course_status {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

  background-color: gray;
    color: $light-color;
    width: 5rem;
    height: 5rem;
    border-radius: 100%;
    margin-bottom: -30px;
}

.course_counter {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

    background-color: white;
    color: $dark-color;
    border-style: solid;

    border-width: 0.2rem;
    border-color: black;
    border-radius: 100%;

    width: 1.5rem;
    height: 1.5rem;
    position: absolute;
    top: 50px;
    left: 75px;
}

#row1{
    display:flex;
    flex-direction:row;
    justify-content: space-around;
    margin-bottom: 40px;
    width: 100%;
    position: relative;
}

#column1{
    display:flex;
    flex-direction:column;
    margin-right: 40px;

}

#column2{
    display:flex;
    flex-direction:column;
    margin-left: 40px;
    margin-right: 40px;
}
</style>
