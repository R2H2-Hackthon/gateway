class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :dataNascimento
      t.string :cpf
      t.string :email
      t.string :telResidencial
      t.string :telCelular
      t.string :logradouro
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.string :pais
      t.string :codigoPostal

      t.timestamps
    end
  end
end
