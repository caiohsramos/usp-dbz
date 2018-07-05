<template>
  <div class=".cruds__new">
	  <h1> Adicionar disciplina </h1>
	  <div class="div-form">
		  <label> Código: </label>
		  <input type="text" placeholder="Código da disciplina.." class="input-full" v-model="cod_dis"/>
		  <label> Créditos aula: </label>
		  <input type="number" placeholder="Créditos aula.." class="input-full" v-model="cred_aula"/>
		  <label> Créditos trabalho: </label>
		  <input type="number" placeholder="Créditos trabalho.." class="input-full" v-model="cred_trab"/>
		  <label> Carga horária: </label>
		  <input type="number" placeholder="Carga horária.." class="input-full" v-model="carga"/>
		  <label> Ativação: </label>
		  <input type="date" placeholder="Créditos trabalho.." class="input-full" v-model="ativa"/>
		  <label> Desativação: </label>
		  <input type="date" placeholder="Desativação.." class="input-full" v-model="desativa"/>
		  <label> Nome: </label>
		  <input type="text" placeholder="Nome.." class="input-full" v-model="nome"/>
		  <label> Ementa: </label>
		  <textarea name="message" rows="10" cols="30" class="input-full" v-model="ementa"/>

		  <div style="text-align: center">
			  <button type="submit" class="button green" @click="salvar" @submit.prevent> Salvar </button>
		  </div>
	  <button class="button blue" @click="onVoltar"> Voltar </button>
	  </div>
  </div>
</template>

<script>
export default {
	layout: 'crud',
	data() {
		return {
			cod_dis: '',
			cred_aula: '',
			cred_trab: '',
			carga: '',
			ativa: '',
			desativa: '',
			nome: '',
			ementa: '',
		}
	}, 
  methods: {
	  onVoltar: function() {
			this.$router.push({path: "/disciplinas"})
		},
	  async salvar() {
		  let result = await this.$axios.$post("/disciplinas", {
			  codigo_disciplina:this.cod_dis,
			  creditos_aula: this.cred_aula,
			  creditos_trabalho: this.cred_trab,
			  carga_horaria: this.carga,
			  ativacao: this.ativa,
			  desativacao: this.desativa,
			  nome: this.nome,
			  ementa: this.ementa,
		  })
		  console.log(result)
		  this.$router.push({path: "/disciplinas"})
		},
	},

}
</script>

<style lang="scss">
.cruds__new {
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
