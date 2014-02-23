class AgreementsController < ApplicationController
  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = Agreement.all
    @customers = ""
    Customer.all.each do |customer|
      @customers += customer._id.to_s + ":" + customer.customer_name + ";" 
    end
    @customers = @customers[0..@customers.length - 2]

    @vendors = ""
    Vendor.all.each do |vendor|
      @vendors += vendor._id.to_s + ":" + vendor.vendor_name + ";" 
    end
    @vendors = @vendors[0..@vendors.length - 2]
  end

def cus_departments
#    https://github.com/christianreyes/updating-drop-down/blob/master/app/controllers/home_controller.rb
#    @characters = Character.all.where(:movie_id => params[:movie_id])
    @customer = Customer.find_by_id(params[:customer_id])
    
    @departments = ""
    @customer.departments.each do |department|
      @departments += department._id.to_s + ":" + department.department + ";" 
    end
    @departments = @departments[0..@departments.length - 2]
    respond_to do |format|
      format.json { render :json => @departments, status: 200 }
    end
  end
def ven_items
#    https://github.com/christianreyes/updating-drop-down/blob/master/app/controllers/home_controller.rb
#    @characters = Character.all.where(:movie_id => params[:movie_id])
    @vendor = Vendor.find(params[:vendor_id])

    @items = ""
    @vendor.items.each do |item|
      @items += item._id.to_s + ":" + item.item_name + ";"
    end
    @items = @items[0..@items.length - 2]
    respond_to do |format|
      format.json { render json: @items, status: 200 }
    end
  end


  # GET /agreements/1
  # GET /agreements/1.json
  def show
    @agreement = Agreement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agreement }
    end
  end

  # GET /agreements/new
  # GET /agreements/new.json
  def new
    @customers = Customer.all
    @agreement = Agreement.new

  end

  # GET /agreements/1/edit
  def edit
    @agreement = Agreement.find(params[:id])
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(params[:agreement])
	#@agreement.inspect
     if @agreement.agreementdate.blank?
	
	  	   @agreement.agreementdate = Date.today
   
      end
      @agreement.agreement_status = 'Active'
      if @agreement.save
	
			redirect_to agreements_path      
      
       else
       
       		redirect_to new_agreement_path
      end
    
  end

  # PUT /agreements/1
  # PUT /agreements/1.json
  def update
    @agreement = Agreement.find(params[:id])

    respond_to do |format|
      if @agreement.update_attributes(params[:agreement])
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.destroy

    respond_to do |format|
      format.html { redirect_to agreements_url }
      format.json { head :no_content }
    end
  end

  def jqedit
    if params[:oper]
      case params[:oper]
        when 'edit'
          agreement = Agreement.find(params[:id])
          agreement.attributes = params.except(:oper,:id,:controller,:action)
          agreement.save!
        when 'add'
          agreement = Agreement.new(params.except(:oper,:id,:controller,:action))
          agreement.save!
        when 'del'
          if params[:id]
            ids = params[:id].split ','
            Agreement.destroy ids
          end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end
end
