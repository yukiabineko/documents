class DocumentItemsController < ApplicationController
  before_action :set_document_item, only: [:show, :edit, :update, :destroy]

  # GET /document_items
  # GET /document_items.json
  def index
    @document_items = DocumentItem.all
  end

  # GET /document_items/1
  # GET /document_items/1.json
  def show
  end
#選択式
  def new
    @document = Document.find(params[:id])
  end
#選択式2  
 def new2
    @document = Document.find(params[:id])
    @item_count = @document.document_items.all.count
 end

  # GET /document_items/1/edit
  def edit
  end

  # POST /document_items
  # POST /document_items.json
  def create
    @document = Document.find(params[:document_id])
    #未入力処理
    if params[:content].blank?
      flash[:danger] = "必ず入力してください。" 
      redirect_to "/documents_items/new/"+@document.id.to_s
    else
      @documents = Document.where(memo: @document.memo,randam: @document.randam)  #メモの内容 ランダム文字列で判別
      randam = SecureRandom.alphanumeric(10)
      @documents.each do |document|
        record = document.document_items.build(content: params[:content])
        record.randam = randam
        record.document_id = document.id
        record.save
      end
    @document_item = DocumentItem.all.last
    redirect_to "/documents_selects/new/"+@document_item.id.to_s
    end     
  end


  def create2
    @document = Document.find(params[:document_id])
    randam = SecureRandom.alphanumeric(10)
    if params[:content].blank?
      flash[:danger] ="必ず入力ください。"
      redirect_to "/documents_items/new2/"+@document.id.to_s
    else
      @documents = Document.where(memo: @document.memo, randam: @document.randam)
      @documents.each do |document|
      record = document.document_items.build(content: params[:content])
      record.randam = randam
      record.document_id = document.id
      record.save
    end  
    @document_item =DocumentItem.all.last
    flash[:danger] = "引き続き項目作るならフォーム入力して送信を終わりなら終了ボタン押してください"
    redirect_to "/documents_items/new2/"+@document_item.document_id.to_s  
    end  
    
  end  

  # PATCH/PUT /document_items/1
  # PATCH/PUT /document_items/1.json
  def update
    respond_to do |format|
      if @document_item.update(document_item_params)
        format.html { redirect_to @document_item, notice: 'Document item was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_item }
      else
        format.html { render :edit }
        format.json { render json: @document_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_items/1
  # DELETE /document_items/1.json
  def destroy
    @document_item.destroy
    respond_to do |format|
      format.html { redirect_to document_items_url, notice: 'Document item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_item
      @document_item = DocumentItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_item_params
      params.require(:document_item).permit(:content, :document_id)
    end
end
