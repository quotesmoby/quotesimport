class Quote < ActiveRecord::Base

	# Converts blank fields to null values
	nilify_blanks
	belongs_to :author
	has_and_belongs_to_many :tags


	# Gets the youtube video ID so we can embed it in the iframe
	def youtube_video_id		
		if self.video_url.nil?
			nil
		else
			self.video_url.rpartition('/').last
		end

	end

end
