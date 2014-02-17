module PosHelper

def getcustname(id)

	cus = Customer.find_by_id(id)
	cus.customer_name
	
end

def getcustadd(id)

	cus = Customer.find_by_id(id)
	cus.address + " " + cus.city + " " + cus.state + " " + cus.zip
end

def getvenname(id)

	ven = Vendor.find_by_id(id)
	ven.vendor_name
end

def getvenadd(id)

	cus = Vendor.find_by_id(id)
	cus.corp_add + " " + cus.corp_city + " " + cus.corp_state + " " + cus.corp_zip
end

def getprice(id)

	@agr = Agreement.find_by_id(id)
	@agr.case_cost_w
end

def getpricee(id)

	@agr = Agreement.find_by_id(id)
	@agr.case_cost
end

def getitemname(id)

	items = Item.find_by_id(id)
	items.item_name

end

def getfob(id)

items = Item.find_by_id(id)

items.item_shipping_point

end


end
