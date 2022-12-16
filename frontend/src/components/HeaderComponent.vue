<template>
    <header>
        <nav class="container">
            <ul class="navegacao">
                    <li>                         
                        <router-link to="/" class="selected">Home</router-link>      
                    </li>   
                    <li>
                        <router-link to="/studentsRead">Alunos</router-link>                         
                    </li>
                    <li>
                        <router-link to="/enrollmentsRead">Matrículas</router-link> 
                    </li>
                    <li>
                        <router-link to="/billsRead">Faturas</router-link>  
                    </li>
                </ul>
        </nav>
    </header>
</template>

<script>
export default {
    name: 'HeaderComponent'
}
</script>

<style scoped>
    header{
        background-color: var(--color-background-nav);
        height: 60px;
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;  
    }
    .navegacao{  
        list-style: none;           
        display: flex;            
        padding: 0; 
        margin: 0 0 0 0; 
    }
    .navegacao li{
        display: inline-block;
        padding: 1vw;            
    }
    .container{
        width: 90%;
    }

</style>
