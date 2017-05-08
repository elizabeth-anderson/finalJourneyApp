//
//  MapPins.swift
//  Journey
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit
import MapKit

class MapPins: UIViewController,MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
   
    var annotation: MKAnnotation!
 
    var pointAnnotation: MKPointAnnotation! //puts pins on screen
    var pinAnnotationView: MKPinAnnotationView!
    
    //var myDiaryObject : [diaryClass] = []

   // var myDiaryInfo : [String] == []
    
   // myDiaryObject =
    

   // int[] myDiaryObject = new int[]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
   //self.mapView.delegate = self
//    
   func showMapPins()
   {

}
//
  
    
    
    
    func centerMap(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }



}

