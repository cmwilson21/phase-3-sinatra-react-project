class RemovedNetworkFromShows < ActiveRecord::Migration[6.1]
  def change
    remove_column :shows, :network, :string
  end
end
