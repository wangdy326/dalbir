module AgreementsHelper
def getcust(id)
	cust = Customer.find_by_id(id)
	cust.customer_name
end

def getven(id)

vname = Vendor.find_by_id(id)
vname.vendor_name
end

def getitem(id)

itemname = Item.find_by_id(id)
itemname.item_name

end

def getdept(id)

deptt = Department.find_by_id(id)
deptt.department

end

end
