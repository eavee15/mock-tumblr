class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :post_id
      t.text :text

      t.timestamps null: false
    end
  end
end
