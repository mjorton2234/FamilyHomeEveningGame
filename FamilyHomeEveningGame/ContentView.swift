//
//  ContentView.swift
//  FamilyHomeEveningGame
//
//  Created by MJ Orton on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    let backgroundImage = Image("Jesus with Lamb")
    let names = ["Mike", "AnnLoureen", "Rael", "James", "Micaelee", "Sophie", "Rodman", "Lin", "Addy"]
    
    @State private var isNameChosen = false
    @State private var chosenName = ""
    
    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Who is Going to Answer the Question?🤔")
                    .font(.title2)
                    //.fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {
                    self.chooseRandomName()
                }) {
                    Color.clear
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .alert(isPresented: $isNameChosen) {
            Alert(title: Text("Name Selected"), message: Text("The chosen name is \(chosenName)."), dismissButton: .default(Text("OK")))
        }
    }
    
    private func chooseRandomName() {
        chosenName = names.randomElement() ?? ""
        isNameChosen = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





//["Mike", "AnnLoureen", "Rael", "James", "Micaelee", "Sophie", "Rodman", "Lin", "Addy", "MJ", "Kayla"]

//import SwiftUI
//
//struct ContentView: View {
//    @State private var spinning = false
//    @State private var selectedName = ""
//
//    let names = ["John", "Emma", "Sophia", "James", "Olivia"]
//
//    var body: some View {
//        ZStack {
//            Color.white.edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Text("Tap the wheel to spin!")
//                    .font(.headline)
//                    .padding()
//
//                Spacer()
//
//                WheelView(items: names, selectedItem: $selectedName, spinning: $spinning)
//                    .frame(width: 300, height: 300)
//                    .onTapGesture {
//                        startSpinning()
//                    }
//
//                Spacer()
//
//                if spinning {
//                    Text("Spinning...")
//                        .font(.title)
//                        .padding()
//                } else if !selectedName.isEmpty {
//                    Text("Selected: \(selectedName)")
//                        .font(.title)
//                        .padding()
//                }
//
//                Spacer()
//            }
//        }
//    }
//
//    func startSpinning() {
//        spinning = true
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            spinning = false
//            selectedName = names.randomElement() ?? ""
//        }
//    }
//}
//
//struct WheelView: View {
//    let items: [String]
//    @Binding var selectedItem: String
//    @Binding var spinning: Bool
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                ForEach(items.indices) { index in
//                    Text(items[index])
//                        .font(.headline)
//                        .rotationEffect(rotationAngle(for: index, in: geometry))
//                        .position(sectionPosition(for: index, in: geometry))
//                        .foregroundColor(.white)
//                        .padding(20)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//                        .background(background(for: index))
//                        .clipShape(Circle())
//                        .animation(.easeInOut(duration: 1.5))
//                }
//            }
//        }
//    }
//
//    private func rotationAngle(for index: Int, in geometry: GeometryProxy) -> Angle {
//        let totalItems = items.count
//        let itemAngle = 360.0 / Double(totalItems)
//
//        let startAngle = -itemAngle / 2.0
//        let adjustedAngle = startAngle + itemAngle * Double(index)
//
//        let rotation = spinning ? 360 * 5 : 0 // Number of full rotations
//
//        return .degrees(adjustedAngle + Double(rotation))
//    }
//
//    private func sectionPosition(for index: Int, in geometry: GeometryProxy) -> CGPoint {
//        let radius = geometry.size.width * 0.35
//        let centerX = geometry.size.width / 2
//        let centerY = geometry.size.height / 2
//
//        let angle = CGFloat(rotationAngle(for: index, in: geometry).radians)
//        let x = centerX + radius * cos(angle)
//        let y = centerY + radius * sin(angle)
//
//        return CGPoint(x: x, y: y)
//    }
//
//    private func background(for index: Int) -> Color {
//        let totalItems = items.count
//        let hue = Double(index) / Double(totalItems)
//
//        return Color(hue: hue, saturation: 0.8, brightness: 0.9)
//    }
//}
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
