//
//  History.swift
//  Can Counter 3.0
//
//  Created by Samuel Wiatrzyk on 2022-01-16.
//

import SwiftUI

struct History: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("newPage") private var canAmount: Double = 0
    @AppStorage("page2") private var bottleAmount: Double  = 0
    
   
    
    
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
                
                Image(systemName: "clock.arrow.circlepath")
                Text("All Time Count")
            }) {
                
                
                
                
                HStack {
                    Text("Cans:").font(.title2)
                    Text("\(netCan) Cans").font(.title2)
                    
                }
                
                HStack {
                    Text("Bottles:").font(.title2)
                    Text("\(netBottle) Bottles").font(.title2)
                }
                
                
                HStack {
                    Text("Return:").font(.title2)
                    Text("$\(netReturn, specifier: "%.2f")").font(.title2)
                }
                
                
                
                
            }
            // Shows contents of history which is contained in AppStorage property wrapper
                
            Section(header: HStack {
                Image(systemName: "text.book.closed")
                Text("Return History")
                
            }) {
               
                ForEach(usedWords, id: \.self) { word in
                   
                     HStack {
                       
                        Text("\(word)").font(.title2)
                    }
                
                }.onDelete { indexSet in
                    usedWords.remove(atOffsets: indexSet)
                }
            
        }
        }

        }.navigationBarTitle("History").navigationBarItems(trailing: EditButton())
    }

       
    }

