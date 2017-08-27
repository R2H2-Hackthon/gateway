Rails.application.routes.draw do  
  
  namespace :v1, :defaults => { :format => 'json' } do
    resources :cartoes

    get 'cartoes/:id_cartao/habilitar/:id_usuario', to: 'cartoes#habilitar_cartao'
    get 'cartoes/:id_cartao/saldo', to: 'cartoes#saldo'
    
    post 'cartoes/:id_cartao/autorizar/pagamento', to: 'cartoes#autorizar_pagamento'
    post 'app/registrar', to: 'app#registrar'
    post 'app/enviar/mensagem', to: 'app#enviar_mensagem'
    
    get 'helloworld', to: 'cartoes#helloworld'

    resources :usuarios
  end  

  root to: 'application#index'
end
