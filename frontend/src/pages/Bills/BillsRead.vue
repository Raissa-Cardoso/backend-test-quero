<template>
    <main>
        <h1 id="principal">Faturas</h1>
        <div class="tableHeader">
            <div class="tableSearch">
                <input type="text" placeholder="Digite o ID da Matrícula" v-model="enrollmentId"/>
                <button type="submit" v-on:click="search">Filtrar</button>
            </div>          
        </div>
        <div class="divTable">
            <table class='billsTable'>
                <thead>
                    <tr>
                        <th>ID da fatura</th>
                        <th>Data de vencimento</th>
                        <th>Valor da fatura</th>
                        <th>ID da matrícula</th>                   
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(bill,index) in billsFilter" :key="index">
                        <td>{{bill.id}}</td>
                        <td>{{bill.due_date}}</td>                    
                        <td>{{bill.amount}}</td>
                        <td>{{bill.enrollment_id}}</td> 
                        <td>{{bill.status}}</td>
                    </tr>
                </tbody>                   
            </table>   
        </div>
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js'

 export default {
     name: 'BillsRead',
     data(){             
        return {
            bills:[],
            billsFilter:[],
            enrollmentId:'', 
            enrollmentIdInt:''            
        }
     },
     mounted(){
        api.get('/bills').then(response=>{
            this.bills=response.data;            
        })
     },
     methods: {
        search: function(){                      
            if (this.enrollmentId!==""){
                this.enrollmentIdInt=parseInt(this.enrollmentId)  
                this.billsFilter=this.bills.filter(bill=>bill.enrollment_id===this.enrollmentIdInt)            
            } else{
                this.billsFilter=this.bills 
            }
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
 