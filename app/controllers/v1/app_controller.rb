module V1
    class AppController < ActionController::API
        def registrar
            App.find_or_create_by app_id: params[:uid]            

            render json: { success: true }
        end
    end    
end
