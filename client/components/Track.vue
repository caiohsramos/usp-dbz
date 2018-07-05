<template>
    <div class="track" >
      <article class="message" :class=" accordionClasses"> 
        <div class="message-header" @click="toogleAccordion()">
            <p>{{name}}</p>
        </div>
        <div class="message-body">
            <p>{{descr}}</p> 
            <div class="inside_track" >
                <div v-for="modulo of modulos" :key="modulo.id_modulo"> 
                    <module :name="modulo.codigo_modulo"/> 
                </div>
            </div>
        </div>
    </article> 
    </div>
</template>


<script>
import Module from '@/components/Module.vue'
export default {
    
    props: ["name", "descr"],
    components:{
        Module,
    },

    data(){
        return{
            isOpen: true,
            modulos:[] ,
        };
    },
    methods: {
        toogleAccordion: function(){
            this.isOpen= !this.isOpen;
        },
    },
    
    created(){
        this.$axios.$get("/modulos")   
        .then(value => {
                this.modulos=value;
            })
    },
    computed:{
       accordionClasses: function() {
           return {
               'is-closed': !this.isOpen,
               'is-Primary': this.isOpen,
                'is-dark': !this.isOpen
            };
        }
    },
}

</script>

<style lang="scss">
.inside_track{
    box-sizing: border-box;
    width: 85%;
    padding: 8px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 2px #aaa;
    margin: 15px auto;
    /*display: flex;
    flex-: column;
    justify-content: center;
    justify-content: flex-start;*/
}

/*

.flex-container {
    display: flex;
    padding: 0;
    margin: 0;
    list-style: none;
    width: 100%;
    border: 1px solid silver;
    -ms-box-orient: horizontal;
}

.nowrap  {
    -webkit-flex-wrap: nowrap;
    flex-wrap: nowrap;
}
 
.wrap    {
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
}
.wrap li {
    background: gold;
}

.wrap-reverse {
    -webkit-flex-wrap: wrap-reverse;
    flex-wrap: wrap-reverse;
}
.wrap-reverse li {
    background: deepskyblue;
}
.flex-item {
    background: tomato;
    padding: 5px;
    width: 200px;
    height: 100px;
    margin: 10px;
    line-height: 100px;
    color: white;
    font-weight: bold;
    font-size: 2em;
    text-align: center;
}
*/
.message {
    /*max-width: 500px;*/
    margin-left: auto;
    margin-right: auto;
}
 
.message-header {
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

</style>
