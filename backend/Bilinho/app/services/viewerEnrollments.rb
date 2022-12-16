class ViewerEnrollments
    def initialize(params={})     
        @enrollments=Enrollment.order('created_at ASC')
        @enrollmentCount = []  
        @page=params[:page]
        @count=params[:count]     
        @bills=[]           
    end

    def charge
        view        
    end

    private

    def view       
        count=0
        while count<@count do            
            @bills=Bill.where(enrollment_id:@enrollments[count].id)            
            @enrollmentCount.push({
                id:@enrollments[count].id,
                student_id:@enrollments[count].student_id,
                amount:@enrollments[count].amount,
                installments:@enrollments[count].installments,
                due_day:@enrollments[count].due_day,
                bills:@bills
            })          
            count+=1
        end
        @enrollmentCount        
    end    
end