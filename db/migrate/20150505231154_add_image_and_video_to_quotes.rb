class AddImageAndVideoToQuotes < ActiveRecord::Migration
  def change
  	change_table :quotes do |t|
	    t.string :image_url
	    t.string :video_url
	  end
  end
end
