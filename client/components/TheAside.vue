<template>
  <aside class="aside">
    <h1>Barra lateral</h1>
	<!-- Mudar isso para um metodo -->
    <login v-if="!this.$store.getters.isAuthenticated"/>
    <logout v-else />
  </aside>
</template>

<script>
import Login from '@/components/Login.vue';
import Logout from '@/components/Logout.vue'
export default {
  components: {
    Login,
    Logout,
  }
}
</script>

<style>
.aside {
  /* Grid to position the cell itself */
  grid-area: aside;
  justify-self: stretch;

  /* Flexbox to align the content in the cell */
  display: flex;
  flex-direction: column;
  justify-content: start;
  align-items: center;

  /* FIXME: Border to highlight */
  border: 8px solid green;
}
</style>
