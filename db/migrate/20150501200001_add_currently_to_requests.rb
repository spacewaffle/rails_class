class AddCurrentlyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :currently, :text
  end
end
