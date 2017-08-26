class Visa
    include HTTParty

    API_KEY = '2MKWL190FYMSIUVL11KI211M3wbLD0TunZP65qM0MbTeQLu2U'.freeze    
    SHARED_SECRET = '#1iUz@5UwbP3I#2n8VQ3bPiQORMOxRN4Lg/48YhE'.freeze
    
    base_uri 'https://sandbox.api.visa.com'

    def helloworld
        resource_path = 'helloworld'
        path = '/vdp/helloworld'        

        _headers = headers(resource_path)

        response = self.class.get(path, query: { apikey: API_KEY }, headers: _headers)
        
        response.body
    end
        
    def autorizar_pagamento(id_cartao, valor)
        resource_path = 'payments/v1/authorizations'
        path = '/cybersource/payments/v1/authorizations'

        _headers = headers(resource_path)

        cartao = Agillitas::CARTOES[id_cartao.to_sym]
        validade = cartao[:validade].split('/')

        body = {
            amount: valor,
            currency: "BRL",
            payment: {
                cardNumber: cartao[:numero],
                cardExpirationMonth: validade[0],
                cardExpirationYear: validade[1]
            }
        }

        response = self.class.get(path, query: { apikey: API_KEY }, body: body.to_json, headers: _headers)
        
        response.body
    end
    
    private 

    def headers(resource_path)
        {
            'x-pay-token' => get_xpay_token(SHARED_SECRET, resource_path, "apikey=#{API_KEY}"),
            'Content-Type' => 'application/json'
        }
    end

    def get_xpay_token(shared_secret, resource_path, query_string, request_body = '') 
        require 'digest' 
        timestamp = Time.now.getutc.to_i.to_s 
        hash_input = timestamp + resource_path + query_string + request_body 
        hash_output = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), shared_secret, hash_input) 
        return "xv2:" + timestamp + ":" + hash_output  
    end
end