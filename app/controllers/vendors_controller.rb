class VendorsController < ApplicationController
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
    @states = ""
    State.all.each do |state|
      @states += state.state + ":" + state.stcode + ";" 
    end
    @states = @states[0..@states.length - 2]
  end

  def items
   @vendor = Vendor.find(params[:vendor_id])
 # 	raise @vendor.inspect
   @items = @vendor.items.all
  end
  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])

  end

  # GET /vendors/new
  # GET /vendors/new.json
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(params[:vendor])
  
	    
      if @vendor.save
       
	 redirect_to vendors_path, notice: 'Vendor was successfully created.' 
      else
       
         redirect_to new_vendor_path
       
      end
   
  end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_path }
      format.json { head :no_content }
    end
  end

  def jqedit
    if params[:oper]
      case params[:oper]
        when 'edit'
          vendor = Vendor.find(params[:id])
          vendor.attributes = params.except(:oper,:id,:controller,:action)
          vendor.save!
        when 'add'
          vendor = Vendor.new(params.except(:oper,:id,:controller,:action))
          vendor.save!
        when 'del'
          if params[:id]
            ids = params[:id].split ','
            Vendor.destroy ids
          end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end
end
