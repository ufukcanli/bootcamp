//
//  Sample.swift
//  Flow
//
//  Created by Ufuk Canlı on 15.12.2021.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                action()
            } label: {
                Text("Button")
            }
            
            Spacer()
        }
    }
    
    func action() {
        print("Hello, World!")
    }
}
