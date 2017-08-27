class CreateCartoes < ActiveRecord::Migration[5.1]
  def change
    create_table :cartoes do |t|
      t.string :proxy
      t.string :pin
      t.string :time
      t.string :numero
      t.string :validade
      t.string :cvv

      t.timestamps
    end
  end
end
