<template>
    <div class="track" >
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
      <article class="message" :class=" accordionClasses">
        <div class="message-header" @click="toogleAccordion()">
            <i id= "column1" :class=" accordionArrow"></i>
            <span id= "column2">{{name}}</span>
        </div>
        <div class="message-body">
            <p>{{descr}}</p>
            <div class="inside_track" >
                <div  v-if="name=='Obrigatorias'">
                        <module name="" id=""/>
                </div>
                <div class="each_module_fora" v-else>
                    <div class="each_module_dentro" v-for="modulo of modulos" :key="modulo.id_modulo">
                        <module :name="modulo.codigo_modulo" :id="modulo.id_modulo" />
                    </div>
                </div>
            </div>
        </div>
    </article>
    </div>
</template>


<script>
import Module from '@/components/Module.vue'
export default {

    props: ["name", "descr","id"],
    components:{
        Module,
    },

    data(){
        return{
            isOpen: false,
            modulos:[] ,
            disciplinas: [],
        };
    },
    methods: {
        toogleAccordion: function(){
            this.isOpen= !this.isOpen;
        },
    },

    created(){
        this.$axios.$get('/modulos?id_trilha=eq.'+this.id)
            .then(value => {
                this.modulos=value;
            });
        if(this.name == "Obrigatorias"){this.isOpen=true};    
    },
    computed:{
       accordionClasses: function() {
           return {
               'is-closed': !this.isOpen,
               'is-Primary': this.isOpen,
                'is-dark': !this.isOpen
            };
        },
        accordionArrow: function() {
            return {
                'fas fa-caret-right': !this.isOpen,
                'fas fa-caret-down': this.isOpen
            };
        },
    },
}

</script>

<style lang="scss">
.track{
    margin-bottom:30px
}
.each_module_fora{
    display: flex;
    justify-content: center;
}
.each_module_dentro{
    display: inline-block;
    margin: 10px;
}
.inside_track{
    box-sizing: border-box;
    width: 85%;
    padding: 8px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 2px #aaa;
    margin: 5px auto;
    /*display: inline-block;*/
    display: flex;
    flex-direction:column;
    justify-content: space-around;
    /*justify-content: flex-start;*/
}

.message {
    /*max-width: 500px;*/
    margin-left: auto;
    margin-right: auto;
}

.message-header {
    display:flex;
    flex-direction:row;
    justify-content: left;
 /*   margin-bottom: 40px;*/
    width: 100%;
    cursor: pointer;
    color: blue;
}

.message-body   {
    padding: 0;
    /*max-height: 10em;*/
    overflow: hidden;
    transition: 0.3s ease all;
}

.is-closed .message-body {
    max-height: 0;
 }

 #row1{
     display:flex;
     flex-direction:row;
     justify-content: space-around;
     margin-bottom: 40px;
     width: 100%;
 }

 #column1{
     display:flex;
     flex-direction:column;
     margin-right:5px;

 }

 #column2{
     display:flex;
     flex-direction:column;
     margin-left:0;
     font-size: 18pt;
     color: #000;
     vertical-align: text-top;
 }

</style>
