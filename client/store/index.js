import Vuex from 'vuex';
import VuexPersistence from 'vuex-persist';

const vuexLocal = new VuexPersistence({
  storage: window.localStorage,
})

export default () => {
  return new Vuex.Store({
    plugins: [vuexLocal.plugin],

    state: {
      email: '',
      token: '',
      ingresso: 0,
      u_id: null,
      temp: null,
      disc_state: {}, 
    },

    getters: {
      isAuthenticated(state) {
        return state.token !== '';
      },
      disc_semestre(state){
        return id => state.disc_state[id];
      }

    },

    mutations: {
      setEmail(state, { email }) {
        state.email = email;
      },

      setToken(state, { token }) {
        state.token = token;
          },
      setUid(state, { id }) {
        state.u_id = id;
      },
      addDisc(state, {id , prop}){
          state.disc_state[id] = prop;
      },
      setDisc_state(state, {value}){
          state.disc_state = value;
      },
      setTemp(state, {value}){
          state.temp = value;
      },
      setIngresso(state, { ano }){
          state.ingresso = ano;
      }
    }
  });
}
