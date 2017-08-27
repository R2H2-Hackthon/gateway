class CreateMissoes < ActiveRecord::Migration[5.1]
  def change
    create_table :missoes do |t|
      t.string :titulo
      t.string :imagem

      t.timestamps
    end
  end
end
