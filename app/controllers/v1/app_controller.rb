require 'fcm'

module V1
    class AppController < ActionController::API

        FCM_SERVER_KEY = 'AAAADBrrZlQ:APA91bH_UrOiSNRi9zKmOyTGWvKX75yC1j7OsEOE71TyIdJa6SOtH-STwCawLLSlggJp38-xVLsiCxNq9KrLodmkE135D-EqfSNQZf30i4LnRuFayzkyVfTkehaZk183nysJr8YSzM31'.freeze

        def registrar
            App.find_or_create_by app_id: params[:uid]            

            render json: { success: true }
        end

        def enviar_mensagem
            app_ids = App.all.pluck(:app_id)            

            fcm = FCM.new(FCM_SERVER_KEY)

            options = {
                notification: { 
                    body: params[:mensagem],
                    title: "Grow Up",
                    icon: '/favicon.ico'
                }, 
                collapse_key: "updated_score"
            }

            response = fcm.send(app_ids, options)
        end
    end    
end
