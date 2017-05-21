# Web Crawler 200 Pts.

### Create a program that can be executed from the command line and takes one argument – the address of a website.

You would run it like this:
 ruby    webcrawler.rb    www.adobe.com

**The program will take this website and...**
* make an HTTP network connection to the site
* download the HTML for the top level page.

* Use ARGV to get the input website to check.
* Parse the page and collect all of the <a href=…> tags from the document
* store each tag and its component parts into separate Link class objects.

**This object (Link) should have the following attributes:**
* link
* click_value
* link_type
* code as instance variables.

*The link would be the actual string from inside the href="…" tag – the URL to the resource.*
*click_value would be the text from inside the <a> … </a> tag – what the user clicks on that shows in the HTML.*
*link_type would be either "internal" or "external".*  
**An internal link** is defined as a link that starts with "/…" a slash.
**An external link** would be any URL that goes to an external site such as href=http://google.com.
If www.adobe.com is your starting site, then a link to http://www.adobe.com/* would be an internal site, not external.
*Only links going to areas outside of the base URL would be considered external.*
*code is the HTTP response code value that is returned if you were to request this URL.  ie.  **200**, or **404***

**The Link class should have methods which will...**
* X print back a full <a href="link">click_value</a> string for itself
* X a to_s method
* X and a check_link method which will fill in the code instance variable with the response code of actually trying to access the link.

**Create another class called LinkChecker** which has an array to store all of the Links that are created as above.
This should have methods like "add_link".
I suggest having a class variable called "@@baseurl" as well.
Make the Link class as a subclass of LinkChecker, you can use this variable in your link class to see if the link is external or internal.

Using the LinkChecker object...
iterate through all of the Links and try and access the link through the Net::HTTP.get_response method
storing the code from this response for each link object.

Use your array of links to print out a sorted list of URL's and their status code.

**Print out all of the 404 errors as a separate report.**

Utilize the PDF-writer or Prawn GEM to...
create a new PDF file which has the sorted list of valid URL's
a list of the 404 errors that were created from your scan of the top level of the website specified on the command line.

Turn in the ruby file(s) as well as the PDF file that is generated from your program.
HINT:  To make a URL inside of a PDF document actually clickable, you must create the link like this:
(ie. print to the PDF this type of string instead of just a url)
<c:alink uri="http://adobe.com/missing.html">Missing Page</c:alink> 

Extra Credit (20 pts):
Use the Enumerable Module as a MixIn and override the method "each" inside your LinkChecker class so that you can iterate through your list of Links easier.
To make this work properly, you will also need to use the Comparable Module as a MixIn to the Link class and override the < = > (spaceship) operator.
See page 454 in the Pickaxe textbook or research this online.
