import Foundation


import CoreData

@objc(Comment)
class Comment:NSManagedObject{
    
    @NSManaged var id: NSNumber!
    @NSManaged var comment:String!
    @NSManaged var deletedDate:Date?
    @NSManaged var item: String!
}
