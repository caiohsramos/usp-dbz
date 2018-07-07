<template>
  <aside class="aside">
      <div class="top">
        <login v-if="!this.$store.getters.isAuthenticated"/>
        <logout v-else />
      </div>
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
  border:1px solid #4C72CB;
  /* FIXME: Border to highlight */
}
.top {
      background: #4C72CB;
      display:flex;  
      width: fill;
          height: 200px;
          justify-content:center;
      }
</style>
