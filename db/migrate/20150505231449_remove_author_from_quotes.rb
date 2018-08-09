class RemoveAuthorFromQuotes < ActiveRecord::Migration
  def change
  	remove_column :quotes, :author
  end
end
