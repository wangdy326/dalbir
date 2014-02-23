class Vendor < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  has_many :agreements
  has_many :customers, :through => :agreements
  attr_accessible :cont_person, 
                  :corp_add, 
                  :corp_city, 
                  :corp_email, 
                  :corp_fax, 
                  :corp_phone, 
                  :corp_state,
                  :corp_zip, 
                  :cross_dock_all, 
                  :cust_ser_cont, 
                  :cust_ser_fax, 
                  :cust_ser_ph, 
                  :edi, 
                  :extd_terms, 
                  :freight_all, 
                  :grand_op_all, 
                  :grand_op_terms, 
                  :payment_terms, 
                  :remit_add, 
                  :remit_city, 
                  :remit_state, 
                  :remit_zip, 
                  :sales_cont_mob, 
                  :sales_cont_person, 
                  :sales_cont_phone, 
                  :vendor_name, 
                  :web_url
  
  validates :vendor_name, presence: true
end

