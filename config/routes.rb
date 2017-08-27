Rails.application.routes.draw do      
  namespace :v1, :defaults => { :format => 'json' } do
    get 'cartoes/:id_cartao/habilitar/:id_usuario', to: 'cartoes#habilitar_cartao'    
    post 'cartoes/solicitar/:id_usuario', to: 'cartoes#solicitar'    
    get 'cartoes/:id_cartao/saldo', to: 'cartoes#saldo'
    get 'cartoes/:id_cartao/status', to: 'cartoes#status'
    post 'cartoes/:id_cartao/status', to: 'cartoes#alterar_status'
    get 'cartoes/:id_cartao/extrato', to: 'cartoes#extrato_mes_atual'
    
    post 'cartoes/:id_cartao/autorizar/pagamento', to: 'cartoes#autorizar_pagamento'
    post 'app/registrar', to: 'app#registrar'
    post 'app/enviar/mensagem', to: 'app#enviar_mensagem'

    get 'ranking', to: 'ranking#index'
    post 'ranking/:id_usuario/pontuar', to: 'ranking#pontuar'
    
    get 'helloworld', to: 'cartoes#helloworld'

    resources :cartoes
    resources :missoes
    resources :usuarios
  end  

  root to: 'application#index'
end
