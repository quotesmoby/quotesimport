class ChangeQuotesAndTagsName < ActiveRecord::Migration
  def change
    rename_table :quotes_and_tags, :quotes_tags
  end 
end
