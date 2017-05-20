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

url = ARGV[0]

response = Net::HTTP.get_response(url, '/')

website = Link_Checker.new(url, response.body)
#puts response.body.scan(/<a.*href=["'](?:http:\/\/)?([^'"]*)["'].*>(.*)<\/a>/)
puts 'created website object'
website.find_links

