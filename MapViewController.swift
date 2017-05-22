//
//  MapViewController.swift
//  Journey
//
//  Created by Student on 5/15/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate
    
{
    var annotation: MKAnnotation!
    var localSearchRequest: MKLocalSearchRequest!
    var localSearch: MKLocalSearch!
    var pointAnnotation: MKPointAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    
    @IBOutlet weak var mapView: MKMapView!
    var myDiaryObjectMap = [DiaryClass]()
    
    //    var myDiaryObjectMap : [DiaryClass]()
    
    //= ViewController.init().getDiaryObject()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addPins()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //addPins()
    }
    
    func addPins()
    {
        for item in myDiaryObjectMap {
            
            print(item.location)
            
            let localSearchRequest = MKLocalSearchRequest()
            localSearchRequest.naturalLanguageQuery = item.location
            let localSearch = MKLocalSearch(request: localSearchRequest)
            localSearch.start { (localSearchResponse, error) in
                if localSearchResponse == nil {
                    print(error)
                    return
                }
                let locations = localSearchResponse!.mapItems
                self.displayMap(placemark: locations.first!.placemark)
            }
        }
    }
    
    
    
    
    //        print("\(myDiaryObjectMap)")
    //        let item: DiaryClass = myDiaryObjectMap[0]
    //        print(item.location)
    
    //         let localSearchRequest = MKLocalSearchRequest()
    //        localSearchRequest.naturalLanguageQuery = item.location
    //               let localSearch = MKLocalSearch(request: localSearchRequest)
    //             localSearch.start { (localSearchResponse, error) in
    //              if localSearchResponse == nil
    //              {
    //                  print(error)
    //                return
    //                   }
    //                 let locations = localSearchResponse!.mapItems
    //               //self.displayMap(placemark: locations.first!.placemark)
    //          }
    
    
    func displayMap(placemark : MKPlacemark)
    {
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: center, span: span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        //mapView.setRegion(region, animated: true)
    }
}
