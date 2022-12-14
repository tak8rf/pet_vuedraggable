class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :list, null: false, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
