class SearchController < ApplicationController
  def index

	authors = Author.search params[:query]
	tags = Tag.search params[:query]

	@results = {authors:authors, categories:tags }

  end

  # Used for SEO friendly URLS, post the query string and redirect to GET url
  def post
	  redirect_to search_path( query: params[:query] )
	end
end
