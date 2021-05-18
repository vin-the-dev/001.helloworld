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
    
    
    let gradientColorStart = Color(UIColor(hex: "#F05E02FF")!)
    let gradientColorEnd = Color(UIColor(hex: "#F08801FF")!)
    
    
    var body: some View {
        GeometryReader { metric in
            ZStack {
                VStack {
                    VStack (alignment: .leading) {
                        ZStack {
                            Image("iron-man")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("Login")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 50)
                                        .padding()
                                }
                            }
                        }
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxWidth: .infinity,
                           minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxHeight: metric.size.height * 0.5,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [gradientColorStart, gradientColorEnd]),
                            startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                            endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    )
                    .clipShape(CustomShape())
                    .ignoresSafeArea()
                    Spacer()
                }
                VStack {
                    Spacer()
                    VStack {
                        VStack {
                            HStack {
                                Image("mail")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding()
                                TextField("Email", text:$txtEmail)
                                    .frame(height: 30)
                            }
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
                            .padding(.all, 10)
                            
                            HStack {
                                Image("password")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding()
                                SecureField("Password", text:$txtEmail)
                                    .frame(height: 30)
                            }
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
                            .padding(.all, 10)
                            HStack {
                                Spacer()
                                Text("Forgot Password?")
                                    .font(.footnote)
                            }
                            .padding(.all, 10)
                            Button {
                                print("Login Tapped")
                            } label: {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .frame(width: 300, height: 50, alignment: .center)
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [gradientColorStart, gradientColorEnd]), startPoint: .leading, endPoint: .trailing)
                                    )
                                    .cornerRadius(25)
                            }
                            
                            HStack {
                                Text("Don't have an account?")
                                Text("Register")
                                    .foregroundColor(gradientColorStart)
                            }
                            .padding(.top, 10)
                        }
                        .padding()
                        
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                           minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxHeight: metric.size.height * 0.5,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let p1 = CGPoint(x: rect.width, y: 0)
            let p2 = CGPoint(x: 0, y: 0)
            let p3 = CGPoint(x: 0, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height)
            
            path.move(to: p4)
            
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 0)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 0)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 100)
            path.addArc(tangent1End: p4, tangent2End: p1, radius: 0)
            
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
