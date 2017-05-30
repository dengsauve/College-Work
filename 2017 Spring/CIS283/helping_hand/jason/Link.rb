class Link < LinkChecker
  attr_accessor :link, :click_value, :link_type, :code

  def initialize(link, click_value)
    super @@baseurl
    @link = link
    @click_value = click_value
  end

  def link_checker(link)
    if link == "#"
      @link_type = "internal"
    elsif link =~ /\A\/\w/
      @link_type = "internal"
      @link = "https://#{@@baseurl}#{link}"
    elsif link =~ /\A\/\/#{@@baseurl}/
      @link_type = "internal"
      @link = "https:#{link}"
    elsif link =~ /\A\/\//
      @link_type = "internal"
    elsif link =~ /http:\/\/#{@@baseurl}/
      @link_type = "internal"
    elsif link =~ /https:\/\/#{@@baseurl}/
      @link_type = "internal"
    elsif link =~ /#{@@baseurl}/
      @link_type = "internal"

    else
      @link_type = "external"
    end
  end


  def code_checker
    if @link == @@baseurl
      response = Net::HTTP.get_response(URI("#{@link}"))
      @code = response.code
    elsif @link == "#"
      @code = 200
    elsif @link == nil
      @code = 404
    elsif @link =~ /\A\/\/#{@@baseurl}/
      response = Net::HTTP.get_response(URI("https:#{@link}"))
      @code = response.code
    elsif @link =~ /\A\/\w/
      response = Net::HTTP.get_response(URI("https://#{@@baseurl}#{@link}"))
      @code = response.code
    elsif @link =~ /https:\/\/#{@@baseurl}\/\w/
      response = Net::HTTP.get_response(URI(@link))
      @code = response.code
    else
      response = Net::HTTP.get_response(URI(@link))
      @code = response.code
    end
  end

  def to_s
    return "#{@link} #{@click_value} #{@link_type} #{@code}"
  end
end