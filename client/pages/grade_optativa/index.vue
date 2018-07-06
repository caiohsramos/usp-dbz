<template>
  <div class=".cruds__index">
	  <h1> Grade Optativa </h1>
		  <table v-if="grad_opt.length != 0">
			  <tr>
				  <th v-for="k of Object.keys(grad_opt[0])" :key="k"> {{k}} </th>
				  <th>  </th>
			  </tr>
			  <tr v-for="g of grad_opt" :key="g.id_disciplina">
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
      grad_opt: [],
    };
  },
  methods: {
	  onAdicionar: function() {
			this.$router.push({path: "/grade_optativa/new/"})
		},
	  onEditar: function() {
			this.$router.push({path: "/grade_optativa/edit/"})
		},
	},
  async asyncData({ app }) {
    return {
      grad_obr: await app.$axios.$get("/grade_optativa")
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
