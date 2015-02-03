class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :leader_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
