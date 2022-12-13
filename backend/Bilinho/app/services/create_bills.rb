class CreateBills
    
    def initialize(params={})
        @enrollment=Enrollment.find(params[:enrollment_id])
        @enrollment_id=@enrollment.id
        @due_day=@enrollment.due_day
        @enrollment_amount=@enrollment.amount
        @installments=@enrollment.installments
        @bills=[]        
    end

    def charge        
        define_date
    end
    
    private

    def define_date
        day=Date.today.day  
        year=Date.today.year 
        month=Date.today.month  
        if (day>@due_day)
            month=Date.today.month+1  
        end               
            
        count=0
        next_month=0              
        while count<@installments do 
            if(month<=12)
                month=month+next_month
                next_month=1            
            end
            if(month>12)            
                month=month-12
                year=year+1
                next_month=1
            end
            if (month==2 && @due_day>=29)
                @due_date=Date.today.change(day: 28,month:month, year: year)
                insert_bills(@due_date)          
            else
                @due_date= Date.today.change(day: @due_day,month:month, year: year)
                insert_bills(@due_date)                                                
            end                      
            count+=1
        end 
        create_bills
    end   
    
    def insert_bills(due_date)
        @bills.push({
                    amount: @enrollment_amount/@installments,
                    due_date: due_date,
                    status: "open",                   
                    enrollment_id: @enrollment_id
                })
    end
    
    def create_bills             
        @bills.each do |bill|            
            Bill.create({
                    amount: bill[:amount],
                    due_date: bill[:due_date],
                    status: bill[:status],                   
                    enrollment_id: bill[:enrollment_id]                                          
            }) 
        end
        "success"
    end
end