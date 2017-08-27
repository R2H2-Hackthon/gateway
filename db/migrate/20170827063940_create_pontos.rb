class CreatePontos < ActiveRecord::Migration[5.1]
  def change
    create_table :pontos do |t|
      t.references :usuario
      t.integer :pontuacao
      
      t.timestamps
    end
  end
end
