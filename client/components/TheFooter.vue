<template>
  <footer class="footer">
    <div id="main-div">
        <div id="title-div">
            <p id="title">Contagem de créditos(Total: {{obrigatorias_cursadas+eletivas_cursadas+livres_cursadas}}/{{obrigatorias+livres+eletivas}})</p>
        </div>
        <div id="row1">
            <div id="column1">
                <p>Obrigatórias</p>
                <progress-bar :stepsDone="obrigatorias_cursadas" :stepsDoing="obrigatorias_cursando" :totalSteps="obrigatorias"/>
            </div>
            <div id="column2a">
                <p>Eletivas</p>
                <progress-bar :stepsDone="0" :stepsDoing="0" :totalSteps="0"/>
            </div>
            <div id="column3">
                <p>Livres</p>
                <progress-bar :stepsDone="0" :stepsDoing="0" :totalSteps="24"/>
            </div>
        </div>
   </div>
  </footer>
</template>
<script>
import ProgressBar from '@/components/ProgressBar';
export default{
components: {
    ProgressBar,
  },
    data(){
        return{
            obrigatorias: 0,
            obrigatorias_cursadas: 0,
            obrigatorias_cursando: 0,
            eletivas: 56,
            eletivas_cursadas: 0,
            eletivas_cursando: 0,
            livres: 24,
            livres_cursadas: 0,
            livres_cursando: 0,
        }
    },
    created(){
        this.$axios.$post("/rpc/creditos_obrigatorios_total",{"ano": '2017-01-01'})  
        .then(value => {
            this.obrigatorias=value;
        });
        this.$axios.$post("/rpc/creditos_obrigatorios_cursados",{"ano": '2017-01-01', "id": this.$store.state.u_id})  
        .then(value => {
            this.obrigatorias_cursadas=value;
        });
        this.$axios.$post("/rpc/creditos_obrigatorios_cursando",{"ano": '2017-01-01', "id": this.$store.state.u_id})  
        .then(value => {
            this.obrigatorias_cursando=value;
        });
        //this.$axios.$post("/rpc/creditos_eletivos_total",{"ano": '2017-01-01'})  
        //.then(value => {
        //    this.eletivos=value;
        //});
        this.$axios.$post("/rpc/creditos_eletivos_cursados",{"ano": '2017-01-01', "id": this.$store.state.u_id})  
        .then(value => {
            this.eletivas_cursadas=value;
        });
        this.$axios.$post("/rpc/creditos_eletivos_cursando",{"ano": '2017-01-01', "id": 24})  
        .then(value => {
            this.eletivas_cursando=value;
        });
        //this.$axios.$post("/rpc/creditos_livres_total",{"ano": '2017-01-01'})  
        //.then(value => {
        //    this.livres=value;
        //});
        this.$axios.$post("/rpc/creditos_livres_cursados",{"ano": '2017-01-01', "id": this.$store.state.u_id})  
        .then(value => {
            this.livres_cursadas=value;
        });
        this.$axios.$post("/rpc/creditos_livres_cursando",{"ano": '2017-01-01', "id": this.$store.state.u_id})  
        .then(value => {
            this.livres_cursando=value;
        });
    },
}
</script>
<style>
.footer {
  /* Grid to position the cell itself */
  grid-area: footer;
  place-self: stretch;

  /* Flexbox to align the content in the cell */
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;

  /* FIXME: Border to highlight */
 /* border: 8px solid orange;*/
}

#main-div {
    width: 100%;
}

#title-div {
    background: blue;
    height: 100%;
}

#title {
    color: white;
    font-weight: bold;
    vertical-align: middle;
}

#row1{
    display:flex;
    flex-direction:row;
    justify-content: space-around;
    margin-bottom: 40px;
    width: 100%;
}

#column1{
    display:flex;
    flex-direction:column;
    margin-right: 40px;

}

#column2a{
    display:flex;
    flex-direction:column;
    margin-left: 40px;
    margin-right: 40px;
}

#column3{
    display:flex;
    flex-direction:column;
    margin-left: 40px;
}
</style>
