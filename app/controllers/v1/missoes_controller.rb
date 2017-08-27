module V1
  class MissoesController < ApplicationController
    before_action :set_missao, only: [:show, :update, :destroy]

    # GET /missoes
    def index
      @missoes = Missao.all

      render json: @missoes
    end

    # GET /missoes/1
    def show
      render json: @missao
    end

    # POST /missoes
    def create
      @missao = Missao.new(missao_params)

      if @missao.save
        render json: @missao, status: :created
      else
        render json: @missao.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /missoes/1
    def update
      if @missao.update(missao_params)
        render json: @missao
      else
        render json: @missao.errors, status: :unprocessable_entity
      end
    end

    # DELETE /missoes/1
    def destroy
      @missao.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_missao
        @missao = Missao.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def missao_params
        params.fetch(:missao, {}).permit(:titulo, :descricao, :imagem, :pontuacao, :efetuada)
      end
  end
end