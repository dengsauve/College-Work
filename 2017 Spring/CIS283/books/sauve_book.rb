############################################################
#
#  Name:         Dennis Sauve
#  Date:         06-04-17
#  Assignment:   Books Class
#  Class:        CIS283
#  Description:  Menu Driven book managing application
#
############################################################

# Book class will have these properties: title, author, number_of_pages

class Book
  attr_reader :publisher, :pages
  @@publisher = 'Geeks Publishing, Inc.'

  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
  end

  def to_s
    return "#{@title}, by: #{@author}, #{@pages} pages"
  end

  def to_f
    return "#{@title}\t#{@author}\t#{@pages}"
  end
end