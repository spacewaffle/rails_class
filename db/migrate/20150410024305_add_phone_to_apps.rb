class AddPhoneToApps < ActiveRecord::Migration
  def change
    add_column :apps, :phone, :text
  end
end
