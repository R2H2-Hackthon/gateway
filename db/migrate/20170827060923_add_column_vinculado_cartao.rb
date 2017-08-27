class AddColumnVinculadoCartao < ActiveRecord::Migration[5.1]
  def change
    add_column :cartoes, :vinculado, :boolean
  end
end
