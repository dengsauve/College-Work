require 'net/https'
require 'prawn'
require_relative 'LinkChecker.rb'
require_relative 'Link.rb'




#website = "www.adobe.com"
website = ARGV[0]
puts ARGV.inspect

url = LinkChecker.new(website)



OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

response = Net::HTTP.get_response(website, '/')




body = response.body
links = body.scan(/<a.*?\/a>/)

links.each do |link|
  link.scan(/href="(.+?)".*>(.+?)<\/a/)
  linkobj = Link.new($1, $2)
  url.add_link(linkobj)
  linkobj.link_checker($1)
  linkobj.code_checker
end

url.links_array.each do |link|
  puts link
end


Prawn::Document.generate("testing.pdf") do |pdf|

  pdf.font "Courier", :size => 24
  pdf.text "Website: #{website} #{links.count}"
  pdf.move_down 10
  pdf.font "Courier", :size => 10
# pdf.move_down 20
# TO: Replace this line:
  #pdf.text "#{@links} #{@click_value}"
# TO: by looping through url.links_array, and encoding each link.to_s with encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace)
# TO: Remember to Separate 404 codes from the rest
# pdf.text "someurltext".force_encoding(Encoding::Windows_1252)
# pdf.text url.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace)
# pdf.te
  url.links_array.each do | link |
    pdf.text "#{link.to_s.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace)}"
  end

end

