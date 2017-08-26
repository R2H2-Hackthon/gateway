Rails.application.routes.draw do  
  namespace :v1, :defaults => { :format => 'json' } do
    get 'cartoes/:id_cartao/habilitar/:id_usuario', to: 'cartoes#habilitar_cartao'
    get 'cartoes/:id_cartao/saldo', to: 'cartoes#saldo'
    post 'cartoes/:id_cartao/autorizar/pagamento', to: 'cartoes#autorizar_pagamento'

    get 'helloworld', to: 'cartoes#helloworld'

    resources :usuarios
  end  

  root to: 'application#index'
end
