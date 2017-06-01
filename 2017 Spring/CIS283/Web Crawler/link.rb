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
  attr_reader :link_list # not a linked list :P
  def initialize(website_url)
    @@base_url = website_url
    @link_list = []
  end

  def add_link(link)
    @link_list << link
  end

  def base_url
    return @@base_url
  end

  def good_links
    ret_arr = []
    @link_list.each do | link |
      ret_arr << link unless link.code == '404'
    end
    return ret_arr
  end

  def bad_links
    ret_str = ''
    @link_list.each do | link |
      ret_str += link.to_s + "\n" if link.code == '404'
    end
    return ret_str
  end

end

class Link < Link_Checker
  attr_reader :code, :link, :click_value, :type
  def initialize(link, click_value, type)
    @link = link
    @click_value = click_value
    @type = type
    @code = ''
  end

  def check_link
    if @type == 'internal'
      @code = Net::HTTP.get_response(@@base_url, @link).code
    else
      #@link.scan(/(?:https?:\/\/)?((?:www\.)?.+?\.[a-z]{2,6})(.*)/)
      @code = Net::HTTP.get_response(@link[0], @link[1]).code
    end
  end

  def full_string
    return "<a href='#{@link}'>#{@click_value}</a>"
  end

  def info
    return 'Type: ' + @type + "\nLink: " + @link.to_s + "\nText: " + @click_value
  end

  def to_s
    return @link.to_s + "\n" +
        @click_value +  "\n" +
        @type.ljust(60, '.') + @code.rjust(30, '.') + "\n"
  end

  # <c:alink uri="http://adobe.com/missing.html">Missing Page</c:alink>

end