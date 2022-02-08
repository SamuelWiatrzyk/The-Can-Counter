//
//  ContentView.swift
//  Shared
//
//  Created by Samuel Wiatrzyk on 2021-12-22.
//

import SwiftUI
import Neumorphic



struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        if currentPage >= 5 {
            Home()
        } else {
            WalkthroughScreen().preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen().preferredColorScheme(.light)
    }
}





struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            
            
            
            if currentPage == 1 {
                ScreenView(image: "iphone.homebutton.circle.fill", title: "How To Use It", detail: "Keep track of your aluminum cans and glass bottles on your iPhone as you clean them up with the help of this app by simply pressing on the blue \"+\" icon and removing them with the red \"-\" icon.", bgColor: Color(.systemRed)).transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "book.closed.circle", title: "Keep Track of History", detail: "Keep track of your total money earned and history, aswell as current count in the \"History\" section.", bgColor: Color(.systemTeal)).transition(.scale)
            }
            if  currentPage == 3 {
                ScreenView(image: "cart.circle", title: "Make Your Return", detail: "Reset your cart when you're ready to make your return and record it to your history.", bgColor: Color(.systemGreen)).transition(.scale)
                
            }
            if currentPage == 4 {
                ScreenView(image: "questionmark.circle", title: "Need Help?", detail: "Refer back to this section anytime by tapping the help button in the dropdown menu.", bgColor: Color(.systemYellow)).transition(.scale)
            }
    
            
            
            
            
        }.overlay(
        
            Button(action: {
                withAnimation(.easeInOut) {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        
                    impactHeavy.impactOccurred()
                    
                    if currentPage < totalPages {
                        currentPage += 1
                    }
                    
                    else {
                         currentPage = 1
                    }
                }
            }, label: {
                
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 70, height: 80, alignment: .center)
                .background(Color.blue)
                .clipShape(Circle())
                .overlay(
                
                
                    ZStack {
                        
                        
                        Circle()
                            .stroke(Color.black.opacity(0.04), lineWidth: 4)
                        
                            
                        Circle()
                            .trim(from: 0, to: CGFloat(currentPage) / 4)
                            .stroke(Color.white, lineWidth: 10)
                            .rotationEffect(.init(degrees: -90))
                        
                        
                        
                        
                        
                    }
                    .padding(-15)
                    
                    
                )

            
        })
            
        .softButtonStyle(Circle())
        .frame(width: 70, height: 80, alignment: .center)
        .padding(.bottom, 0)
        ,alignment: .bottom)
    }
}

struct ScreenView: View {
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack {
            
            HStack {
                if currentPage == 1 {
                    Text("About the App")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .colorInvert()
                } else {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                
                            impactHeavy.impactOccurred()
                            
                            if currentPage == 0 { currentPage = 1}
                            else { currentPage -= 1 }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                    }).background(
                        RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 20))
                        
                    )
                }
                
                Spacer()
                
                Button(action: {withAnimation(.easeInOut) {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    
                    impactHeavy.impactOccurred()
                    currentPage = 5}}, label: {
                    Text("Skip").fontWeight(.semibold)
                        .kerning(1.2)
                        .colorInvert()
                }).softButtonStyle(Capsule())
                    .padding()
                
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            
                
            Image(systemName: image)
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 7)
                .aspectRatio(contentMode: .fit)
                .colorInvert()
                .padding()
            
            Text(title).foregroundColor(.black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .colorInvert()
                
            
        VStack {
            
            Text(detail)
                
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .colorInvert()
                .padding()
            
            }
            
            Spacer(minLength: 120)
        }
        .background(bgColor.ignoresSafeArea())
    }
}

var totalPages = 5

