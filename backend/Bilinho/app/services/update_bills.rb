class UpdateBills
    def update_bills
        bills.map(&:destroy) 
        create_bills
    end
end