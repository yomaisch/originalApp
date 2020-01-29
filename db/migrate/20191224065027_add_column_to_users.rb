class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :last_name, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name_kana, :string
  	add_column :users, :first_name_kana, :string
  	add_column :users, :sex, :integer
  	add_column :users, :email, :string
  	add_column :users, :image_name, :string
  end
end
