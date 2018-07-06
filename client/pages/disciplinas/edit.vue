<template>
  <div class=".cruds__edit">
	  <h1> Editar disciplina </h1>
	  <div class="div-form">
		  <label> Código: </label>
		  <input type="text" placeholder="Código da disciplina.." class="input-full" v-model="disciplinas[0].codigo_disciplina"/>
		  <label> Créditos aula: </label>
		  <input type="number" placeholder="Créditos aula.." class="input-full" v-model="disciplinas[0].creditos_aula"/>
		  <label> Créditos trabalho: </label>
		  <input type="number" placeholder="Créditos trabalho.." class="input-full" v-model="disciplinas[0].creditos_trabalho"/>
		  <label> Carga horária: </label>
		  <input type="number" placeholder="Carga horária.." class="input-full" v-model="disciplinas[0].carga_horaria"/>
		  <label> Ativação: </label>
		  <input type="date" placeholder="Créditos trabalho.." class="input-full" v-model="disciplinas[0].ativacao"/>
		  <label> Desativação: </label>
		  <input type="date" placeholder="Desativação.." class="input-full" v-model="disciplinas[0].desativacao"/>
		  <label> Nome: </label>
		  <input type="text" placeholder="Nome.." class="input-full" v-model="disciplinas[0].nome"/>
		  <label> Ementa: </label>
		  <textarea name="message" rows="10" cols="30" class="input-full" v-model="disciplinas[0].ementa"/>

		  <div style="text-align: center">
			  <button type="submit" class="button green" @click="salvar(disciplinas[0].id_disciplina)" @submit.prevent> Salvar </button>
		  </div>
	  <button class="button blue" @click="onVoltar"> Voltar </button>
	  </div>
  </div>
</template>

<script>
export default {
	data() {
		return {
			disciplinas: [],
		}
	}, 
  methods: {
	  onVoltar: function() {
			this.$router.push({path: "/disciplinas"})
		},
	  async salvar(id) {
		  if (this.disciplinas[0].desativacao == '') {
			  this.disciplinas[0].desativacao = null
		  }
		  let result = await this.$axios.$patch("/disciplinas?id_disciplina=eq."+id,  
			this.disciplinas[0], {headers: { Authorization: 'Bearer ' + this.$store.state.token}},)
		  console.log(result)
		  this.$router.push({path: "/disciplinas"})
		},
	},
	async asyncData( app ) {
    return {
      disciplinas: await app.$axios.$get("/disciplinas?id_disciplina=eq." + app.query.id)
    }
  }

}
</script>

<style lang="scss">
.cruds__edit {
}
.button {	
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	padding: 14px 40px;
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

.input-full {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 50%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.div-form {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
