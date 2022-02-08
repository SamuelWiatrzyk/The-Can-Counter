//
//  SideMenuOptionView.swift
//  Can Counter 3.0 (iOS)
//
//  Created by Samuel Wiatrzyk on 2022-01-19.
//

import SwiftUI


struct SideMenuOptionView: View {
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
    
    //
    @AppStorage("newDate") private var newDate = [String]()
    //
    
    @AppStorage("rate") public var rate = ""
    
    
    @AppStorage("canConvert") private var inputUnit = 0
    @AppStorage("bottleConvert") private var inputUnit2 = 0
    let inputUnits = ["5", "10", "20"]
    let inputUnits2 = ["5", "10", "20"]
    
    @AppStorage("HiddenButton") private var isHidden: Bool = false

    
    let inputUnits3 = ["Blue", "Yellow", "Green", "Purple", "Red"]
    @AppStorage("canAmount") private var canAmount2: Double = 0
    @AppStorage("bottleAmount") private var bottleAmount2: Double = 0
    
    
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
    var body: some View {
        
            
        
            HStack(spacing: 16) {
                
                NavigationLink(destination: History()) {
                Image(systemName: "text.book.closed")
                    .frame(width: 24, height: 24)
                    .font(.system(size: 25, weight: .semibold))
                
                Text("History")
                    .font(.system(size: 25, weight: .semibold))
                Spacer()
                    
                }
                
            }.foregroundColor(.white)
            .padding()
       
        
        
            HStack(spacing: 16) {
                
                NavigationLink(destination: TotalView()) {
                Image(systemName: "dollarsign.circle")
                    .frame(width: 24, height: 24)
                    .font(.system(size: 25, weight: .semibold))
                
                Text("Current Count")
                    .font(.system(size: 25, weight: .semibold))
                Spacer()
                    
                }
                
            }.foregroundColor(.white)
            .padding()
       
        

        
        
        HStack{
            Image(systemName: "cart")
            Button("Make a Return") {
                showingAlert = true
            }
            .alert("Are you sure you want to reset your Current Count?", isPresented: $showingAlert) {
                Button("Yes") {
                    // If "Yes" is pressesd, the second alert is called to reset the count
                    showingAlert2 = true
    
                    
                }
                // If "No" is pressed, the alert is closed and the second alert is not called.
                Button("No", role: .cancel) {}
            }.alert("Would you like to add this amount to your Return History and All Time Count?", isPresented: $showingAlert2) {
                Button("Yes") {

                    // Create Date
                    let date = Date()

                    // Create Date Formatter
                    let dateFormatter = DateFormatter()

                    // Set Date Format
                    dateFormatter.dateFormat = "YYYY/MM/dd"

                    // Convert Date to String
                    dateFormatter.string(from: date)
                    
                    // History of returns function call contained in this button.
                    
                    if isHidden == false {
                    
                    let answer = String(format: "%.2f", convertCan + convertBottle)
                    usedWords.insert(dateFormatter.string(from: date) + ": "  + String(canAmount) + " Cans, " + String(bottleAmount) + " Bottles," + " $ " + answer , at: 0)
                    
                    } else {
                        
                        let answer = String(format: "%.2f", convertCan + convertBottle + convertCan2 + convertBottle2)
                        usedWords.insert(dateFormatter.string(from: date) + ": "  + String(Double(canAmount) + canAmount2) + " Cans, " + String(Double(bottleAmount) + bottleAmount2) + " Bottles," + " $ " + answer , at: 0)
                        
                        
                    }
                    
                    
                    
                   
                    
                    
                    
                    
                    // function fineshed after this line
                    
                    
                    // Adds converted values into the all time amount
                    
                    if isHidden == false {
                    netReturn += (convertCan + convertBottle)
                    } else {
                        netReturn += (convertCan + convertBottle + convertBottle2 + convertCan2)
                    }
                    
                    
                    if isHidden == false {
                    netCan += canAmount
                    } else {
                        netCan += (canAmount + Int(canAmount2))
                    }
                    
                    
                    
                    if isHidden == false {
                    netBottle += bottleAmount
                    } else {
                        netBottle += (bottleAmount + Int(bottleAmount2))
                    }
                    
                    // Resets the count of bottles
                    
                    canAmount = 0
                    bottleAmount = 0
                    
                
                    canAmount2 = 0
                    bottleAmount2 = 0

    
                }
                Button("No", role: .cancel) {
                    
                    // If "No" is pressed, the button call simply resets the count
                    canAmount = 0
                    bottleAmount = 0
                }
            
            }.font(.system(size: 25, weight: .semibold))
            Spacer()
        }
        .font(.system(size: 25, weight: .semibold))
        .foregroundColor(.white)
    .padding()
        
        
        HStack(spacing: 16) {
            
            NavigationLink(destination: CustomCountView()) {
            Image(systemName: "gear")
                .frame(width: 24, height: 24)
                .font(.system(size: 25, weight: .semibold))
            
            Text("Settings  ")
                .font(.system(size: 25, weight: .semibold))
            Spacer()
                
            }
            
        }.foregroundColor(.white)
        .padding()
        
        
                HStack {
                Button(action: {
                    withAnimation(.linear) {
                        currentPage = 1
                    }
                }, label: {
                    HStack {
                    Image(systemName: "questionmark.circle").font(.system(size: 25, weight: .semibold))
                    Text("Help").font(.system(size: 25, weight: .semibold))
                    }
                })
                  
                    
                    Spacer()
                }
                .font(.system(size: 25, weight: .semibold))
                .foregroundColor(.white)
            .padding()
        
        HStack(spacing: 16) {
            
            NavigationLink(destination: GameView()) {
            Image(systemName: "dice")
                .frame(width: 24, height: 24)
                .font(.system(size: 25, weight: .semibold))
            
            Text("Mini Game")
                .font(.system(size: 25, weight: .semibold))
            Spacer()
                
            }
            
        }.foregroundColor(.white)
        .padding()
        
     
        
        
        
        }
    }



struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView()
    }
}
