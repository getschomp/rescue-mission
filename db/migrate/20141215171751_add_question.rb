class AddQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :user_id, null: false
    end
  end
end
