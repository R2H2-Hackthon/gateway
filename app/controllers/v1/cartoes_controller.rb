module V1
    class CartoesController < ActionController::API
        def habilitar_cartao
            render json: Agillitas.new.habilitar_cartao(params[:id_cartao], params[:id_usuario], 100.00, '123456')
        end

        def saldo
            render json: Agillitas.new.cartoes_saldo(params[:id_cartao])
        end
    end    
end
