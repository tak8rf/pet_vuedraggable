class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :family_id, :integer, default: ""
  end
end
