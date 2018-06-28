<template>
  <div class="planejamento">
    <h1>Planejamento</h1>
	<div class="flex-container wrap">
    <!-- Example of Vue using some data -->
    <ul v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
        <course :code="disciplina.codigo_disciplina" status="cursada"/>
       <!-- <li>{{ disciplina.codigo_disciplina }}</li> -->
    </ul>
	</div>
  </div>
</template>

<script>
import Course from '@/components/Course.vue'; 
export default {
    components: {
        Course
    },
  data() {
    return {
      disciplinas: []
    };
  },

  // Initialize elements in 'data' before rendering page.
  // More info at: https://nuxtjs.org/api/
  async asyncData({ app }) {
    return {
      disciplinas: await app.$axios.$get("/disciplinas")
    }
  }
}
</script>

<style lang="scss">
.planejamento {
}
.flex-container {
  padding: 0;
  margin: 0;
  list-style: none;
  border: 1px solid silver;
  -ms-box-orient: horizontal;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -moz-flex;
  display: -webkit-flex;
  display: flex;
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

.wrap-reverse         { 
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
</style>
