//
//  HomeViewController.swift
//  proyecto01
//
//  Created by Rafael Asencio on 04/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(findMe))
        self.navigationItem.leftBarButtonItem = button
        let myLocation = CLLocation(latitude: 37.408588, longitude: -6.060506)
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegion(center: myLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        
        mapView.delegate = self
        
        addSlideMenuButton()
    }
    
    func setUpNavigationBar(){
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(findMe))
    }
    @objc func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func findMe() {
    }

}

extension HomeViewController: MKMapViewDelegate {
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering..")
    }
}
