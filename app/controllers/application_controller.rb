class ApplicationController < ActionController::API
    def testando
        render json: { success: true }
    end    
end
