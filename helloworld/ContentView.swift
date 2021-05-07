//
//  ContentView.swift
//  helloworld
//
//  Created by Vineeth on 08/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("It's a new world!!! Thanks for watching")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color.red)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
