class AddSettingsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :night_mode, :boolean
  end
end
