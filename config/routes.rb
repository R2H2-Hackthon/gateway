Rails.application.routes.draw do  
  namespace :v1, :defaults => { :format => 'json' } do
    get 'cartoes/:id_cartao/habilitar/:id_usuario', to: 'cartoes#habilitar_cartao'
    get 'cartoes/:id_cartao/saldo', to: 'cartoes#saldo'

    resources :usuarios
  end  
end
