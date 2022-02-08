//
//  TotalView.swift
//  Can Counter 3.0
//
//  Created by Samuel Wiatrzyk on 2021-12-22.
//

import SwiftUI
import Foundation

struct TotalView: View {
    
    
    @AppStorage("currentPage") var currentPage = 1
    
    // Variables that store the current counts for each of the counters
    @AppStorage("newPage") private var canAmount: Double = 0
    @AppStorage("page2") private var bottleAmount: Double  = 0
    
    
    
    // Variables that store the summated amounts to be displayed in the history section
    @AppStorage("netCan") private var netCan = 0
    @AppStorage("netBottle") private var netBottle = 0
    @AppStorage("page3") private var netReturn: Double = 0
    
    
    
    
    @AppStorage("items") private var usedWords = [String]()
    @State private var showCountView = false
    @AppStorage("rate") public var rate: Double = 0.1
    @AppStorage("canConvert") private var inputUnit = 0
    @AppStorage("bottleConvert") private var inputUnit2 = 0
    
    @AppStorage("newDate") private var newDate = [String]()
    
    @AppStorage("savedDate") var date: Date = Date()

    private let defaults = UserDefaults.standard
   
    
    // Vraible that stores converted can amount by pulling can amounts.
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
    
    // Variable that stores converted return from bottles by pulling bottlesAmount variable... Will be evaluated and stored into the net return.
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
    
    
    @AppStorage("canAmount") private var canAmount2: Double = 0
    @AppStorage("bottleAmount") private var bottleAmount2: Double = 0
    @AppStorage("canConvert2") private var inputUnit3 = 0
    @AppStorage("HiddenButton") private var isHidden: Bool = false

   
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
    
    
    
    var body: some View {
        
        VStack {
            
            
            List {
                
                Section(header: HStack {
                    Image(systemName: "timer")
                    Text("Current Count")
                }) {
        HStack {
            
            Text("Cans: ")
                .font(.title2)
                
            
            Text("\(canAmount, specifier: "%g") Cans")
                .font(.title2)
                
        }
        
        
        HStack {
            Text("Bottles:")
                .font(.title2)
                
            Text("\(bottleAmount, specifier: "%g") Bottles")
                .font(.title2)
                
        }
        

        
        HStack {
        Text("Return:")
            .font(.title2)
            if isHidden == false {
        Text("$\(convertBottle + convertCan,specifier: "%.2f")")
            .font(.title2)
            } else {
                Text("$\(convertBottle + convertCan + convertCan2 + convertBottle2,specifier: "%.2f")").font(.title2)
            }
            
        }
                    
                    
                }
                // If the boolean to turn
                if isHidden == true {
                    HStack {
                        Text("Other Cans:")
                            .font(.title2)
                            
                        Text("\(canAmount2, specifier: "%g") Other Cans")
                            .font(.title2)
                            
                    }
                    
                }
                
                if isHidden == true {
                    HStack {
                        Text("Other Bottles:")
                            .font(.title2)
                            
                        Text("\(bottleAmount2, specifier: "%g") Other Bottles")
                            .font(.title2)
                            
                    }
                    
                }
                
                
                    
              
            }

  
                            
        }.navigationBarTitle("Current Count")
           
    }

}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}





struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView()
    }
}

