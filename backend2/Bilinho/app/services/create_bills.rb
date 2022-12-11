class CreateBills

    #attr_reader :enrollment, :amount, :due_day, :installments
    def create_bills

        day=Date.today.day  
        year=Date.today.year 
        month=Date.today.month  
        if (day>due_day)
            month=Date.today.month+1  
        end               
            
        count=0
        next_month=0              
        while count<installments do 
            if(month<=12)
                month=month+next_month
                next_month=1            
            end
            if(month>12)            
                month=month-12
                year=year+1
                next_month=1
            end
            if (month==2 && due_day>=29)
                bills.create(
                    :amount => amount/installments,                
                    :due_date => Date.today.change(day: 28,month:month, year: year),                         
                )    
            else
                bills.create(
                    :amount => amount/installments,                
                    :due_date => Date.today.change(day: due_day,month:month, year: year),                         
                )    
            end                             
            count+=1
        end 
    end            


end