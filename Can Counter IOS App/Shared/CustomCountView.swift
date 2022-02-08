//
//  CustomCountView.swift
//  Can Counter 3.0
//
//  Created by Samuel Wiatrzyk on 2022-01-16.
//

import SwiftUI
 
struct CustomCountView: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("newPage") private var canAmount  = 0
    @AppStorage("page2") private var bottleAmount = 0
   
    
    
    @State private var addCan = ""
    @State private var addBottle = ""
    
    @AppStorage("netCan") private var netCan = 0
    @AppStorage("netBottle") private var netBottle = 0
    @AppStorage("page3") private var netReturn: Double = 0
    
    @AppStorage("items") private var usedWords = [String]()
    @State private var showCountView = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @AppStorage("savedDate") var date: Date = Date()
    @AppStorage("HiddenButton") private var isHidden: Bool = false
    //
    @AppStorage("newDate") private var newDate = [String]()
    //
    
    @AppStorage("rate") public var rate = ""
    
    @AppStorage("buttonView") private var buttonViewHidden: Bool = false
    
    @AppStorage("canConvert") private var inputUnit = 0
    @AppStorage("bottleConvert") private var inputUnit2 = 0
    
    @AppStorage("showPlusSix") private var showPlusSix = false
    
    
        
    let inputUnits = ["5", "10", "20"]
    let inputUnits2 = ["5", "10", "20"]
    
    let inputUnits3 = ["Blue", "Yellow", "Green", "Purple", "Red"]
    
    
    
    var convertCan: Double {
    
        let fiveCent = 0.05 * Double(canAmount)
        let tenCent = 0.10 * Double(canAmount)
        let twentyCent = 0.2 * Double(canAmount)
        
        if inputUnit == 0 {
            return fiveCent
        }   else if inputUnit == 1 {
            return tenCent
        } else if inputUnit == 2 {
            return twentyCent
        }
        return 0
    }
    
    @AppStorage("canAmount") private var canAmount2: Double = 0
    @AppStorage("bottleAmount") private var bottleAmount2: Double = 0
    @AppStorage("canConvert2") private var inputUnit3 = 0
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
    
    
    var convertBottle: Double {
    
        let fiveCent = 0.05 * Double(bottleAmount)
        let tenCent = 0.10 * Double(bottleAmount)
        let twentyCent = 0.2 * Double(bottleAmount)
        
        if inputUnit2 == 0 {
            return fiveCent
        }   else if inputUnit2 == 1 {
            return tenCent
        } else if inputUnit2 == 2 {
            return twentyCent
        }
        return 0
    }
    @AppStorage("canColor") var yourCondition: Int = 1
    var colorToShow: LinearGradient {
            switch yourCondition {
                case 0:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
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
                case 1:
                // Blue
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.5061741105045181, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5932440700301206, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
                   // Yellow
                case 2:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.14118093467620482, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 3:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.2314011907003012, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.2974162274096386, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                case 4:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.7982868975903615, saturation: 0.4656791227409639, brightness: 0.9626229527484941, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5283850244728916, saturation: 0.5628794474774097, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            case 5:
                return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.09875341208584339, saturation: 0.4656791227409639, brightness: 1.0, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.9825130600527109, saturation: 0.7391813347138555, brightness: 0.8, opacity: 1.0), location: 1.0)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                default:
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
            }
        }
    
    
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
    
    @AppStorage("backgroundColor") var yourCondition7: Int = 0
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
                    return LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.04938111822289157, saturation: 0.4467243975903615, brightness: 0.8, opacity: 1.0), location: 0.002306189903846154), Gradient.Stop(color: Color(hue: 1.0, saturation: 0.41631565323795183, brightness: 0.9759389118975904, opacity: 1.0), location: 0.9999849759615385)]), startPoint: UnitPoint.center, endPoint: UnitPoint.bottomTrailing)
            }
        }
    
    @AppStorage("HapticBool") var hapticBool: Bool = true
    
    @AppStorage("SoundBool") var soundBool: Bool = true
    
    
    var body: some View {
       
            Form {
                
                Section(header: Text("Set Can Quantities")) {
                    HStack {
                    Text("Set Can Total:")
                    TextField("Can Total", text: Binding(
                        get: { String(canAmount) },
                        set: { canAmount = Int($0) ?? 0 }
                    )).keyboardType(.numberPad)
                }
                    
                    
    
                    
            }
                
                Section(header: Text("Set Bottle Quantities")) {
                    HStack {
                    Text("Set Bottle Total:")
                    TextField("Bottle Total", text: Binding(
                        get: { String(bottleAmount) },
                        set: { bottleAmount = Int($0) ?? 0 }
                    )).keyboardType(.numberPad)
                        
                }
                }
                
                Section(header: Text("Button Modifiers")) {
                    Toggle(isOn: $isHidden) {
                        
                        HStack {
                            if isHidden == false {
                                Image(systemName: "lock.iphone")
                            }
                            
                            if isHidden == true {
                            Image(systemName: "platter.2.filled.iphone")
                            }
                                Text("Add 2 More Counters")
                        }
                              }
                    
                    Toggle(isOn: $buttonViewHidden) {
                        HStack {
                            if buttonViewHidden == false {
                                Image(systemName: "dollarsign.circle")
                            }
                            if buttonViewHidden == true {
                                Image(systemName: "dollarsign.circle.fill")
                            }
                        Text("Show Rate and Return")
                            
                        }
                    }
                   
                    Toggle(isOn: $showPlusSix) {
                    
                        HStack {
                            if showPlusSix == false {
                                Image(systemName: "6.circle")
                            }
                            
                            if showPlusSix == true {
                            Image(systemName: "6.circle.fill")
                            }
                        Text("Show Plus Six Button")
                                
                                
                        }
                        
                        
                    }

                    Toggle(isOn: $hapticBool) {
                        HStack {
                            if hapticBool == false {
                            Image(systemName: "iphone")
                            } else {
                                Image(systemName:   "iphone.radiowaves.left.and.right")
                            }
                        
                        Text("Button Vibration")
                        }
                    }
                    
                    Toggle(isOn: $soundBool) {
                        
                        if soundBool == false {
                        Image(systemName: "speaker.slash")
                        } else {
                            Image(systemName: "speaker.wave.3.fill")
                        }
                        
                        Text("Button Sound")
                    }
                    
                    
                    
                }
                
                
                Section(header: Text("Set Conversion Rate")) {
                    // Setting to change how much off of return a person will recieve
                    Section(header: Text("Can Rate")) {
                        Picker("Input Unit", selection: $inputUnit) {
                            ForEach(0..<inputUnits.count) {
                                Text("\(self.inputUnits[$0])¢")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
    
                    }
                    
                    Section(header: Text("Bottle Rate")) {
                        Picker("Input Unit", selection: $inputUnit2) {
                            ForEach(0..<inputUnits2.count) {
                                Text("\(self.inputUnits2[$0])¢")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
    
                    }
                }
                
               
                
                // The hidden section
                
                if isHidden == true {
                Section(header: Text("Set Conversion Rate")) {
                    // Setting to change how much off of return a person will recieve
                    Section(header: Text("Can Rate")) {
                        Picker("Input Unit", selection: $inputUnit3) {
                            ForEach(0..<inputUnits.count) {
                                Text("\(self.inputUnits[$0])¢")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
    
                    }
                    
                    Section(header: Text("Bottle Rate")) {
                        Picker("Input Unit", selection: $inputUnit4) {
                            ForEach(0..<inputUnits2.count) {
                                Text("\(self.inputUnits2[$0])¢")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
    
                    }
                }
                    
                }
                
              
                // Hidden Section Ends Here
                Section(header: Text("Background Color")){
                    Picker("Choose a Color", selection: $yourCondition7) {
                        ForEach(0..<inputUnits3.count) {
                            Text("\(self.inputUnits3[$0])")
                        }
                    }
                }
                
           
                
                    
                    
                    Section(header: Text("Change Can Counter Color")) {
                    Picker("Choose a Color", selection: $yourCondition) {
                        ForEach(0..<inputUnits3.count) {
                            Text("\(self.inputUnits3[$0])")
                        }
                        
                    }
                        if isHidden == true {
                        Picker("Choose a Color For Button 2", selection: $yourCondition5) {
                            ForEach(0..<inputUnits3.count) {
                                Text("\(self.inputUnits3[$0])")
                            }
                        }
                    }
                }
                    
                
                    
                    
                // The Picker that calls the yourCondition2 variable anf inputUnits3 
                
                Section(header: Text("Change Bottle Counter Color")) {
                Picker("Choose a Color", selection: $yourCondition2) {
                    ForEach(0..<inputUnits3.count) {
                        Text("\(self.inputUnits3[$0])")
                    }
                }
                if isHidden == true {
                    Picker("Choose a Color For Button 2", selection: $yourCondition6) {
                        ForEach(0..<inputUnits3.count) {
                            Text("\(self.inputUnits3[$0])")
                        }
                    }
                }

                    
            }
                
                
             
                
                
                
                Section(header: Text("Clear Data")) {
                Button("Clear All Time Count") {
                    
                    
                    showingAlert4 = true
                    
                    
                    
                    
                    
                    
                }.foregroundColor(.red)
                        .alert("Are you sure you want to clear your All Time Count?", isPresented: $showingAlert4) {
                            Button("Yes") {
                                netReturn = 0.0
                                netBottle = 0
                                netCan = 0
                            }
                            
                            Button("No", role: .cancel) {}
                            
                            
                        }
                    
                    
                    
                    
                    
                    
                    
                        Button("Clear Return History") {
                        
                            showingAlert3 = true
                        
                        }.foregroundColor(.red)
                        .alert("Are you sure you want to clear your Return History?", isPresented: $showingAlert3) {
                            Button("Yes") {
                                usedWords.removeAll()
                            }
                            Button("No", role: .cancel) {}

                }
                    
                }
                
            }.navigationBarTitle("Settings")
            
        }
}







struct CustomCountView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCountView()
    }
}
