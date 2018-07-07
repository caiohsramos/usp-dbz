<template>
  <nav class="navbar">
      <div class="nav-top">
        <h1>DBZ</h1>
      </div>
      <div class="nav-list">
        <div> lista dos semestres com links</div>
      </div>
      <div class="line"></div>
  </nav>
</template>

<style>
.navbar {
  /* Grid to position the cell itself */
  grid-area: navbar;
  place-self: stretch;

  /* Flexbox to align the content in the cell */
  /*display: flex;
  flex-direction: row;*/
  justify-content: center;
  align-items: center;

}

.nav-top{
display: flex;
    flex-grow: 2;
    flex-direction: row;
    justify-content:center;
    padding: 10px;
    height: 3em;
    background-color: #4C72CB;
}

.nav-list{
   padding-left: 10px;
    display: flex;
    flex-grow: 1;
    flex-direction: row;
    flex-basis: 100px;
    justify-self: start;
    align-self: center;

    box-sizing: border-box;
    width: fill; 
    color: #1E64CD;
    background-color: white; 
    height: 3em;

}
.line{
    background: #1E64CB;
    height: 1px;
    width: fill;
}

</style>
