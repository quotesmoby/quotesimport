class Tag < ActiveRecord::Base
	has_and_belongs_to_many :quotes


	def self.popularTags
		Tag.where(id:[1,2,3,5,8,19,31,33,69,72,210])
	end

	def self.search(search)
	  wildcard_search = "%#{search}%"
	  where("name LIKE ?", wildcard_search)
	end

end
