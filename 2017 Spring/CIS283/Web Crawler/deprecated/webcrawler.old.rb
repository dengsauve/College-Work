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
# ruby Web\ Crawler/webcrawler.rb www.sauve.biz


require_relative('link')
require 'prawn'
require 'net/http'
require 'time'

url = ARGV[0]

ARGV.include?('--verbose') ? verbose = true : verbose = false

response = Net::HTTP.get_response(url, '/')

website = Link_Checker.new(url, response.body)
puts 'created website object' if verbose

puts 'finding links...' if verbose
scan_data = website.page_body.scan(/<a.*href=["'](?:http:\/\/)?([^'"]*)(?:\/)?["'].*>(.*)<\/a>/)

scan_data.each_with_index do |pair, index|

  puts 'scanning ' + (index+1).to_s.ljust(4, '.') + 'of' + scan_data.length.to_s.rjust(4, '.') + '....' + pair[0] if verbose

  if pair[0] == website.base_url+'/'
    nil

  elsif pair[0] =~ /#{website.base_url}/
    pair[0].scan(/(?:https?:\/\/)?((?:www\.)?.*\.[a-z]{2,6}.*)/)
    website.add_link(Link.new($1, pair[1]))

  elsif pair[0] =~ /^(?:\/.*)+/
    website.add_link(Link.new(pair[0], pair[1]))

  elsif pair[0] =~ /\#.*/
    nil

  else
    website.add_link(Link.new(pair[0], pair[1]))
  end
end

#puts website.print_links
#puts website.print_bad_links

#=begin
Prawn::Document.generate( "pdf_bin/#{url}.pdf" ) do
  font_families.update(
      "UbuntuMono" => {
          :normal => "UbuntuMono-Regular.ttf"
      }
  )
  font "Courier", :size => 24
  text "#{url}\nLink Report", :align => :center
  font "Courier", :size => 16
  text "As of #{Time.now.month}/#{Time.now.day}/#{Time.now.year} - #{Time.now.hour}:#{Time.now.min}", :align => :center
  font "UbuntuMono", :size => 10
  text "#{website.print_links}", :align => :left
  start_new_page
  font "UbuntuMono", :size => 10
  text "#{website.print_bad_links}", :align => :left
end
#=end