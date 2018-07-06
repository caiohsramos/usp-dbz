<template>
  <footer class="footer">
    <div id="main-div">
        <div id="title-div">
        <p id="title">Contagem de créditos(Total: w/W)</p>
        </div>
        <div id="row1">
            <div id="column1">
                <p>Obrigatórias</p>
                <progress-bar :stepsDone="92" :stepsDoing="4" :totalSteps="115"/>
            </div>
            <div id="column2">
                <p>Eletivas</p>
                <progress-bar :stepsDone="22" :stepsDoing="16" :totalSteps="56"/>
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

#column2{
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
