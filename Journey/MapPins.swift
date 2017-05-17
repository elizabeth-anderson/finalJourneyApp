//
//  MapPins.swift
//  Journey
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit
import MapKit

class MapPins: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var myMapView: MKMapView!
    
//    var annotation: MKAnnotation!
//    var localSearchRequest: MKLocalSearchRequest!
//    var localSearch: MKLocalSearch!
    //var pointAnnotation: MKPointAnnotation!
//    var pinAnnotationView: MKPinAnnotationView!
    var myDiaryObjectMap : [DiaryClass] = ViewController.init().myDiaryObject
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myMapView.delegate = self
        addPins()
    }
    
    func addPins()
    {
        for item in myDiaryObjectMap
        {
            print(item.location)
            let localSearchRequest = MKLocalSearchRequest()
            localSearchRequest.naturalLanguageQuery = item.location
            let localSearch = MKLocalSearch(request: localSearchRequest)
            localSearch.start(completionHandler: { (localSearchResponse, error) in
                if localSearchResponse == nil
                {
                    print(error)
                    return
                }
                let locations = localSearchResponse!.mapItems
                let placemark = locations.first!.placemark
                let center = placemark.location!.coordinate
                let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
                let region = MKCoordinateRegion(center: center, span: span)
                let pin = MKPointAnnotation()
                pin.coordinate = center
                pin.title = placemark.name
                self.myMapView.addAnnotation(pin)
                self.myMapView.setRegion(region, animated: true)
                
                
//                let pointAnnotation = MKPointAnnotation()
                //self.pointAnnotation = MKPointAnnotation()
                //pointAnnotation.title = item.location
//                let pinCoordinateLatLong = CLLocationCoordinate2D(latitude: (localSearchResponse!.boundingRegion.center.latitude), longitude: (localSearchResponse!.boundingRegion.center.longitude))
//                print(localSearchResponse!.boundingRegion.center.latitude)
//                print(localSearchResponse!.boundingRegion.center.longitude)
                
//                pointAnnotation.coordinate = pinCoordinateLatLong
                
//                self.myMapView!.addAnnotation(pointAnnotation)
                
                //pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                
                //pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
                
                
               //self.centerMap(location: pointAnnotation.coordinate)
            })
            
        }
        
    }
    
    func centerMap(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(region, animated: true)
    }
    
    
    
    
}
