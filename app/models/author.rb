class Author < ActiveRecord::Base
	extend FriendlyId

	friendly_id :name, use: :slugged
	has_many :quotes
	has_and_belongs_to_many :tags


	def self.popularAuthors
		Author.where(id:[12906,12582,4470,12948,7483,4362,11625,7391,4426])
	end


	def self.search(search)
	  wildcard_search = "%#{search}%"
	  where("name LIKE ?", wildcard_search)
	end
end


 