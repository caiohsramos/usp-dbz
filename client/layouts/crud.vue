<template>
  <div class="page">
    <main class="main">
      <nuxt/>
    </main>
  </div>
</template>

<script>

export default {

};
</script>

<style lang="scss">
html {
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
}

.page {
	width: calc(100vw - (100vw - 100%));
  height: 100vh;

  /* Grid to position the content */
  display: grid;

  grid-template-rows: 1fr 10fr 1fr;
  grid-template-columns: 3fr 9fr;

}

.main {
  /* Grid to position the cell itself */
  grid-area: main;
  justify-self: stretch;

  /* Flexbox to align the content in the cell */
  display: flex;
  flex-direction: column;
  justify-content: start;
  align-items: center;

}
</style>
