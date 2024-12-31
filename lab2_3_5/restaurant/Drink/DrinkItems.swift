import UIKit

class DrinkViewItems: UITableViewController
{
    @IBOutlet weak var drinkTableView: UITableView!
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
    }

    func initList(){
        let whiskey = Item(name: "Whiskey", img:  "whiskey", desc: "Hugely popular Irish blend, renowned for its affinity with ginger ale. The default springboard into the fascinating world of Irish whiskey, Jameson's quality has improved massively in the last 10-15 years.")
        items.append(whiskey)
        let mohito = Item(name: "Guinness", img:  "guinness", desc: "Guinness is one of the most successful alcohol brands worldwide, brewed in almost 50 countries, and available in over 120.")
        items.append(mohito)
        let wine = Item(name: "Wine", img:  "wine", desc: "Lyme Bay Winery cherry wine is a smooth, full-flavoured sweet wine with a real cherry aroma & a hint of almond.")
        items.append(wine)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DrinkViewItems"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCellDrinks
        
        let foodItem = items[indexPath.row]
        
        cell.name.text = foodItem.name
        cell.img.image =  UIImage(named: foodItem.img)

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            self.performSegue(withIdentifier: "drinkDetailLink", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if(segue.identifier == "drinkDetailLink")
            {
                let indexPath = self.drinkTableView.indexPathForSelectedRow!
                
                let tableViewDetail = segue.destination as? DrinkViewDetail
                
                let selected = items[indexPath.row]
                
                tableViewDetail!.selected = selected
                
                self.drinkTableView.deselectRow(at: indexPath, animated: true)
            }
        }
}
