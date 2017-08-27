class AddColumnPapelUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :papel, :string
  end
end
