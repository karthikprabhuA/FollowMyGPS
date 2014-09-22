//
//  ViewController.swift
//  FollowMyGPS
//
//  Created by Sathiya Karthik Prabhu on 21/09/14.
//  Copyright (c) 2014 Sathiya. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
                            
    @IBOutlet weak var latlong: UILabel!
    var locationManager:CLLocationManager!;
    var geocoder:CLGeocoder!;
    var placemark:CLPlacemark!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationInitialization();
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationInitialization()
    {
        locationManager = CLLocationManager();
        geocoder = CLGeocoder();
        
    }
    @IBAction func startPointingCurrentLocation(sender: AnyObject) {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startUpdatingLocation();
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        print(locations);
        
        var location:CLLocation! = locations.first as CLLocation;
        latlong.text = "\(location.coordinate.latitude)";
    }

}

