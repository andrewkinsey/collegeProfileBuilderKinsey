//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 3/6/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate
{

    @IBOutlet weak var myMapView: MKMapView!
    
    var mapCollegeClass: CollegeClass!
    
    var searchController: UISearchController!
    var annotation: MKAnnotation!
    var localSearchRequest: MKLocalSearchRequest!
    var localSearch: MKLocalSearch!
    var localSearchResponse: MKLocalSearchResponse!
    var pointAnnotation: MKPointAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    
    
   
    
    
    
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = "\(mapCollegeClass.name) University"
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start
            { (localSearchResponse, error) in
                if localSearchResponse == nil
                {
                    let alertController = UIAlertController(title: "place not found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                //step 3: if search returns a valid coordinate then the app will put it on the map
                self.pointAnnotation = MKPointAnnotation()
                self.pointAnnotation.title = "\(self.mapCollegeClass.name)  University"
                self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
                self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
                self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
                self.centerMap(location: self.pointAnnotation.coordinate)
        
            }
    }

   
    func showSearchBar(_ sender: Any)
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
   

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start
            { (localSearchResponse, error) in
                if localSearchResponse == nil
                {
                    let alertController = UIAlertController(title: "place not found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                //step 3: if search returns a valid coordinate then the app will put it on the map
                self.pointAnnotation = MKPointAnnotation()
                self.pointAnnotation.title = searchBar.text
                self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
                self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
                self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
                self.centerMap(location: self.pointAnnotation.coordinate)
            }
    

    }

    func centerMap(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(region, animated: true)
    }


}
