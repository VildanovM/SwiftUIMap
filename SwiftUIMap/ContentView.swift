//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by Максим Вильданов on 12.02.2020.
//  Copyright © 2020 Максим Вильданов. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 100) {
                ZStack {
                    MapView(centerCoordinate: $centerCoordinate).edgesIgnoringSafeArea(.all)
                    Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                }
                Text("lat:\(centerCoordinate.latitude)\nlon:\(centerCoordinate.longitude)")
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

