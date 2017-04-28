//
//  MapPins.swift
//  Journey
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit
import MapKit

class MapPins: UIViewController, UISearchBarDelegate

{
    @IBOutlet weak var mapView: MKMapView!

//@IBOutlet weak var mapView: MKMapView!
var searchController: UISearchController! //manages presentation of search bar
var annotation: MKAnnotation!
var localSearchRequest: MKLocalSearchRequest! //request search for POI
var localSearch: MKLocalSearch! //initiates the search
var localSearchResponse: MKLocalSearchResponse! //stores search result
var pointAnnotation: MKPointAnnotation! //puts pins on screen
var pinAnnotationView: MKPinAnnotationView!



override func viewDidLoad()
{
    super.viewDidLoad()
    
    
}


func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
{
    //step 1: once key board search button is clicked, app will dismiss search controller, then the map will look for any previosu drawn annotations and remove them
    
    searchBar.resignFirstResponder()//takes away keyboard
    dismiss(animated: true, completion: nil)
    if mapView.annotations.count != 0
    {
        self.annotation = self.mapView.annotations[0]
        self.mapView.removeAnnotation(self.annotation)
        //clearing out any left over pins
    }
    
    //step 2: search process will be initatiated turning search bar text into natural language quiery that will figure out POI"S for you
    localSearchRequest = MKLocalSearchRequest()
    localSearchRequest.naturalLanguageQuery = searchBar.text
    localSearch = MKLocalSearch(request: localSearchRequest)
    localSearch.start
        {(localSearchResponse, error) in
            if localSearchResponse == nil
            {
                let alertController = UIAlertController(title: "Place not found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default
                    , handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return //in case of no result
            }
            
    }
    //step 3: if search returns a valid coordiante, then the app will put it on the map
    
    self.pointAnnotation = MKPointAnnotation()
    self.pointAnnotation.title = searchBar.text
    self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
    self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
    self.mapView.centerCoordinate = self.pointAnnotation.coordinate
    self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
    self.centerMap(location: self.pointAnnotation.coordinate)
    
}



func centerMap(location: CLLocationCoordinate2D)
{
    let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
    let region = MKCoordinateRegion(center: location, span: span)
    mapView.setRegion(region, animated: true)
}
}


