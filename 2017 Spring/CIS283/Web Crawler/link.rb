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
  attr_accessor :link_list

  def initialize(website_url, page_body)
    @@base_url = website_url
    @page_body = page_body
    @link_list = []
  end

  def add_link(link)
    @link_list << link
  end

  def base_url
    return @@base_url
  end

  def print_links
    ret_str = ''
    @link_list.each do | link |
      ret_str += link.to_s + "\n" unless link.code == '404'
    end
    return ret_str
  end

  def print_bad_links
    ret_str = ''
    @link_list.each do | link |
      ret_str += link.to_s + "\n" if link.code == '404'
    end
    return ret_str
  end

end

class Link < Link_Checker
  attr_reader :code
  def initialize(link, click_value)
    @link = link[-1] == '/' ? link[0...-1] : link
    @click_value = click_value
    @link_type = check_base
    @code = check_link
  end

  def to_code
    return "<a href='#{@link}'>#{@click_value}</a>"
  end

  def to_s
    return @link.ljust(60, '.') + @click_value.rjust(30, '.') +  "\n" +
        @link_type.ljust(60, '.') + @code.rjust(30, '.') + "\n"
  end

  def check_link
    if @link_type == 'internal'
      return Net::HTTP.get_response(@@base_url, @link).code
    else
      @link.scan(/(?:https?:\/\/)?((?:www\.)?.+?\.[a-z]{2,6})(.*)/)
      return Net::HTTP.get_response($1, $2).code
    end
  end

  def check_base
    if @link =~ /^(?:\/.*)/
      return 'internal'
    else
      return 'external'
    end
  end

end