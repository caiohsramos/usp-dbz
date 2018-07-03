<template>
    <div class="progressbar">
        <div class="bar" v-bind:style="{background: 'lightgrey', width: 200 + 'px'}">
            <div class="bar" v-bind:style="{background: 'orange', width:doneProgress + doingProgress + '%'}"/>
            <div class="bar" v-bind:style="{background: 'blue', width:doneProgress + '%'}"/>
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
.bar{
     position: absolute;
     height: 20px;
}
</style>
