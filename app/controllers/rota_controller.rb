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
    if @rotum.save
      show_message_and_handle_response("Rotum was successfully created.", rotum_url(@rotum))
    else
      show_message_and_handle_response(nil, nil, @rotum.errors, :new)
      list_onibus_and_motorista
    end
  end

  def update
    if @rotum.update(rotum_params)
      show_message_and_handle_response("Rotum was successfully updated.", rotum_url(@rotum))
    else
      show_message_and_handle_response(nil, nil, @rotum.errors, :edit)
    end
  end

  def show_message_and_handle_response(message, redirect_path, errors = nil, render_path = nil)
    respond_to do |format|
      if errors.nil?
        format.html { redirect_to redirect_path, notice: message }
        format.json { render json: { message: message }, status: :ok }
      else
        list_onibus_and_motorista
        format.html { render render_path, status: :unprocessable_entity }
        format.json { render json: { errors: errors }, status: :unprocessable_entity }
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
