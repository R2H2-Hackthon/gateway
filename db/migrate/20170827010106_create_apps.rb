class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :app_id
      
      t.timestamps
    end
  end
end
