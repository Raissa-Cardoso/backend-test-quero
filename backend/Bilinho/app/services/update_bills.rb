class UpdateBills

    def initialize(params={})
        @enrollment_id=params[:enrollment_id]        
        @bills=Bill.where(enrollment_id:params[:enrollment_id])        
    end

    def charge        
        update_bills
    end
    
    private

    def update_bills                       
        @bills.each do |bill| 
            bill.destroy            
        end         
        "success"      
    end
end