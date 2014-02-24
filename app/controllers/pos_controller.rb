class PosController < ApplicationController
before_filter :loadagr


  # GET /pos
  # GET /pos.json
  def index
    @pos = @agreement.pos.all
  end

  # GET /pos/1
  # GET /pos/1.json
  def show

    @po = @agreement.pos.find(params[:id])

  end

  # GET /pos/new
  # GET /pos/new.json
  def new

    @po = @agreement.pos.build

  end

  # GET /pos/1/edit
  def edit
    @po = @agreement.pos.find(params[:id])
  end

  # POST /pos
  # POST /pos.json
  
   def create

	
	@po = @agreement.pos.create!(params[:po])
		
	if @po.save
	
		redirect_to agreement_pos_path(@agreement)	
	
	else
	
		redirect_to new_agreement_po_path(:id)
	
	end
  end


  # PUT /pos/1
  # PUT /pos/1.json
  def update
  
    @po = @agreement.pos.find(params[:id])

    respond_to do |format|
    
      if @po.update_attributes(params[:po])
        
        format.html { redirect_to agreement_pos_path(@agreement), notice: 'Po was successfully updated.' }
        
      else
        
        format.html { render action: "edit" }
        
      end
    end
  end

  # DELETE /pos/1
  # DELETE /pos/1.json
  def destroy
    @po = @agreement.pos.find(params[:id])
    @po.destroy

    respond_to do |format|
    
      format.html { redirect_to agreement_pos_path(@agreement) }
    end
  end

  def jqedit
    if params[:oper]
      case params[:oper]
        when 'edit'
          po = @agreement.pos.find(params[:id])
          po.attributes = params.except(:oper,:id,:controller,:action)
          po.save!
        when 'add'
          po = @agreement.pos.create!(params.except(:oper,:id,:controller,:action))
          po.save!
        when 'del'
          if params[:id]
            @po = @agreement.pos.find(params[:id])
            @po.destroy
          end
      end
    end
    respond_to do |format|
      format.js { }
    end
  end
  
  private 
  
  def loadagr
  
  	@agreement = Agreement.find(params[:agreement_id])
  
  end

end