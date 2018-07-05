<template>
    <div id="app">
        <!--<div><Track name="Obrigatorias" :disc="disciplinas"/></div> -->
        <div v-for="trilha of trilhas" :key="trilha.id_trilha">
            <Track :name="trilha.nome" :descr="trilha.descricao"/>
       </div> 
        <!--<div>
            <p>Obrigatórias</p>
            <progress-bar :stepsDone="92" :stepsDoing="4" :totalSteps="115"/><br>
            <p>Eletivas</p>
            <progress-bar :stepsDone="22" :stepsDoing="16" :totalSteps="56"/><br>
            <p>Livres</p>
            <progress-bar :stepsDone="4" :stepsDoing="0" :totalSteps="24"/>
        </div> -->
    </div>
</template>


<script>
import Track from '@/components/Track';
//import ProgressBar from '@/components/ProgressBar';
export default {
  components: {
    Track,
   // ProgressBar,
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
