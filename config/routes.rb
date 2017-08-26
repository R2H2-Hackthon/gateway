Rails.application.routes.draw do
  namespace :v1 do
    get 'habilitar_primeiro_cartao', to: 'cartoes#habilitar_primeiro_cartao'
    get 'cartoes/:id_cartao/saldo', to: 'cartoes#saldo'
  end  
end
