<template>
  <div class=".cruds__index">
	  <h1> Disciplinas </h1>
	  <ul v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">

		  <li>
			  <div>
			  {{ disciplina.codigo_disciplina }}
			  <button > Editar </button>
			  <button > Deletar </button>
			  </div>
		  </li>
	  </ul>
	  <button> Adicionar </button>
  </div>
</template>

<script>
export default {
	layout: 'crud',
  data() {
    return {
      disciplinas: [],
    };
  },

  async asyncData({ app }) {
    return {
      disciplinas: await app.$axios.$get("/disciplinas")
    }
  }
}
</script>

<style lang="scss">
.cruds__index {
}
</style>
