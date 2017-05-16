require 'net/https'
require 'prawn'

website = ARGV[0]
puts website
puts ARGV.inspect
response = Net::HTTP.get_response( website, '/')
puts response.code
puts response.body

Prawn::Document.generate( "pdf_bin/helloworld.pdf" ) do
  font "Courier", :size => 24
  text "Hello World", :align => :center
  font "Courier", :size => 10
  text "#{website} - #{response.code}", :align => :left
  start_new_page
  #font "Courier", :size => 10
  #text "#{response.body}"
end

