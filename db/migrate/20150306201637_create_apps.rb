class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.text :email
      t.text :name
      t.text :date
      t.text :employment
      t.text :currently
      t.text :looking_for
      t.text :experience
      t.text :ideas
      t.text :linkedin
      t.text :heard_from

      t.timestamps
    end
  end
end
