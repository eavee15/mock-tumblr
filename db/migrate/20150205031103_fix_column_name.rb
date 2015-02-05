class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :Aboutme, :bio
  end
end
