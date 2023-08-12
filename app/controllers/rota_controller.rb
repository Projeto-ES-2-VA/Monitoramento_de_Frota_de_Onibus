class RotaController < ApplicationController
  before_action :set_rotum, only: %i[ show edit update destroy ]

  # GET /rota or /rota.json
  def index
    @rota = Rotum.all
  end

  # GET /rota/1 or /rota/1.json
  def show
  end

  # GET /rota/new
  def new
    @rotum = Rotum.new
    @onibus = Onibus.all
    @motorista = Motoristum.all
  end

  # GET /rota/1/edit
  def edit
  end

  # POST /rota or /rota.json
  def create
    @rotum = Rotum.new(rotum_params)

    puts params.inspect
    respond_to do |format|

      if @rotum.save
        format.html { redirect_to rotum_url(@rotum), notice: "Rotum was successfully created." }
        format.json { render :show, status: :created, location: @rotum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rotum.errors, status: :unprocessable_entity }
        @onibus = Onibus.all
        @motorista = Motoristum.all
      end
    end
  end

  # PATCH/PUT /rota/1 or /rota/1.json
  def update
    respond_to do |format|
      if @rotum.update(rotum_params)
        format.html { redirect_to rotum_url(@rotum), notice: "Rotum was successfully updated." }
        format.json { render :show, status: :ok, location: @rotum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rota/1 or /rota/1.json
  def destroy
    @rotum.destroy

    respond_to do |format|
      format.html { redirect_to rota_url, notice: "Rotum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buscar_por_onibus
    @placas_onibus = Onibus.pluck(:placa)
    @rotas = Rotum.joins(:onibus).where("onibuses.placa = ?", params[:placa])
    puts @rotas.inspect # Adicione este log para verificar as rotas encontradas
    render 'busca_por_onibus'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rotum
      @rotum = Rotum.find(params[:id])
      @onibus = Onibus.all
    end

    # Only allow a list of trusted parameters through.
    def rotum_params
      params.require(:rotum).permit(:nome, :valor, :distancia, :duracao, :inicio, :fim, :origem, :destino, :onibus_id, :motoristum_id)
    end
end
