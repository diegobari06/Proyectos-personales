class OmmentsController < ApplicationController
  before_action :set_omment, only: [:update, :destroy,:show]
    before_action :set_article
  before_action :authenticate_user!
  # GET /omments
  # GET /omments.json
  def index
    @omments = Omment.all
  end

  # GET /omments/1
  # GET /omments/1.json
  def show
  end

  # GET /omments/new
  def new
    @omment = Omment.new
  end

  # GET /omments/1/edit
  def edit
  end

  # POST /omments
  # POST /omments.json
  def create
    @omment = current_user.omments.new(omment_params)
    @omment.article = @article
    respond_to do |format|
      if @omment.save
        format.html { redirect_to @omment.article, notice: 'Omment was successfully created.' }
        format.json { render :show, status: :created, location: @omment.article }
      else
        format.html { render :new }
        format.json { render json: @omment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omments/1
  # PATCH/PUT /omments/1.json
  def update
    respond_to do |format|
      if @omment.update(omment_params)
        format.html { redirect_to @omment.article, notice: 'Omment was successfully updated.' }
        format.json { render :show, status: :ok, location: @omment }
      else
        format.html { render :edit }
        format.json { render json: @omment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omments/1
  # DELETE /omments/1.json
  def destroy
    @omment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Omment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_omment
      @omment = Omment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omment_params
      params.require(:omment).permit(:user_id, :article_id, :body)
    end
end
