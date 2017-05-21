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
if ARGV.include?('-h') || ARGV.include?('--help')
  puts 'Web Crawler
  About: A ruby script that will go out and comb a website for <a> links, test them, and create a PDF report.
  Usage: webcrawler.rb <website> <-bv>
  Commands:
    -h --help:          Displays help menu
    -v --verbose:       Outputs events as they occur in program
    -b --progress-bar:  Displays a progress bar'
  exit
end

require_relative('link')
require 'prawn'
require 'net/http'
require 'time'

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
# TODO: Make sure that URLS with '/' are named better below for PDF.
puts "Opening: #{url}" if verbose
url.scan(/(?:https?:\/\/)?([\w\d]*\.[\w\d]*\.[\w\d]{2,6})(.*)/)
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
  # Parsing Text for American Characters as click value.
  link_text = tag[1].scan(/[a-zA-Z\s0-9\/\._\-]*/).join('')

  if tag[0] =~ /^(?:\/.*)+/
    link_checker.add_link(Link.new(tag[0], link_text, 'internal'))

  elsif tag[0] =~ /mailto:/
    nil

  elsif tag[0] =~ /((?:www\.)?.+?\.[a-z]{2,6})(.*)/
    link_checker.add_link(Link.new([$1, $2], link_text, 'external'))
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
Prawn::Document.generate( "pdf_bin/#{url}.pdf" ) do
  font "Courier", :size => 24
  text "#{url}\nLink Report", :align => :center
  font "Courier", :size => 16
  text "As of #{Time.now.month}/#{Time.now.day}/#{Time.now.year} - #{Time.now.hour}:#{Time.now.min}", :align => :center
  font "Courier", :size => 10
  text "#{link_checker.good_links}", :align => :left

  # Keeping the 404's on a different page
  start_new_page
  font "Courier", :size => 24
  text "#{url}\n404 Report", :align => :center
  font "Courier", :size => 10
  text "#{link_checker.bad_links}", :align => :left
end

puts 'Finished' if verbose