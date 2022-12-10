class Enrollment < ApplicationRecord
    validates :amount, :installments, :due_day, presence: true
    validates :amount, numericality: {greater_than:0}
    validates :installments, numericality: {greater_than:1}
    validates :due_day, inclusion: {in: 1...32}  
    belongs_to :student
    has_many :bills, :dependent => :destroy

    after_create :create_bills   
    before_update :update_bills

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

    def update_bills
        bills.map(&:destroy) 
        create_bills       
    end
end
