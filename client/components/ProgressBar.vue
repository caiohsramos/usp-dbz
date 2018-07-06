<template>
    <div class="progressbar">
        <div class="bar" id="bg" v-bind:style="{background: 'lightgrey', width: 200 + 'px'}">
            <div class="bar" id="laranja" v-bind:style="{background: 'orange', width:doneProgress + doingProgress + '%'}"/>
            <div class="bar" id="azul" v-bind:style="{background: 'blue', width:doneProgress + '%'}"/>
        </div>
    </div>
</template>


<script>
export default {
    props: ["stepsDone", "stepsDoing", "totalSteps"],
    /*data(){
        return{
            stepsDone:92,
            stepsDoing:4,
            totalSteps:115
        }
    },*/
    computed:{
        doneProgress: function () {
            return this.stepsDone / this.totalSteps * 100
        },
        doingProgress: function () {
            return this.stepsDoing/ this.totalSteps * 100
        }
    }
}

</script>

<style lang="scss">
.progressbar{
}
.bar{
     height: 20px;
}
#bg{
    z-index: -10;
    position: relative;
}
#laranja{
    position: absolute;
    z-index: 0;
}
#azul{
    position: absolute;
    z-index: 10;
}
</style>
