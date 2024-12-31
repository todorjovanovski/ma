import Foundation
import UIKit
import MapKit
import CoreLocation

class MapView:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        map.showsUserLocation = true
        
        let coordinate = CLLocationCoordinate2D(latitude: 42.006514, longitude: 21.502489)
        let title = "Gurman"
        let subtitle = "Restoran"

        addPlaceToMap(coordinate: coordinate, title: title, subtitle: subtitle)
    }
    
    @IBOutlet weak var map: MKMapView!
    var annotations: [MKPointAnnotation] = []
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
    func addPlaceToMap(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        
        map.addAnnotation(annotation)
        
        annotations.append(annotation)
    }
    
}
