class AddDescriptionToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :desc, :text
  end
end
