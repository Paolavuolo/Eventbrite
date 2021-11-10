class AddColumntoUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :createur, :boolean 
  end
end
