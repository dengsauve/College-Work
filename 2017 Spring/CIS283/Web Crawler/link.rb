############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/20/2017
#  Assignment:   WebCrawler
#  Class:        CIS283
#  Description:  A program that looks for internal and
#                external links on a given website.
#
############################################################

class Link_Checker

  attr_reader :page_body

  def initialize(website_url, page_body)
    @@base_url = website_url
    @page_body = page_body
    @link_list = []
  end

  def find_links
    puts "find links reached"
    @page_body.scan(/<a.*href=["'](?:http:\/\/)?([^'"]*)(?:\/)?["'].*>(.*)<\/a>/).each do | pair |
      puts "scanning... #{pair[0]}"
      if pair[0] =~ /#{@@base_url}/
        @link_list << Link.new(pair[0], pair[1])
      elsif pair[0] =~ /^(?:\/.*)+/
        @link_list << Link.new(@@base_url + pair[0], pair[1])
      elsif pair[0] =~ /\#.*/
        nil
      else
        @link_list << Link.new(pair[0], pair[1])
      end
    end
  end

  def base_url
    return @@base_url
  end

end

class Link < Link_Checker
  def initialize(link, click_value)
    @link = link
    @click_value = click_value
    @link_type = check_base
    @code = check_link
  end

  def to_code
    return "<a href='#{@link}'>#{@click_value}</a>"
  end

  def to_s
    return "#{@link} | #{@click_value}"
  end

  def check_link
    return Net::HTTP.get_response(@link, '/').code
  end

  def check_base
    if @link =~ /#{@@base_url}/
      return 'internal'
    else
      return 'external'
    end
  end

end