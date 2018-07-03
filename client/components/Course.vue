<template>
    <div class="course">
        <div class="course_status" @click="increment()">{{status}}</div>
        <div class="course_counter">{{counter}}</div>
        <div> {{code}}  </div>
    </div>

</template>


<script>
export default {
    props: ["code", "status"],
    //bloqueadas cursadas e planejada

    data(){
        return{
            counter:0
        }
    },
    methods:{
        increment(){
            this.counter++;
        }
    }
}

</script>

<style lang="scss">
.course{
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    margin: 10px;
}

.course_status {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

    background-color: $primary-color;
    color: $light-color;
    width: 5rem;
    height: 5rem;
    border-radius: 100%;
}

.course_counter {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

    background-color: white;
    color: $dark-color;
    border-style: solid;

    border-width: 0.2rem;
    border-color: black;
    border-radius: 100%; 

    width: 1.5rem;
    height: 1.5rem;
}
</style>
