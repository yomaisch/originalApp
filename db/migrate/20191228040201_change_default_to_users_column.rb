class ChangeDefaultToUsersColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :nickname, :string, default: '未設定'
  	change_column :users, :introduction, :string, default: 'よろしくお願いいたします。'
  end
end
