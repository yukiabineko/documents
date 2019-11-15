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
  @user = User.all
  randam = SecureRandom.alphanumeric(10)
  @user.each do |user|
      record = user.documents.build(document_params)
      record.randam = randam
      record.user_id = user.id
      record.save
  end
  @document = Document.all.last  #作られたユーザーごとの資料の最後
    redirect_to "/documents_items/new/"+@document.id.to_s
  end
#入力create
  def create2
    @users = User.all
    randam = SecureRandom.alphanumeric(10)
    @users.all.each do |user|
      record = user.documents.build(document_params)
      record.randam = randam
      record.user_id = user.id
      record.save
    end  
    @document = Document.all.last
    redirect_to "/documents_items/new2/"+@document.id.to_s 
  end
  #表示create
  def create3
   @users = User.all
   randam =  SecureRandom.alphanumeric(10)
   @users.each do |user|
     record = user.documents.build(document_params)
     record.randam = randam
     record.user_id = user.id
     record.save
   end  
   redirect_to root_url
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
#入力式保護者処理
  def inputform  
    @document = Document.find(params[:id])
    answer = Answer.new
    answer.document_id = params[:id]
    reply = ""
    100.times do |i|
      str= "tx"+i.to_s 
      if params[str].present?
        reply += params[str]+":"
      end   
    end   
    answer.reply = reply
    answer.save
    redirect_to root_url
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
