class ChangeQuoteAuthorToReference < ActiveRecord::Migration
  def change
  	change_table :quotes do |t|
	    t.references :author
	  end
  end
end
