class Po < ActiveRecord::Base

belongs_to :agreement
 attr_accessible :agreement_id, 
                 :bill_to_add, 
                 :pono, 
                 :bill_to_id, 
                 :bill_to_name, 
                 :bill_to_phone, 
                 :desc, 
                 :item_cost, 
                 :item_desc, 
                 :item_id, 
                 :po_date, 
                 :po_date_reqstd,  
                 :po_status, 
                 :po_total_amount, 
                 :qty_string, 
                 :vendor_add, 
                 :vendor_name, 
                 :vendor_phone

validates :pono, :uniqueness => true

before_save :update_data

private

def update_data
	@agreement = Agreement.find(self.agreement_id)
	self.item_id = @agreement.item
	self.bill_to_id = @agreement.agreement_customer
	self.vendor_name = @agreement.agreement_vendor
	
	tot = @agreement.pos.sum('qty_string')
	@agreement.update_attributes(:purchasedqty => tot )
end

end

