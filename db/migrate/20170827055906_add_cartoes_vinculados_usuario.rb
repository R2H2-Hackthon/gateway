class AddCartoesVinculadosUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :cartoes_vinculados, :string, array: true, default: []
  end
end
