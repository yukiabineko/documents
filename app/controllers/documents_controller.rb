class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @input_count = @document.document_items.all.count
    @select_count = select_zerocount?
  end

  # 選択
  def new
    @document = Document.new
  end
  
  #入力
  def new2
    @document = Document.new
  end

  #表示
  def new3
    @document = Document.new
  end
  

  def edit
  end

  # POST /documents
  # 選択createw
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to "/documents_items/new/"+@document.id.to_s }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
#入力create
  def create2
    @document = Document.new(document_params)
    if @document.save
      redirect_to "/documents_items/new2/"+@document.id.to_s 
    else
      render :new2
    end    
    
  end
  #表示create
  def create3
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_url
    else
      render :new3
    end    
    
  end    

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #input select modal
  def data
   @document = Document.find(params[:id])
  end
#選択式保護者処理
  def selectform
    @document = Document.find(params[:id])
    answer = Answer.new
    answer.document_id = params[:id]
    reply = ""
    100.times do |i|
      str = "rd"+i.to_s
      if params[str].present?
        reply += params[str] + ":"
      end  
    end  
    answer.reply = reply
    if answer.save
     redirect_to root_url
    else 
      render :selectform
    end 
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params[:document][:pdf_link] = view_url(params[:document][:service],params[:document][:service_url])
      params.require(:document).permit(:title, :memo, :pdf_link, :deadline)
    end
end
