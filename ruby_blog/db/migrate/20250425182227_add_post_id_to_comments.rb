class AddPostIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :post_id, :integer
  end
end
