class AddColumnToCompanies < ActiveRecord::Migration[5.2]
  def change
  	add_column :companies, :description, :text
	add_column :companies, :content, :text
  end
end
