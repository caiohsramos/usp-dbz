<template>
  <div class=".cruds__new">
	  <div class="div-form">
	  <form action="/disciplinas/new" method="post">
		  <label> Código: </label>
		  <input type="text" placeholder="Código da disciplina.." class="input-full">
		  <label> Créditos aula: </label>
		  <input type="number" placeholder="Créditos aula.." class="input-full">
		  <label> Créditos trabalho: </label>
		  <input type="number" placeholder="Créditos trabalho.." class="input-full">
		  <label> Carga horária: </label>
		  <input type="number" placeholder="Carga horária.." class="input-full">
		  <label> Ativação: </label>
		  <input type="date" placeholder="Créditos trabalho.." class="input-full">
		  <label> Desativação: </label>
		  <input type="date" placeholder="Desativação.." class="input-full">
		  <label> Nome: </label>
		  <input type="text" placeholder="Nome.." class="input-full">
		  <label> Ementa: </label>
		  <textarea name="message" rows="10" cols="30" class="input-full"/>

		  <div style="text-align: center">
		  <input type="submit" value="Salvar" class="button green">
		  </div>
	  </form>
	  <button class="button blue" @click="onVoltar"> Voltar </button>
	  </div>
  </div>
</template>

<script>
export default {
	layout: 'crud',
  methods: {
	  onVoltar: function() {
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
