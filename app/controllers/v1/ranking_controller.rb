module V1
    class RankingController < ActionController::API
        def index
            usuarios = Usuario.all
            
            usuarios = usuarios.map do |usuario|
                _usuario = usuario.attributes

                _usuario['pontuacao'] = usuario.pontos.inject(0) { |sum, ponto| sum + ponto.pontuacao }

                _usuario
            end

            render json: usuarios
        end

        def pontuar
            usuario = Usuario.find_by id: params[:id_usuario]
            
            render json: Ponto.create(usuario: usuario, pontuacao: params[:pontuacao])
        end
    end    
end
