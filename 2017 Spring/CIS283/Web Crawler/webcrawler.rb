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

if ARGV.include?('-h') || ARGV.include?('--help')
  puts 'Web Crawler
  ABOUT: A ruby script that will go out and comb a website for <a> links, test them, and create a PDF report.
  USAGE: webcrawler.rb <website> <-bv>
  COMMANDS:
    -h --help:          Displays help menu
    -v --verbose:       Outputs events as they occur in program
    -b --progress-bar:  Displays a progress bar (needs ruby-progressbar gem installed)'
  exit
end

require_relative('link')
require 'prawn'
require 'net/http'
require 'time'
require 'openssl'

# Get Command Line Arg
url = ARGV[0]
(ARGV.include?('--verbose') || ARGV.include?('-v')) ? verbose = true : verbose = false
if ARGV.include?('--progress-bar') || ARGV.include?('-b')
  require 'ruby-progressbar'
  bar = true
else
  bar = false
end

# Make HTTP Connection # Download HTML
puts "Opening: #{url}" if verbose
url.scan(/(?:https?:\/\/)?([\w\d]*\.[\w\d]*\.[\w\d]{2,6})(.*)/)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
response = Net::HTTP.get_response($1, $2 == '' ? '/' : $2)


# Create LinkChecker Object
link_checker = Link_Checker.new(url)

# Collect all href tags
puts 'Looking for tags' if verbose
t_tags = response.body.scan(/<a.*href=["'](?:https?:\/\/)?([^'"]*)(?:\/)?["'].*>(.*)<\/a>/)

# Parse Internal, External, and Non-English Characters
# Net::HTTP.get_response('www.baseurl.com', '/path/here/like/this')
# Store as Link Objects in LinkChecker.add_link
t_tags.each do |tag|
  link_text = tag[1]
  if tag[0] =~ /^(?:\/.*)+/
    link_checker.add_link(Link.new(tag[0], link_text, 'internal'))

  elsif tag[0] =~ /mailto:/
    nil

  elsif tag[0] =~ /((?:www\.)?.+?\.[a-z]{2,6})(.*)/
    link_checker.add_link(Link.new([$1, ($2 == '' ? '/' : $2)], link_text, 'external'))
  end
end

# Execute LinkChecker.check_links
puts 'Checking Links' if verbose
progressbar = ProgressBar.create(:title => 'Progress',
                                 :total => link_checker.link_list.length,
                                 :format => '%t %p%% |%b%i|') if bar

link_checker.link_list.each_with_index do |link, index|
  puts "Checking: #{index + 1} of #{link_checker.link_list.length}" if verbose
  puts link.info if verbose
  progressbar.increment if bar
  link.check_link
end

# Create a Prawn PDF
puts 'Generating PDF' if verbose
Prawn::Font::AFM.hide_m17n_warning = true
Prawn::Document.generate( "pdf_bin/#{url}.pdf" ) do
  font "Courier", :size => 24
  text "#{url}\nLink Report", :align => :center
  font "Courier", :size => 16
  text "As of #{Time.now.month}/#{Time.now.day}/#{Time.now.year} - #{Time.now.hour}:#{Time.now.min}", :align => :center
  font "Courier", :size => 10
  link_checker.good_links.each do | link |
    # link
    if link.type == 'internal'
      text "URL: " + link.link.to_s.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left
      href_link = link_checker.base_url + link.link.to_s
    else
      text "URL: " + link.link.join('').encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left
      href_link = link.link.join('')
    end

    # click text
    click_value_text = link.click_value.to_s.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace)
    text "<link href='#{href_link}'>Click Value: #{click_value_text}</link>", :inline_format => true

    # internal/external + code and newline
    text link.type.ljust(60, '.') + link.code.to_s.rjust(30, '.') + "\n\n"
  end

  # Keeping the 404's on a different page
  start_new_page
  font "Courier", :size => 24
  text "#{url}\n404 Report", :align => :center
  font "Courier", :size => 10
  text link_checker.bad_links.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left
end

puts 'Finished' if verbose