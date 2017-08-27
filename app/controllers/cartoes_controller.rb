class CartoesController < ApplicationController
  before_action :set_cartao, only: [:show, :update, :destroy]

  # GET /cartoes
  def index
    @cartoes = Cartao.all

    render json: @cartoes
  end

  # GET /cartoes/1
  def show
    render json: @cartao
  end

  # POST /cartoes
  def create
    @cartao = Cartao.new(cartao_params)

    if @cartao.save
      render json: @cartao, status: :created, location: @cartao
    else
      render json: @cartao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cartoes/1
  def update
    if @cartao.update(cartao_params)
      render json: @cartao
    else
      render json: @cartao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cartoes/1
  def destroy
    @cartao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartao
      @cartao = Cartao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cartao_params
      params.fetch(:cartao, {})
    end
end
