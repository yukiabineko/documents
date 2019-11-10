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
  end

  # GET /document_selects/1/edit
  def edit
  end

  # POST /document_selects
  # POST /document_selects.json
  def create
    @document_select = DocumentSelect.new(document_select_params)

    respond_to do |format|
      if @document_select.save
        format.html { redirect_to @document_select, notice: 'Document select was successfully created.' }
        format.json { render :show, status: :created, location: @document_select }
      else
        format.html { render :new }
        format.json { render json: @document_select.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:document_select).permit(:content, :select_number, :document_item_id)
    end
end
