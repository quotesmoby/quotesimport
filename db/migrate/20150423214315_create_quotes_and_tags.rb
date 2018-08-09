class CreateQuotesAndTags < ActiveRecord::Migration
  def change
    create_table :quotes_and_tags do |t|
    	t.belongs_to :quote, index: true
      	t.belongs_to :tag, index: true
      	t.timestamps
    end
  end
end