<template>
   <main>
        <h1 id="principal">Seja bem-vindo(a) ao projeto Bilinho</h1>
   </main>
</template>

<script>
export default {
    name: 'HomePage'
}
</script>

<style scoped>
    main{
        background-color: var(--color-background-home);
    }
    @media (max-width:700px){
        #principal{
            font-size: 1.5em;
        }
    }
    

</style>
