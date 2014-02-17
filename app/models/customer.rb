class Customer < ActiveRecord::Base
has_many :departments, :dependent => :destroy

has_many :agreements, :foreign_key => :agreement_customer
has_many :vendors, :through => :agreements
 attr_accessible :address, 
                 :city, 
                 :customer_name, 
                 :email, 
                 :fax, 
                 :phone, 
                 :state, 
                 :zip

end

