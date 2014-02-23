class Customer < ActiveRecord::Base
 	attr_accessible :address, 
                 :city, 
                 :customer_name, 
                 :email, 
                 :fax, 
                 :phone, 
                 :state, 
                 :zip
                 
	has_many :departments, :dependent => :destroy

	has_many :agreements, :foreign_key => :agreement_customer
	has_many :vendors, :through => :agreements
end