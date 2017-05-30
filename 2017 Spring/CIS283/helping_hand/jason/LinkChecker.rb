class LinkChecker
  attr_accessor :links_array

  def initialize(website)
    @@baseurl = website
    @links_array = []
  end

  def add_link(link)
    @links_array << link
  end
end
