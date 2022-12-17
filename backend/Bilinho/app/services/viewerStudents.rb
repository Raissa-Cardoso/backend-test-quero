class ViewerStudents
    def initialize(params={})              
        @students=Students.order('created_at ASC')
        @studentsCount=[]
        @page=params[:page]
        @count=params[:count] 
        puts "OK"  
        puts @page, @count
    end

    def charge
        view
    end
 
    private

    def view      
        count=0
        while count<@count do 
            @studentsCount.push({
                id:@students[count].id, 
                name:@students[count].name, 
                cpf:@students[count].cpf,
                birthdate:@students[count].birthdate, 
                payment_method:@students[count].payment_method
            })
            count+=1
        end     
        @studentsCount        
    end
end