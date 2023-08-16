class RotaController < ApplicationController
  before_action :set_rotum, only: %i[ show edit update destroy ]

  def home
  end

  def index
    @rota = Rotum.all
  end

  def show
  end

  def new
    @rotum = Rotum.new
    list_onibus_and_motorista
  end

  def edit
  end

  def create
    @rotum = Rotum.new(rotum_params)
    respond_to do |format|
      if @rotum.save
        format.html { redirect_to rotum_url(@rotum), notice: "Rotum was successfully created." }
        format.json { render :show, status: :created, location: @rotum }
      else
        format.html { render :new, status: :unprocessable_entity }
        list_onibus_and_motorista
      end
    end
  end

  def update
    respond_to do |format|
      if @rotum.update(rotum_params)
        format.html { redirect_to rotum_url(@rotum), notice: "Rotum was successfully updated." }
        format.json { render :show, status: :ok, location: @rotum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rotum.errors, status: :unprocessable_entity }
        list_onibus_and_motorista
      end
    end
  end

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
    render 'busca_por_onibus'
  end

  def list_onibus_and_motorista
    @onibus = Onibus.all
    @motorista = Motoristum.all
  end

  private
    def set_rotum
      @rotum = Rotum.find_by(id: params[:id])
      list_onibus_and_motorista
    end

    def rotum_params
      params.require(:rotum).permit(:nome, :valor, :distancia, :duracao, :inicio, :fim, :origem, :destino, :onibus_id, :motoristum_id)
    end
end
