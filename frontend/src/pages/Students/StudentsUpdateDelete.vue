<template>
    <main>
        <h1>Alterar/Deletar aluno</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="name">ID:</label>
                    <p id="name">{{this.student.id}}</p>
                </div>
                <div class="divForm">
                    <label for="name">Nome:</label>
                    <input type="text" id="name" v-model="name" placeholder={{this.student.name}}/>
                </div>
                <div class="divForm">
                    <label for="cpf">CPF:</label>
                    <input type="text" id="cpf" v-model="cpf" placeholder={{this.student.cpf}}/>
                </div>
                <div class="divForm">
                    <label for="birthdate">Data de nascimento:</label>
                    <input type="text" id="birthdate" v-model="birthdate" placeholder={{this.student.birthdate}}/>  
                </div>
                <div class="divForm">
                    <label for="payment_method">Método de pagamento:</label>
                    <input type="text" id="payment_method" v-model="paymentMethod" placeholder={{this.student.payment_method}}/>  
                </div>
                <div class="divButtons">
                    <div class="buttonUpdate">                    
                        <button v-on:click="update">Alterar</button>
                    </div>
                    <div class="buttonDelete">                    
                        <button v-on:click="toDelete">Deletar</button>
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
 import api from '@/services/api.js'


 export default {
     name: 'StudentsUpdateDelete',
     
 
     data(){
        return {
            student:[],
            id:this.$route.params.id,            
            name:"",
            cpf:"",
            birthdate:"",
            paymentMethod:""                   
        }
     },
     mounted(){  
        api.get(`/students/${this.id}`).then(response=>{
            this.student=response.data.data;
            this.id=this.student.id
            this.name=this.student.name
            this.cpf=this.student.cpf
            this.birthdate=this.student.birthdate
            this.paymentMethod=this.student.payment_method            
        })
     },   
     methods: {       
        update: function(){                                 
            api.put(`/students/${this.id}`, 
            {
                name:this.name,
                cpf:this.cpf, 
                birthdate:this.birthdate,                    
                payment_method: this.paymentMethod                
            })
        },
        toDelete: function(){                                 
            api.delete(`/students/${this.id}`, 
            {
                name:this.name,
                cpf:this.cpf, 
                birthdate:this.birthdate,                    
                payment_method: this.paymentMethod                
            })
            window.open("/studentsRead")
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