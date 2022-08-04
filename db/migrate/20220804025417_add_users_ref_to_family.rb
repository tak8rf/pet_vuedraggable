class AddUsersRefToFamily < ActiveRecord::Migration[6.1]
  def change
    add_reference :families, :users, null: false, foreign_key: true
  end
end
