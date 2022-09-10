class AddFamilyRefToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :family, null: false, foreign_key: true
  end
end
