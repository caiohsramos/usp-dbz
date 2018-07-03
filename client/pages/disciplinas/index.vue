<template>
  <div class=".cruds__index">
	  <h1> Disciplinas </h1>

		  <table>
			  <tr>
				  <th> Nome </th>
				  <th> Código </th>
				  <th>  </th>
			  </tr>
			  <tr v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
			 	 <td> {{ disciplina.nome }} </td>
			 	 <td> {{ disciplina.codigo_disciplina }} </td>
				 <button class="button blue"> Editar </button>
				 <button class="button red"> Deletar </button>
			  </tr>
		  </table>
	  <button class="button green"> Adicionar </button>
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
}

</style>
