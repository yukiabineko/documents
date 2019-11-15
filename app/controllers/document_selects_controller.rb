class DocumentSelectsController < ApplicationController
  before_action :set_document_select, only: [:show, :edit, :update, :destroy]

  # GET /document_selects
  # GET /document_selects.json
  def index
    @document_selects = DocumentSelect.all
  end

  # GET /document_selects/1
  # GET /document_selects/1.json
  def show
  end

  # GET /document_selects/new
  def new
    @document_select = DocumentSelect.new
    @document_item = DocumentItem.find(params[:id])
    @document_select.document_item_id = @document_item.id
  end

  # GET /document_selects/1/edit
  def edit
  end

  def create
    @document_item = DocumentItem.find(params[:document_item_id])
    @document_items = DocumentItem.where(content: @document_item.content,randam: @document_item.randam) #前項のdocumentからのid content
    @document_items.each do |item|
      record = item.document_selects.build(content: params[:content],document_item_id: item.id)
      record.save
    end  
    @document_select = DocumentSelect.where(document_item_id: @document_item.id).last
    flash[:danger] = "引き続き項目作るならフォーム入力して送信を終わりなら終了ボタン押してください"
    redirect_to '/documents_selects/new/'+@document_select.document_item_id.to_s 
  end

  # PATCH/PUT /document_selects/1
  # PATCH/PUT /document_selects/1.json
  def update
    respond_to do |format|
      if @document_select.update(document_select_params)
        format.html { redirect_to @document_select, notice: 'Document select was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_select }
      else
        format.html { render :edit }
        format.json { render json: @document_select.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_selects/1
  # DELETE /document_selects/1.json
  def destroy
    @document_select.destroy
    respond_to do |format|
      format.html { redirect_to document_selects_url, notice: 'Document select was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_select
      @document_select = DocumentSelect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_select_params
      params.require(:document_select).permit(:content, :document_item_id)
    end
end
