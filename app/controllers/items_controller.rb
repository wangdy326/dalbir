class ItemsController < ApplicationController
before_filter :load_vendor

  # GET /items
  # GET /items.json
  def index
  
   # 	raise @vendor.inspect
    @items = @vendor.items.all

  end

  # GET /items/1
  # GET /items/1.json
  def show
 
     @item = @vendor.items.find(params[:id])

  end

  # GET /items/new
  # GET /items/new.json
   def new

	
	@item = @vendor.items.build

  end
  
  def create

	
	@item = @vendor.items.create!(params[:item])
	
	if @item.save
	
		redirect_to vendor_items_path(@vendor)	
	
	else
	
		redirect_to new_vendor_item_path(:id)
	
	end
  end
  # GET /items/1/edit
  def edit
  
     @item = @vendor.items.find(params[:id])
  
  end

  # POST /items
  # POST /items.json

  # PUT /items/1
  # PUT /items/1.json
  def update


    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to vendor_items_path(@vendor), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy

    @item = @vendor.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to vendor_items_path(@vendor) }
      format.json { head :no_content }
    end
  end

  def jqedit
    if params[:oper]
      case params[:oper]
        when 'edit'
          item = @vendor.items.find(params[:id])
          item.attributes = params.except(:oper,:id,:controller,:action)
          item.save!
        when 'add'
          item = @vendor.items.create!(params.except(:oper,:id,:controller,:action))
          item.save!
        when 'del'
          if params[:id]
            @item = @vendor.items.find(params[:id])
            @item.destroy
          end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end

   private
   def load_vendor
      @vendor = Vendor.find(params[:vendor_id])
   end
end
