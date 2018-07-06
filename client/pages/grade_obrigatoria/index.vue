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
				 <button class="button red" @click="onDeletar(g.id_disciplina)"> Deletar </button>
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
	  async onDeletar(id) {
		  let result = await this.$axios.$delete("/grade_obrigatoria?id_disciplina=eq."+id, 
			  {headers: { Authorization: 'Bearer ' + this.$store.state.token}},)
		  console.log(result)
		  this.$router.go({path: "/grade_obrigatoria"})
	  }
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
.button {	
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	padding: 10px 28px;
	border-radius: 4px;
	margin: 4px 2px;
	cursor: pointer;
}
.green {
	background-color: #4CAF50;
}

.blue {
	background-color: #008CBA;
}
.red {
	background-color: #f44336;
}

.table {
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #ddd;
    padding: 8px;
}


tr:hover {background-color: #ddd;}

th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
	background-color: #f5f5f5;
}
</style>
