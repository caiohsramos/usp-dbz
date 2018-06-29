<template>

  <div id="app">
    <article class="message" :class="accordionClasses">

    <div class="message-header" @click="toggleAccordion()">
        <p>Planejamento</p>
    </div>

    <div class="message-body">
        <div class="flex-container wrap">
            <!-- Example of Vue using some data -->
            <ul v-for="disciplina of disciplinas" :key="disciplina.id_disciplina">
                <course :code="disciplina.codigo_disciplina" status="cursada"/>
                <!-- <li>{{ disciplina.codigo_disciplina }}</li> -->
            </ul>
        </div>
    </div>
    </article>
    </div>
</template>


<script>
import Course from '@/components/Course.vue';

export default {
  components: {
    Course
  },

  data() {
    return {
      disciplinas: [],
      isOpen: true
    };
  },

  methods: {
    toggleAccordion: function() {
      this.isOpen = !this.isOpen;
    }
  },

  computed: {
    accordionClasses: function() {
      return {
        'is-closed': !this.isOpen,
        'is-primary': this.isOpen,
        'is-dark': !this.isOpen
      };
    }
  },

  // Initialize elements in 'data' before rendering page.
  // More info at: https://nuxtjs.org/api/
  async asyncData({ app }) {
    return {
      disciplinas: await app.$axios.$get("/disciplinas")
    }
  }
}
</script>

<style lang="scss">

.flex-container {
  display: flex;
  padding: 0;
  margin: 0;
  list-style: none;
  border: 1px solid silver;
  -ms-box-orient: horizontal;
}

.nowrap  {
  -webkit-flex-wrap: nowrap;
  flex-wrap: nowrap;
}

.wrap    {
  -webkit-flex-wrap: wrap;
  flex-wrap: wrap;
}
.wrap li {
  background: gold;
}

.wrap-reverse         {
  -webkit-flex-wrap: wrap-reverse;
  flex-wrap: wrap-reverse;
}
.wrap-reverse li {
  background: deepskyblue;
}

.flex-item {
  background: tomato;
  padding: 5px;
  width: 200px;
  height: 100px;
  margin: 10px;

  line-height: 100px;
  color: white;
  font-weight: bold;
  font-size: 2em;
  text-align: center;
}

.message {
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
}

.message-header {
    cursor: pointer;
    color: blue;
}

.message-body   {
    padding: 0;
    max-height: 10em;
    overflow: hidden;
    transition: 0.3s ease all;
}

.is-closed .message-body {
    max-height: 0;
}
</style>
