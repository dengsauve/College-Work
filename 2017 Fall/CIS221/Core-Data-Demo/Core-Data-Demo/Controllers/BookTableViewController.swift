
import UIKit
// Step 1
import CoreData

class BookTableViewController: UITableViewController {
    
    // MARK: Structs
    struct PropertyKeys {
        static let bookCell = "BookCell"
        static let addBookSegue = "AddBook"
        static let editBookSegue = "EditBook"
    }
    
    // MARK: Variables
    var books: [NSManagedObject] = []
    
    var bookArchiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent("books")
    }
    
    // MARK: Functions
    func retrieveBooks(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Display Error")
            return
        }
        
        //3
        let context = appDelegate.persistentContainer.viewContext
        
        //4
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteBook")
        
        //5
        do
        {
            books = try context.fetch(fetchRequest)
        }
        catch let error as NSError
        {
            print("error \(error)")
        }
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        retrieveBooks()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if tableView.isEditing && books.count > 0{
                        
            //2
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                print("Display Error")
                return
            }
            
            //3
            let context = appDelegate.persistentContainer.viewContext
            
            //4
            context.delete(books[indexPath.row])
            
            //5
            do
            {
                try context.save()
                books.remove(at: indexPath.row)
            }
            catch let error as NSError
            {
                print("error \(error)")
            }
            
            if books.count == 0 {
                tableView.isEditing = false
            }
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count > 0 ? books.count : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if books.count == 0{
            tableView.isEditing = false
            let cell = tableView.dequeueReusableCell(withIdentifier: "noBooksFoundCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.bookCell, for: indexPath) as! BookTableViewCell
        
        // Core-Data
        let book = books[indexPath.row]
        
        cell.titleLabel?.text = book.value(forKeyPath: "title") as? String
        cell.authorLabel?.text = book.value(forKeyPath: "author") as? String
        cell.genreLabel?.text = book.value(forKeyPath: "genre") as? String
        cell.lengthLabel?.text = book.value(forKeyPath: "length") as? String
        
        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else {return}
        
        // Step 2: Create instance of AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Error on Step 2")
            
            return
        }
        
        // Step 3: Create ORM Context
        
        let context = appDelegate.persistentContainer.viewContext
        
        if let indexPath = tableView.indexPathForSelectedRow {
            // Update Record
            
            let entityToUpdate = books[indexPath.row]
            
            entityToUpdate.setValue(book.title, forKey: "title")
            entityToUpdate.setValue(book.author, forKey: "author")
            entityToUpdate.setValue(book.genre, forKey: "genre")
            entityToUpdate.setValue(book.length, forKey: "length")
            
            do
            {
                try context.save()
            }
            catch let error as NSError
            {
                print("Error in Step 6: \(error)")
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            // Create new record
            
            // Step 4: Choose working entity
            let entity = NSEntityDescription.entity(forEntityName: "FavoriteBook", in: context)
            
            // Step 5: Create Command with Values
            let favoriteBook = NSManagedObject(entity: entity!, insertInto: context)
            favoriteBook.setValue(book.title, forKey: "title")
            favoriteBook.setValue(book.author, forKey: "author")
            favoriteBook.setValue(book.genre, forKey: "genre")
            favoriteBook.setValue(book.length, forKey: "length")
            
            do
            {
                // Setp 6: Execute the Command
                try context.save()
            }
            catch let error as NSError
            {
                print("Error in Step 6: \(error)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookFormTableViewController = segue.destination as? BookFormTableViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editBookSegue {
            let bookRecord = books[indexPath.row]
            let book = Book(title: bookRecord.value(forKeyPath: "title") as! String,
                            author: bookRecord.value(forKeyPath: "author") as! String,
                            genre: bookRecord.value(forKeyPath: "genre") as! String,
                            length: bookRecord.value(forKeyPath: "length") as! String
            )
            
            bookFormTableViewController.book = book
        }
    }
    
}
