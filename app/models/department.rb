class Department < ActiveRecord::Base
 	belongs_to :customer

 	attr_accessible :customer_id, 
                 :department, 
                 :buyer, 
                 :asst_buyer, 
                 :ics
	validates :department, uniqueness: true, presence: true
end

