<template>
  <div class=".cruds__index">
	  <h1> Pré-Requisitos </h1>
		  <table v-if="prereq.length != 0">
			  <tr>
				  <th v-for="k of Object.keys(prereq[0])" :key="k"> {{k}} </th>
				  <th>  </th>
			  </tr>
			  <tr v-for="p of prereq" :key="p.id_prerequisito">
			 	 <td v-for="v of Object.values(p)" :key="v"> {{ v }} </td>
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
      prereq: [],
    };
  },
  methods: {
	  onAdicionar: function() {
			this.$router.push({path: "/prerequisitos/new/"})
		},
	  onEditar: function() {
			this.$router.push({path: "/prerequisitos/edit/"})
		},
	},
  async asyncData({ app }) {
    return {
      prereq: await app.$axios.$get("/prerequisitos")
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
