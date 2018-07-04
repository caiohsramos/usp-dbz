<template>
  <div class=".cruds__index">
	  <h1> Grade Obrigatória </h1>
		  <table v-if="grad_obr.length != 0">
			  <tr>
				  <th v-for="k of Object.keys(grad_obr[0])" :key="k"> {{k}} </th>
				  <th>  </th>
			  </tr>
			  <tr v-for="g of grad_obr" :key="g.id_disciplina">
			 	 <td v-for="v of Object.values(g)" :key="v"> {{ v }} </td>
				 <button class="button blue"> Editar </button>
				 <button class="button red"> Deletar </button>
			  </tr>
		  </table>
	  <button class="button green" @click="onAdicionar"> Adicionar </button>
  </div>
</template>

<script>
export default {
	layout: 'crud',
  data() {
    return {
      grad_obr: [],
    };
  },
  methods: {
	  onAdicionar: function() {
			this.$router.push({path: "/grade_obrigatoria/new/"})
		},
	  onEditar: function() {
			this.$router.push({path: "/grade_obrigatoria/edit/"})
		},
	},
  async asyncData({ app }) {
    return {
      grad_obr: await app.$axios.$get("/grade_obrigatoria")
    }
  }
}
</script>

<style lang="scss">
.cruds__index {
}
</style>
