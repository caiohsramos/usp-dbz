<template>
    <div id="app">
        <div><Track name="Obrigatorias" /></div> 
        <div v-for="trilha of trilhas" :key="trilha.id_trilha">
            <Track :name="trilha.nome" :descr="trilha.descricao" :id="trilha.id_trilha"/>
       </div> 
    </div>
</template>


<script>
import Track from '@/components/Track';
//import ProgressBar from '@/components/ProgressBar';
export default {
  components: {
    Track,
  },

  data() {
    return {
      trilhas: [],
    };
  },


  // Initialize elements in 'data' before rendering page.
  // More info at: https://nuxtjs.org/api/
  async asyncData({ app }) {
    return {
        trilhas: await app.$axios.$get("/trilhas"),
    }
  }
}
</script>

<style lang="scss">

#app{
    width:100%;
    justify-content: right;
}
</style>
