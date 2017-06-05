# CIS 283 – Books Class
### Class Members and Array Filtering

**To turn in:**
* Submit as an attachment to the assignment in ~~Angel~~ Canvas 
* Attach lastname_book.rb, lastname_bookprogram.rb
---
**To do:**
* Write a menu driven application to manage books for Geeks Publishing, Inc.
* Book class will have these properties: title, author, number_of_pages
* Book class will have a class variable called publisher that is shared by all objects and set to Geeks Publishing, Inc.
* Book class will have at least these: initialize, to_s, attr_*
* Add other methods as necessary
* Read a file of books into your memory structure.  Create a new book object for each line in the file and add that book to an Array in your main program.
* File will be a tab delimited list of books
* Write the file of books at the end of the program (on exit)

Menu options need to be exactly like this:
1. View all Books
2. Add book
3. Update book
4. Delete book
5. View book with most pages
6. View book with least pages
7. View books with pages greater than or equal to 1000
8. View books with pages less than 1000
9. View books with pages between 500-1000 inclusive
10. exit   (be sure to save file back out)

* validation is required
* no empty properties
* number of pages must be an integer
* Put book class in separate file and include it into file where main program is.  

**You will need to submit 3 files for this assignment:**
* BookClass.rb   (Contains the class Book)
* BookMain.rb	(Main program which utilizes the book class)
* books_file.txt  (Storage for your books)