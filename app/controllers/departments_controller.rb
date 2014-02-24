class DepartmentsController < ApplicationController
before_filter :loadcus
  # GET /departments
  # GET /departments.json
  def index
  
    @departments = @customer.departments.all

  end

  # GET /departments/1
  # GET /departments/1.json
  def show
   
    @department = @customer.departments.find(params[:id])

  end

  # GET /departments/new
  # GET /departments/new.json
  def new

    @department = @customer.departments.build

  end

  # GET /departments/1/edit
  def edit

    @department = @customer.departments.find(params[:id])

  end

  # POST /departments
  # POST /departments.json
  def create
  
    @department = @customer.departments.create(params[:department])

      if @department.save
      
       redirect_to customer_departments_path(@customer), notice: 'Department was successfully created.' 
        
      else
        render action: new_customer_department_path(:id) 
       
      end

  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
  
    @department = @customer.departments.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to customer_departments_path(@customer), notice: 'Department was successfully updated.' }
      else
        format.html { render action: "edit" }
       
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
  
        
    @department = @customer.departments.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to customer_departments_path(@customer) }
    end
  end

  def jqedit
    # @customer = Customer.find(params[:id])
    if params[:oper]
      case params[:oper]
        when 'edit'
          item = @customer.departments.find(params[:id])
          item.attributes = params.except(:oper,:id,:controller,:action)
          item.save!
        when 'add'
          item = @customer.departments.create!(params.except(:oper,:id,:controller,:action))
          item.save!
        when 'del'
          if params[:id]
            @item = @customer.departments.find(params[:id])
            @item.destroy
          end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end
  
  private
  
  def loadcus
  
  	@customer = Customer.find(params[:customer_id])
  	
  end
end
