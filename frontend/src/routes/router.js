import {createRouter, createWebHistory} from 'vue-router';
import HomePage from '@/pages/HomePage'
import StudentsRead from '@/pages/Students/StudentsRead'
import StudentsCreate from '@/pages/Students/StudentsCreate'
import StudentsUpdateDelete from '@/pages/Students/StudentsUpdateDelete'
import EnrollmentsRead from '@/pages/Enrollments/EnrollmentsRead'
import EnrollmentsCreate from '@/pages/Enrollments/EnrollmentsCreate'
import EnrollmentsUpdateDelete from '@/pages/Enrollments/EnrollmentsUpdateDelete'
import BillsRead from '@/pages/Bills/BillsRead'


const routes=[
    {
        path:'/',       
        component:HomePage
    },
    {
        path:'/studentsRead',        
        component:StudentsRead
    },
    {
        path:'/studentsCreate',        
        component:StudentsCreate
    }, 
    {
        path:'/studentsUpdateDelete/:id',        
        component:StudentsUpdateDelete,
        props: true
    },     
    {
        path:'/enrollmentsRead',        
        component:EnrollmentsRead
    },
    {
        path:'/enrollmentsCreate',        
        component:EnrollmentsCreate
    },
    {
        path:'/enrollmentsUpdateDelete/:id',        
        component:EnrollmentsUpdateDelete,
        props: true
    }, 
    {
        path:'/billsRead',        
        component:BillsRead
    },     
]
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router;

