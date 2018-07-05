<template>
  <div class=".cruds__index">
	  <h1> Disciplinas </h1>
		  <table v-if="disciplinas.length != 0">
			  <tr>
				  <th v-for="k of Object.keys(disciplinas[0])" :key="k"> {{k}} </th>
				  <th>  </th>
			  </tr>
			  <tr v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
			 	 <td v-for="v of Object.values(disciplina)" :key="v"> {{ v }} </td>
				 <button class="button blue" @click="onEditar"> Editar </button>
				 <button class="button red" @click="onDeletar(disciplina.id_disciplina)"> Deletar </button>
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
      disciplinas: [],
    };
  },
  methods: {
	  onAdicionar: function() {
			this.$router.push({path: "/disciplinas/new"})
		},
	  onEditar: function() {
			this.$router.push({path: "/disciplinas/edit/"})
		},
	  async onDeletar(id) {
		  let result = await this.$axios.$delete("/disciplinas?id_disciplina=eq."+id, 
			  {headers: { Authorization: 'Bearer ' + this.$store.state.token}},)
		  console.log(result)
		  this.$router.go({path: "/disciplinas"})
	  }
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
