module ApplicationHelper

def getcusname(id)

	cus = Customer.find(id)
	cus.customer_name
end

end
