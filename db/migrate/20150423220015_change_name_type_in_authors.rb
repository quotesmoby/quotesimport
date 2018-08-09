class ChangeNameTypeInAuthors < ActiveRecord::Migration
  def change
  	 change_column :authors, :name, :string
  end
end
