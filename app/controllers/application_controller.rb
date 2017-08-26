class ApplicationController < ActionController::API

    CLIENT_ID = 'c8f1e035-1a57-3cc2-bbf4-e586855785d8'.freeze
    CLIENT_SECRET = '77818243-3cca-3aed-87d2-6d3aa703ca0a'.freeze

    def testando
        render json: { success: true }
    end
end
