class MotoristaController < ApplicationController
  before_action :set_motoristum, only: %i[ show edit update destroy ]

  # GET /motorista or /motorista.json
  def index
    @motorista = Motoristum.all
  end

  # GET /motorista/1 or /motorista/1.json
  def show
  end

  # GET /motorista/new
  def new
    @motoristum = Motoristum.new
  end

  # GET /motorista/1/edit
  def edit
  end

  # POST /motorista or /motorista.json
  def create
    @motoristum = Motoristum.new(motoristum_params)

    respond_to do |format|
      if @motoristum.save
        format.html { redirect_to motoristum_url(@motoristum), notice: "Motoristum was successfully created." }
        format.json { render :show, status: :created, location: @motoristum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @motoristum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motorista/1 or /motorista/1.json
  def update
    respond_to do |format|
      if @motoristum.update(motoristum_params)
        format.html { redirect_to motoristum_url(@motoristum), notice: "Motoristum was successfully updated." }
        format.json { render :show, status: :ok, location: @motoristum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motoristum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motorista/1 or /motorista/1.json
  def destroy
    @motoristum.destroy

    respond_to do |format|
      format.html { redirect_to motorista_url, notice: "Motoristum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buscar_motorista
    query = params[:query]
    @results = Motoristum.where("nome LIKE  ? OR cpf = ? OR email = ?", "%#{query}%", query, query)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motoristum
      @motoristum = Motoristum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motoristum_params
      params.require(:motoristum).permit(:nome, :cpf, :email, :senha, :telefone, :cnh)
    end
end
