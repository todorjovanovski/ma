import UIKit



class FoodViewItems: UITableViewController
{
    @IBOutlet weak var foodTableView: UITableView!
    var foodItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
    }

    func initList(){
        let dish = Item(name: "Burger", img:  "burger", desc: "A smash burger is a type of hamburger, with a thin beef patty cooked on a super-hot griddle.")
        foodItems.append(dish)
        let salad = Item(name: "Salad", img:  "salat", desc: "This simple green salad is healthy, refreshing, and delicious. A perfect side dish, it pairs well with almost anything!")
        foodItems.append(salad)
        let cake = Item(name: "Cake", img:  "cake", desc: "Ultra moist, buttery, tender, and soft cake with the best red velvet flavor. Finished with easy cream cheese frosting.")
        foodItems.append(cake)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    override   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FoodViewItems"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        let foodItem = foodItems[indexPath.row]
        
        cell.foodName.text = foodItem.name
        cell.foodImage.image =  UIImage(named: foodItem.img)

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            self.performSegue(withIdentifier: "foodDetailLink", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if(segue.identifier == "foodDetailLink")
            {
                let indexPath = self.foodTableView.indexPathForSelectedRow!
                
                let tableViewDetail = segue.destination as? FoodViewDetail
                
                let selectedFood = foodItems[indexPath.row]
                
                tableViewDetail!.selectedFood = selectedFood
                
                self.foodTableView.deselectRow(at: indexPath, animated: true)
            }
        }
}
