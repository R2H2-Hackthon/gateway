class Agillitas
    include HTTParty

    CLIENT_ID = 'c8f1e035-1a57-3cc2-bbf4-e586855785d8'.freeze
    # CLIENT_SECRET = '77818243-3cca-3aed-87d2-6d3aa703ca0a'.freeze
    ACCESS_TOKEN = 'e6325e48-164d-38ec-9f29-2366b5cbd7ca'.freeze
    
    base_uri 'https://api-visa.sensedia.com/sandbox/visa/agillitas/v1'

    def initialize
        @headers = {
            'Accept' => 'application/json',
            'client_id' => CLIENT_ID,
            'access_token' => ACCESS_TOKEN,
            'Content-Type' => 'application/json'
        }
    end

    def habilitar_cartao(index_cartao, index_usuario, valor, senha)
        usuarios = [
            { 
                'nome': 'Rafael',
                'sobrenome': 'Nunes Vieira',
                'dataNascimento': '1992-02-14',
                'cpf': '42053723882',
                'email': 'nvieirarafael@gmail.com',
                'telResidencial': '019981566127',
                'telCelular': '019981566127',
                'logradouro': 'Rua Benedita Amaral Pinto',
                'complemento': 'Numero 538 Ap. 36 Torre 5',
                'cidade': 'Campinas',
                'estado': 'SP',
                'pais': 'Brasil',
                'codigoPostal': '13080080' 
            },
        ]

        cartoes = [
            { 'id_cartao': '3713100018881', 'pin': 1006, 'time': 4, 'numero': 4213040011931806, 'validade': '03/20', 'cvv': 463 },
            # { 'id_cartao': '3713100018899', 'pin': 4511, 'time': 4, 'numero': 4213040011911097, 'validade': '03/20', 'cvv': 36 },
            # { 'id_cartao': '3713100018907', 'pin': 2257, 'time': 4, 'numero': 4213040011987212, 'validade': '03/20', 'cvv': 35 },
            # { 'id_cartao': '3713100018915', 'pin': 3461, 'time': 4, 'numero': 4213040011955904, 'validade': '03/20', 'cvv': 14 },
            # { 'id_cartao': '3713100018923', 'pin': 8402, 'time': 4, 'numero': 4213040011990141, 'validade': '03/20', 'cvv': 59 },
            # { 'id_cartao': '3713100018931', 'pin': 1406, 'time': 4, 'numero': 4213040011958320, 'validade': '03/20', 'cvv': 653 },
            # { 'id_cartao': '3713100018949', 'pin': 7144, 'time': 4, 'numero': 4213040011903615, 'validade': '03/20', 'cvv': 426 },
            # { 'id_cartao': '3713100018956', 'pin': 3481, 'time': 4, 'numero': 4213040011979714, 'validade': '03/20', 'cvv': 383 },
            # { 'id_cartao': '3713100018964', 'pin': 5728, 'time': 4, 'numero': 4213040011911519, 'validade': '03/20', 'cvv': 438 }
        ]

        cartao = cartoes[index_cartao]
        usuario = usuarios[index_usuario]
        
        body = {
            cartao: {
                idCartao: cartao[:id_cartao],
                valor: valor,
                contrasenha: senha,
                portador: {
                    nome: usuario[:nome],
                    sobrenome: usuario[:sobrenome],
                    dataNascimento: usuario[:dataNascimento],
                    cpf: usuario[:cpf],
                    contato: {
                        email: usuario[:email],
                        telResidencial: usuario[:telResidencial],
                        telCelular: usuario[:telCelular]
                    },
                    endereco: {
                        logradouro: usuario[:logradouro],
                        complemento: usuario[:complemento],
                        cidade: usuario[:cidade],
                        estado: usuario[:estado],
                        pais: usuario[:pais],
                        codigoPostal: usuario[:codigoPostal]
                    }
                }
            }    
        }
        
        response = self.class.post('/cartoes', body: body.to_json, headers: @headers)        
        
        response.body
    end

    def cartoes_saldo(id_cartao)
        response = self.class.get("/cartoes/#{ id_cartao }/saldo", headers: @headers)

        response.body
    end    
end