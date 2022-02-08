//
//  SideMenuView.swift
//  Can Counter 3.0 (iOS)
//
//  Created by Samuel Wiatrzyk on 2022-01-19.
//

import SwiftUI


struct SideMenuView: View {
    @AppStorage("isShowing") private var isShowing = false
    
    @AppStorage("backgroundColor") var yourCondition7: Int = 0
    
    // These cases allow for the background of the hamburger view to be changed depending on the state of the yourCondition7 variable which is controlled in the CustomCountView via a picker.
    var colorToShow5: LinearGradient {
            switch yourCondition7 {
                case 0:
                // Blue
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.5918939429593374, saturation: 0.8942518119352411, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.6472844503012049, saturation: 0.29056852409638556, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                   // Yellow
                case 1:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.1587502353162651, saturation: 0.7879888695406627, brightness: 0.9629582784262049, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1780932323042169, saturation: 0.29056852409638556, brightness: 0.7448201007153615, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 2:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.4602433170180723, saturation: 0.7879888695406627, brightness: 0.9629582784262049, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.49154332172439763, saturation: 0.49491422722138556, brightness: 0.7448201007153615, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 3:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.7790939147213856, saturation: 0.7725109422063253, brightness: 0.9629582784262049, opacity: 1.0), location: 0.00046574519230769233), Gradient.Stop(color: Color(hue: 0.4942259271460844, saturation: 0.810208607868976, brightness: 0.7448201007153615, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)

            case 4:
                return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.013086525790662652, saturation: 0.7795969032379518, brightness: 0.8776708396084338, opacity: 1.0), location: 0.0006911057692307693), Gradient.Stop(color: Color(hue: 0.15296145519578314, saturation: 0.810208607868976, brightness: 0.9179187452936748, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                default:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.0, saturation: 0.00449159920933735, brightness: 1.0, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.0, saturation: 0.0, brightness: 0.8660668062876506, opacity: 1.0), location: 0.30480769230769234), Gradient.Stop(color: Color(hue: 0.05667003953313254, saturation: 0.5954678087349398, brightness: 0.9759212631777109, opacity: 0.8526537791792169), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            }
        }
    
    var body: some View {
        ZStack {
            
            ZStack {
                Color.clear
                            .contentShape(Rectangle())
                            .ignoresSafeArea()
                            // This ontap gesture simply allows the user to tap the screen to return to the HomeView
                            .onTapGesture {
                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                    stiffness: 50.0,
                                                                    damping: 8,
                                                                    initialVelocity: 0)) {
                                    isShowing = false
                                }
                            }// This if statemenet contained within the gesture command is to allow for a drag gesture to the left to exit the hamburger view and return to the HomeView
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                                .onEnded({ value in
                                                    if value.translation.width < 0 {
                                                        withAnimation( .interpolatingSpring(mass: 1.0,
                                                                                            stiffness: 50.0,
                                                                                            damping: 8,
                                                                                            initialVelocity: 0)) {
                                                            isShowing = false
                                                        }
                                                    }

                                                    if value.translation.width > 0 {
                                                        // right
                                                    }
                                                    if value.translation.height < 0 {
                                                        // up
                                                    }

                                                    if value.translation.height > 0 {
                                                        // down
                                                    }
                                                }))
                            
                VStack {
                    
                    Spacer()
                    // Header
                    HStack {
                        Text("Empties Counter").foregroundColor(.white).padding().font(.system(size: 35, weight: .bold))
                        Spacer()
                    }
                    
                    Spacer()

                    // Option View for further navigation within the application.
                    SideMenuOptionView()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                
            }
          
        }.background(colorToShow5).ignoresSafeArea()

    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
