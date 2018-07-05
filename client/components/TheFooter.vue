<template>
  <footer class="footer">
    <div>
        <div class="bar">
            <p>Obrigatórias</p>
            <progress-bar :stepsDone="92" :stepsDoing="4" :totalSteps="115"/>
        </div>
        <div class="bar">
            <p>Eletivas</p>
            <progress-bar :stepsDone="22" :stepsDoing="16" :totalSteps="56"/>
        </div>
       <!-- <div class="bar">
            <p>Livres</p>
            <progress-bar :stepsDone="4" :stepsDoing="0" :totalSteps="24"/>
        </div> -->
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
</style>
