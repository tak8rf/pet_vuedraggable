class AddColumnsToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :weight, :string
    add_column :pets, :lenght, :string
    add_column :pets, :birthday, :datetime
  end
end
