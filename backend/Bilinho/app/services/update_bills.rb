class UpdateBills

    def initialize(params={})
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
        #result=CreateBills({enrollment_id:@enrollment_id}).charge
        #result
    end
end