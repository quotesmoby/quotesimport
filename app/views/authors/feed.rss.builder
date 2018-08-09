#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "QuoteEstate"
    xml.author "Achim Fischer"
    xml.description "Famous Quotes"
    xml.link "https://www.quoteestate.com"
    xml.language "en"

    for author in @authors
      xml.item do
        xml.author author.name
        xml.id author.id
      end
    end
  end
end