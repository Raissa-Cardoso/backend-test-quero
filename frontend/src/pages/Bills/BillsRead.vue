<template>
    <main>
        <h1 id="principal">Faturas</h1>
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
                <tr v-for="(bill,index) in bills" :key="index">
                    <td>{{bill.id}}</td>
                    <td>{{bill.due_date}}</td>                    
                    <td>{{bill.amount}}</td>
                    <td>{{bill.enrollment_id}}</td> 
                    <td>{{bill.status}}</td>
                </tr>
            </tbody>                   
        </table>      
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js'

 export default {
     name: 'BillsRead',
     data(){
        return {
            bills:[]
        }
     },
     mounted(){
        api.get('/bills').then(response=>{
            this.bills=response.data;            
        })
     }
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
 