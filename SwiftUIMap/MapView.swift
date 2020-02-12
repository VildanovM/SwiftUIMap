//
//  MapView.swift
//  SwiftUIMap
//
//  Created by Максим Вильданов on 12.02.2020.
//  Copyright © 2020 Максим Вильданов. All rights reserved.
//

import MapKit
import SwiftUI

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    
    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        parent.centerCoordinate = mapView.centerCoordinate
        MKPointAnnotation.center.coordinate = mapView.centerCoordinate
    }
    
}


struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    let annotation = MKPointAnnotation()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {

    }
    
}

extension MKPointAnnotation {
    static var center: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 56.213675, longitude: 105.597033)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.center.coordinate))
    }
}
