//
//  ExtraButtons.swift
//  Can Counter 3.0 (iOS)
//
//  Created by Samuel Wiatrzyk on 2022-01-19.
//
import AVFoundation
import SwiftUI

struct ExtraButtons: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("canAmount") private var canAmount2: Double = 0
    @AppStorage("bottleAmount") private var bottleAmount2: Double = 0
    @State private var showCountView = false
    @State private var isShowing = false
    @AppStorage("buttonView") private var buttonViewHidden: Bool = true
    
    @AppStorage("canColor2") var yourCondition5: Int = 1
    var colorToShow3: LinearGradient {
            switch yourCondition5 {
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
    
    @AppStorage("bottleColor2") var yourCondition6: Int = 1
    var colorToShow4: LinearGradient {
            switch yourCondition6 {
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
    
    
    @AppStorage("canConvert2") private var inputUnit3 = 0
    
    var convertCan2: Double {
    
        let fiveCent = 0.05 * Double(canAmount2)
        let tenCent = 0.10 * Double(canAmount2)
        let twentyCent = 0.2 * Double(canAmount2)
        
        if inputUnit3 == 0 {
            return fiveCent
        }   else if inputUnit3 == 1 {
            return tenCent
        } else if inputUnit3 == 2 {
            return twentyCent
        }
        return 0
    }
    
    @AppStorage("bottleConvert2") private var inputUnit4 = 0
    
    var convertBottle2: Double {
    
        let fiveCent = 0.05 * Double(bottleAmount2)
        let tenCent = 0.10 * Double(bottleAmount2)
        let twentyCent = 0.2 * Double(bottleAmount2)
        
        if inputUnit4 == 0 {
            return fiveCent
        }   else if inputUnit4 == 1 {
            return tenCent
        } else if inputUnit4 == 2 {
            return twentyCent
        }
        return 0
    }
    
    @AppStorage("HapticBool") var hapticBool: Bool = true
    
    @AppStorage("SoundBool") var soundBool: Bool = false
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
                        canAmount2 -= 1}, label: {
                            
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
                    
                    Text("\(canAmount2, specifier: "%g") Cans").foregroundColor(.white).padding(.trailing, 110)
                    
                    
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
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1103)
                        }
                        
                        if hapticBool == true {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        
                        impactHeavy.impactOccurred()
                        }
                        
                        canAmount2 += 1}}, label: {
                            VStack {
                                Image(systemName: "")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 280, alignment: .center)
                                    .background(colorToShow3)
                                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            }}).softButtonStyle(Rectangle())
                        .cornerRadius(10)
                        .frame(width: 70, height: 80, alignment: .center)
                        .padding(.bottom, 0)
                        .frame(width: 350, height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                ).overlay(
                    
                    
                    
                    HStack {
                        Spacer()
                        if inputUnit3 == 0 { VStack {
                            
                            Text("Rate: 5¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(canAmount2 * 0.05, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit3 == 1 { VStack {
                            
                            Text("Rate: 10¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(canAmount2 * 0.1, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit3 == 2 { VStack {
                            Text("Rate: 20¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(canAmount2 * 0.2, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }.opacity(buttonViewHidden ? 1 : 0).padding(.trailing, 105)
                ).padding()
                
                
                
                HStack {
                    
                    Button(action: {
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1105)
                        }
                        
                        
                        if hapticBool == true {
                        let impactMed = UIImpactFeedbackGenerator(style: .soft)
                        
                        impactMed.impactOccurred()
                        }
                        
                        bottleAmount2 -= 1}, label: {
                            
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
                    
                    Text("\(bottleAmount2, specifier: "%g") Bottles").foregroundColor(.white).padding(.trailing, 110)
                    
                    
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
                        if soundBool == true {
                        AudioServicesPlaySystemSound(1103)
                        }
                        
                        if hapticBool == true {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        
                        impactHeavy.impactOccurred()
                        }
                        
                        bottleAmount2 += 1}}, label: {
                            VStack {
                                Image(systemName: "")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 280, alignment: .center)
                                    .background(colorToShow4)
                                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            }}).softButtonStyle(Rectangle())
                        .cornerRadius(10)
                        .frame(width: 70, height: 80, alignment: .center)
                        .padding(.bottom, 0)
                        .frame(width: 350, height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                    
                ).overlay(
                    
                    
                    
                    HStack {
                        Spacer()
                        if inputUnit4 == 0 { VStack {
                            
                            Text("Rate: 5¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount2 * 0.05, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit4 == 1 { VStack {
                            
                            Text("Rate: 10¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount2 * 0.1, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        if inputUnit4 == 2 { VStack {
                            Text("Rate: 20¢ / Bottle").foregroundColor(.white)
                            Text("Return: $ \(bottleAmount2 * 0.2, specifier: "%.2f")" ).padding(.bottom, 220).foregroundColor(.white)
                        } }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }.opacity(buttonViewHidden ? 1 : 0).padding(.trailing, 105)
                ).padding()
                Spacer()
                
                
                
                
            }.navigationBarTitle("Extra Counters").foregroundColor(.white)
                
            
                
                .preferredColorScheme(.light)
        }
    }
    }


struct ExtraButtons_Previews: PreviewProvider {
    static var previews: some View {
        ExtraButtons()
    }
}
