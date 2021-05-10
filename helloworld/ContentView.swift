//
//  ContentView.swift
//  helloworld
//
//  Created by Vineeth on 08/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    
    
    var body: some View {
        ZStack {
            Color(UIColor(hex: "#37A9E1FF")!)
                .ignoresSafeArea()
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding()
                        TextField("Enter Email", text:$txtEmail)
                            .keyboardType(.emailAddress)
                            .font(.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding()
                        SecureField("Enter Password", text: $txtPassword)
                            .font(.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                }
                Button {
                    print("Button Tapped")
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(UIColor(hex: "#1F70B6FF")!))
                        .cornerRadius(50)
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
