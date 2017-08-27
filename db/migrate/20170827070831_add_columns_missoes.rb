class AddColumnsMissoes < ActiveRecord::Migration[5.1]
  def change
    add_column :missoes, :descricao, :string
    add_column :missoes, :pontuacao, :integer
  end
end
