class AddShowIdToCharactersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :show_id, :integer, null: false
  end
end
