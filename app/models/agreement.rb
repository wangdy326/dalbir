class Agreement < ActiveRecord::Base

  attr_accessible :agreement_customer, 
                  :agreement_customer_dept,
                  :agreement_vendor, 
                  :case_cost_w, 
                  :agreementno, 
                  :agreement_name, 
                  :agreement_status, 
                  :case_cost, 
                  :commitment_string, 
                  :cross_dock_all, 
                  :fob_point, 
                  :item, 
                  :min_com, 
                  :min_per_order, 
                  :mktg_all, 
                  :pricing_option, 
                  :unit_cost, 
                  :department, 
                  :purchasedqty,
                  :agreementdate

  belongs_to :customers
  belongs_to :vendors

  has_many :pos

  validate :agreement_customer, presence: true
end

