<template>
  <nav class="navbar">
      <div class="nav-top">
        <h1>DBZ</h1>
      </div>
      <div class="nav-list">
            <ul v-for="i in (n + 1)" :key="i">
            <li v-if="i==1">Geral</li>
            <li v-if="i>1 && i< n+1">{{i-1}}</li>
            <li v-if="i==n+1"> <div @click="add()">Adicionar</div></li> 
        </ul>
      </div>
      <div class="line"></div>
  </nav>
</template>
<script>
export default{
    data(){
        return{
            n: this.$store.state.n_semestre,
        }
    },
    created(){
        this.$store.commit("setSem",{n:9 })
    },
    methods:{
        add(){
            let j = this.$store.state.n_semestre +1;
            this.$store.commit("setSem",{n: j});
            this.n = j;
            //this.$forceUpdate();
        }
    }
}
</script>
<style>
ul{
    list-style-type: none;
    display: inline;
    float:left;
}
.list{
    display: inline;
}
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
    vertical-align:middle;
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
