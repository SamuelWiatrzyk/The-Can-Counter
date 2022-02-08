import SwiftUI
import Neumorphic
import UIKit
import CoreHaptics

import AVFoundation



struct Home: View {

    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("newPage") private var canAmount: Double = 0
    @AppStorage("page2") private var bottleAmount: Double = 0
    @State private var showCountView = false
    @AppStorage("isShowing") private var isShowing = false
    
    
    @AppStorage("plussix") private var plusSixIsShowing = false
    
    @AppStorage("canColor") var yourCondition: Int = 1
    
    
    @AppStorage("HiddenButton") private var isHidden: Bool = false
    
    @AppStorage("buttonView") private var buttonViewHidden: Bool = false
    
    
    
    
    
    
    let impactMed = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        
            NavigationView {
                
                
                ZStack {
        
                    
                    ZStack {
                        if isShowing {
                            SideMenuView()
                        }
                        
                        
                        HomeView()
                            .cornerRadius(isShowing ? 20 : 10)
                            .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                            .scaleEffect(isShowing ? 0.8 : 1)
                            .navigationBarItems(leading: Button(action: {
                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                    stiffness: 50.0,
                                                                    damping: 8,
                                                                    initialVelocity: 0)) {
                                    isShowing.toggle()
                                }
                            }, label: {Image(systemName: "list.bullet").frame(width: 24, height: 24)
                                    .font(.system(size: 25)).foregroundColor(.black)
                            }), trailing:
                                HStack {
                                if isHidden == true {
                                    NavigationLink(destination: ExtraButtons()) {
                                    Image(systemName: "platter.2.filled.iphone")
                                        .frame(width: 24, height: 24)
                                        .font(.system(size: 25))
                                    
                                    }
                                }
                                    }
                                                    .foregroundColor(.black))
                           
                    }
                }
                
                                                                
 
        
            
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct HomeView: View {
    @AppStorage("HiddenButton") private var isHidden: Bool = false
   
    
    @AppStorage("showPlusSix") private var showPlusSix = false
    
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("newPage") private var canAmount: Double = 0
    @AppStorage("page2") private var bottleAmount: Double = 0
    @State private var showCountView = false
    @AppStorage("isShowing") private var isShowing = false
    @AppStorage("buttonView") private var buttonViewHidden: Bool = false
    
    @AppStorage("canConvert") private var inputUnit = 0
    @AppStorage("bottleConvert") private var inputUnit2 = 0
    let inputUnits = ["5", "10", "20"]
    let inputUnits2 = ["5", "10", "20"]
    @AppStorage("canColor") var yourCondition: Int = 1
    
    @AppStorage("SoundBool") var soundBool: Bool = true
    
    
    
    var colorToShow: LinearGradient {
            switch yourCondition {
                case 0:
                // Blue
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.5061741105045181, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5932440700301206, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
                   // Yellow
                case 1:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.14118093467620482, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 2:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.2314011907003012, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.2974162274096386, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 3:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.7982868975903615, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5283850244728916, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            case 4:
                return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.09875341208584339, saturation: 0.4656791227409639, brightness: 1.0, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.9825130600527109, saturation: 0.7391813347138555, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                default:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
            }
        }
    
    @AppStorage("bottleColor") var yourCondition2: Int = 1
    var colorToShow2: LinearGradient {
            switch yourCondition2 {
                case 0:
                // Blue
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.5061741105045181, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5932440700301206, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
                   // Yellow
                case 1:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.14118093467620482, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 2:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.2314011907003012, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.2974162274096386, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 3:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.7982868975903615, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5283850244728916, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            case 4:
                return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.09875341208584339, saturation: 0.4656791227409639, brightness: 1.0, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.9825130600527109, saturation: 0.7391813347138555, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                default:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
            }
        }
    
    @AppStorage("canAmount") private var canAmount2: Double = 0
    @AppStorage("bottleAmount") private var bottleAmount2: Double = 0
    
    // toggle for hatic feedback
    @AppStorage("HapticBool") var hapticBool: Bool = true
    
    var body: some View {
        ZStack {
   
            
            VStack {
        
                Spacer()
                
                
                HStack {
                    
                    Button(action: {
                        
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1105)
                        }
                        
                        if hapticBool == true {
                            
                        let impactMed = UIImpactFeedbackGenerator(style: .soft)
                        
                        impactMed.impactOccurred()
                        }
                        canAmount -= 1}, label: {
                            
                            VStack {
                                Image(systemName: "minus")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 40, alignment: .center)
                                    .background(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing))
                                    .clipShape(Circle())
                                
                                
                            }
                        })
                        .softButtonStyle(Circle(), pressedEffect: .hard).padding(.top, 250).padding(.trailing, 50)
                    
                    Text("").foregroundColor(.white).padding(.trailing, 110)
                    
                    
                        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .fixedSize()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(
                            color: Color(white: 1.0).opacity(0.9),
                            radius: 18,
                            x: -18,
                            y: -18)
                        .clipShape(Rectangle())
                    
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 40, alignment: .center)
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                }.background(
                    
                    Button(action: { withAnimation(.easeInOut) {
                        
                        if hapticBool == true {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        
                        impactHeavy.impactOccurred()
                        }
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1103)
                        }
                        canAmount += 1}}, label: {
                            VStack {
                                Image(systemName: "")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 280, alignment: .center)
                                    .background(colorToShow)
                                    .cornerRadius(10)
                            }  .onTapGesture {
                                if hapticBool == true {
                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                
                                impactHeavy.impactOccurred()
                                }
                                if soundBool == true {
                                AudioServicesPlaySystemSound(1103)
                                }
                                
                                canAmount += 1
                            }
                            
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            if value.translation.width < 0 {
                                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                                    stiffness: 50.0,
                                                                                    damping: 8,
                                                                                    initialVelocity: 0)) {
                                                    if isShowing == true {
                                                    isShowing = false
                                                    } 
                                                    
                                                    
                                                }

                                            }

                                            if value.translation.width > 0 {
                                                // right
                                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                                    stiffness: 50.0,
                                                                                    damping: 8,
                                                                                    initialVelocity: 0)) {
                                                    if isShowing == false {
                                                    isShowing = true
                                                    }
                                                }
                                                
                                                
                                            }
                                            if value.translation.height < 0 {
                                                // up
                                            }

                                            if value.translation.height > 0 {
                                                // down
                                            }
                                        }))
                            
                        }).softButtonStyle(Rectangle())
                        .cornerRadius(10)
                        .frame(width: 70, height: 80, alignment: .center)
                        .padding(.bottom, 0)
                        .frame(width: 350, height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                ).overlay(
                    HStack {
                        Spacer()
                        if inputUnit == 0 { VStack {
                            
                            Text("Rate: 5¢ / Can").foregroundColor(.white)
                            Text("Return: $ \(canAmount * 0.05, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit == 1 { VStack {
                            
                            Text("Rate: 10¢ / Can").foregroundColor(.white)
                            Text("Return: $ \(canAmount * 0.1, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit == 2 { VStack {
                            Text("Rate: 20¢ / Can").foregroundColor(.white)
                            Text("Return: $ \(canAmount * 0.2, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }.opacity(buttonViewHidden ? 1 : 0).padding(.trailing, 100)
                ).overlay(HStack {
                    if showPlusSix == true {
                        Spacer()
                        VStack {
                            Button(action: {
                                if hapticBool == true {
                                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                    
                                    impactMed.impactOccurred()
                                }
                                canAmount += 6}, label: { HStack {
                                Text("6 +") .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .background(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.30194312405873497, saturation: 0.4821630271084338, brightness: 0.8673551628388555, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.2559770331325301, saturation: 0.7818029932228916, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
                                    .clipShape(Circle())
                            }}).softButtonStyle(Circle()).padding(.bottom, 220)
                            
                        }
                        
                    }
                }).overlay(
                    VStack {
                        if isShowing == true {
                    Text("\(canAmount, specifier: "%g")").font(.title).foregroundColor(.white).padding(.trailing, 190)
                    Text("Cans").font(.title).foregroundColor(.white).padding(.trailing, 190)
                        } else { Text("\(canAmount, specifier: "%g") Cans").font(.title).foregroundColor(.white)}
                }
                    
                )
                    
                   .padding()
                
                
                
                HStack {
                    
                    Button(action: {
                        
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1105)
                        }
                        if hapticBool == true {
                        let impactMed = UIImpactFeedbackGenerator(style: .soft)
                        
                        impactMed.impactOccurred()
                        }
                        
                        bottleAmount -= 1}, label: {
                            
                            VStack {
                                Image(systemName: "minus")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 40, alignment: .center)
                                    .background(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing))
                                    .clipShape(Circle())
                                
                                
                            }
                        })
                        .softButtonStyle(Circle(), pressedEffect: .hard).padding(.top, 250).padding(.trailing, 50)
                    
                    Text("").foregroundColor(.white).padding(.trailing, 110)
                    
                    
                        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .fixedSize()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(
                            color: Color(white: 1.0).opacity(0.9),
                            radius: 18,
                            x: -18,
                            y: -18)
                        .clipShape(Rectangle())
                    
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 40, alignment: .center)
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                }.background(
                    
                    Button(action: { withAnimation(.easeInOut) {
                        
                        if hapticBool == true {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        
                        impactHeavy.impactOccurred()
                        }
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1103)
                        }
                        
                        bottleAmount += 1}}, label: {
                            VStack {
                                Image(systemName: "")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 280, alignment: .center)
                                    .background(colorToShow2)
                                    .cornerRadius(10)
                            }
                            
                            .onTapGesture {
                                if hapticBool == true {
                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                
                                impactHeavy.impactOccurred()
                                }
                                if soundBool == true {
                                AudioServicesPlaySystemSound(1103)
                                }
                                
                                bottleAmount += 1
                            }
                            
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            if value.translation.width < 0 {
                                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                                    stiffness: 50.0,
                                                                                    damping: 8,
                                                                                    initialVelocity: 0)) {
                                                    if isShowing == true {
                                                    isShowing = false
                                                    }
                                                }
                                                    

                                            }

                                            if value.translation.width > 0 {
                                                // right
                                                withAnimation( .interpolatingSpring(mass: 1.0,
                                                                                    stiffness: 50.0,
                                                                                    damping: 8,
                                                                                    initialVelocity: 0)) {
                                                    if isShowing == false {
                                                    isShowing = true
                                                    }
                                                }
                                                
                                                
                                            }
                                            if value.translation.height < 0 {
                                                // up
                                            }

                                            if value.translation.height > 0 {
                                                // down
                                            }
                                        }))
                            
                        }).softButtonStyle(Rectangle())
                        
                    
                        .cornerRadius(10)
                        .frame(width: 70, height: 80, alignment: .center)
                        .padding(.bottom, 0)
                        .frame(width: 350, height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                ).overlay(
                    
                    
                    
                    HStack {
                        Spacer()
                        if inputUnit2 == 0 { VStack {
                            
                            Text("Rate: 5¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount * 0.05, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit2 == 1 { VStack {
                            
                            Text("Rate: 10¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount * 0.1, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit2 == 2 { VStack {
                            Text("Rate: 20¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount * 0.2, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }.opacity(buttonViewHidden ? 1 : 0).padding(.trailing, 105)
                ).overlay(HStack {
                    if showPlusSix == true {
                        Spacer()
                        VStack {
                            Button(action: {
                                
                                
                                if hapticBool == true {
                                
                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                
                                impactHeavy.impactOccurred()
                                    
                                }
                                
                                bottleAmount += 6}, label: { HStack {
                                Text("6 +") .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .background(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.30194312405873497, saturation: 0.4821630271084338, brightness: 0.8673551628388555, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.2559770331325301, saturation: 0.7818029932228916, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
                                    .clipShape(Circle())
                            }}).softButtonStyle(Circle()).padding(.bottom, 220)
                            
                        }
                        
                    }
                }
                )
                    .overlay(
                        VStack {
                            if isShowing == true {
                        Text("\(bottleAmount, specifier: "%g")").font(.title).foregroundColor(.white).padding(.trailing, 190)
                        Text("Bottles").font(.title).foregroundColor(.white).padding(.trailing, 190)
                            } else { Text("\(bottleAmount, specifier: "%g") Bottles").font(.title).foregroundColor(.white)}
                    }
                        
                    )
                       .padding()
                
                    
                Spacer()
                
                
                
                
                
            } .navigationBarTitle(Text(""))
            
                
                
            
                
                .preferredColorScheme(.light)
        }
        
        
    }
}
}
