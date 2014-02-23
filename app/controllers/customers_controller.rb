class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @states = ""
    State.all.each do |state|
      @states += state.state + ":" + state.stcode + ";" 
    end
    @states = @states[0..@states.length - 2]
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  
    @customer = Customer.find(params[:id])

  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

      if @customer.save
    	
    	    redirect_to customers_path
      
      else
	
		  	redirect_to new_customer_path
      end
    
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  def jqedit
    if params[:oper]
      case params[:oper]
        when 'edit'
          customer = Customer.find(params[:id])
          customer.attributes = params.except(:oper,:id,:controller,:action)
          customer.save!
        when 'add'
          customer = Customer.new(params.except(:oper,:id,:controller,:action))
          customer.save!
        when 'del'
          if params[:id]
            ids = params[:id].split ','
            Customer.destroy ids
          end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end
end
