import Foundation

import UIKit

class DrinkViewDetail:UIViewController{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UITextView!
    
    var selected:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = selected.name
        img.image = UIImage(named: selected.img)
        desc.text = selected.desc
    }
}
