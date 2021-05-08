//
//  ContentView.swift
//  helloworld
//
//  Created by Vineeth on 08/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                .padding()
            Button {
                print("Button Tapped")
            } label: {
                Text("Button Name")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(50)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
