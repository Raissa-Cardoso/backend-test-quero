<template>
    <main>
        <h1>Cadastro de novo aluno</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="name">Nome:</label>
                    <input type="text" id="name" v-model="name"/>
                </div>
                <div class="divForm">
                    <label for="cpf">CPF:</label>
                    <input type="text" id="cpf" v-model="cpf"/>
                </div>
                <div class="divForm">
                    <label for="birthdate">Data de nascimento:</label>
                    <input type="text" id="birthdate" v-model="birthdate"/>  
                </div>
                <div class="divForm">
                    <label for="payment_method">Método de pagamento:</label>
                    <input type="text" id="payment_method" v-model="paymentMethod"/>  
                </div>
                <div class="divButtons">
                    <div class="buttonCreate">                    
                        <button v-on:click="create">Cadastrar</button>
                    </div>
                    <div class="buttonBack">                    
                        <button>
                            <router-link to="/studentsRead">Voltar</router-link> 
                        </button>
                    </div>
                </div>
            </form>       
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js';
 
 export default {
    name: 'StudentsCreate', 
    data(){
        return {
            name:"",
            cpf:"",
            birthdate:"",
            paymentMethod:""
        }
     },
     methods: {
        create: function(){             
            api.post('/students', 
            {
                name:this.name,
                cpf:this.cpf, 
                birthdate:this.birthdate,                    
                payment_method: this.paymentMethod                
            })/*.then(response=>{
                alert(response)
                alert("Aluno criado com sucesso")
            }).catch(error=>{
                alert(error)
                alert("Aluno não foi criado")
            })*/
        }
     }
 }
 </script>
 
 <style scoped>     
     @media (max-width:700px){
         #principal{
             font-size: 1.5em;
         }
     }
     
 
 </style>