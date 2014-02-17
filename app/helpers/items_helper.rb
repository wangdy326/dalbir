module ItemsHelper
def itemven(id)
	@arr = Vendor.find_by_id(params[:id])
	p @arr
end
end
