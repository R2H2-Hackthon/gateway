module V1
    class CartoesController < ActionController::API
        before_action :set_cartao, only: [:show, :update, :destroy]

        # GET /cartoes
        def index
            @cartoes = Cartao.all

            render json: @cartoes.order('id')
        end

        # GET /cartoes/1
        def show
            render json: @cartao
        end

        # POST /cartoes
        def create
            @cartao = Cartao.new(cartao_params)

            if @cartao.save
                render json: @cartao, status: :created
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

        def habilitar_cartao
            render json: Agillitas.new.habilitar_cartao(params[:id_cartao], params[:id_usuario], 100.00, '123456')
        end

        def saldo
            render json: Agillitas.new.cartoes_saldo(params[:id_cartao])
        end

        def status
            render json: Agillitas.new.status(params[:id_cartao])
        end

        def alterar_status
            render json: Agillitas.new.alterar_status(params[:id_cartao], params[:status])
        end

        def autorizar_pagamento
            render json: Visa.new.autorizar_pagamento(params[:id_cartao], params[:valor])
        end

        def solicitar
            Agillitas.new.solicitar_cartao(params[:id_usuario], 100, 1234)

            render json: Usuario.all
        end

        def extrato_mes_atual
            render json: Agillitas.new.extrato(
                params[:id_cartao], 
                "#{Time.current.year}-#{Time.current.strftime("%m")}-01", 
                "#{Time.current.year}-#{Time.current.strftime("%m")}-#{Time.current.end_of_month.strftime("%d")}"
            )
        end

        def helloworld
            render json: Visa.new.helloworld
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_cartao
            @cartao = Cartao.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def cartao_params
            params.fetch(:cartao, {}).permit(:proxy, :pin, :time, :numero, :validade, :cvv)
        end
    end    
end
