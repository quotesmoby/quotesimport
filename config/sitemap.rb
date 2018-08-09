# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.quoteestate.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  # add articles_path,:changefreq => 'weekly'
  #
  # Add all articles:
  #
    Tag.find_each do |tag|
      add quotes_by_tag_name_path(tag.name.downcase), :lastmod => tag.updated_at, :changefreq => 'weekly'
    end

    Author.find_each do |author|
      add quotes_by_author_name_path(author), :lastmod => author.updated_at, :changefreq => 'weekly'
    end


end
