import PlaygroundSupport
import UIKit
import SwiftUI





var currentHeading: String = "None"
var currentText: String = "None"
var currentIcon: String = "bookmark.fill"


struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text(currentHeading).font(.system(size: 40)).fontWeight(.semibold)
        Text(currentText).font(.system(size: 25)).padding(EdgeInsets(top: 10, leading: 30, bottom: 40, trailing: 30))
        Image(systemName: currentIcon).font(.system(size: 150))
        
        Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        
        // Top Text
        Text("What's Next?").font(.system(size: 80)).padding(20)
        Text("I've spent a ton of time talking about what's wrong and the effects, but what are the causes, and what can we do?").font(.system(size: 30)).padding(100)
        
        // VStack
        VStack(spacing: 30.0) {
            HStack(spacing: 30.0) {
                Button(action: {
                    currentText = "Ecosystems - plants and animals - are the natural check on Carbon Dioxide, we learn in grade school that Plants breathe in CO2 and out O2, making the environment a cleaner place. While many actions by consumers unless done en-masse - which is hard - won't really help the situation much. Getting involved locally to protect local habitats through environmental groups is a great way to make change."
                    currentHeading = "Protect Natural Habitats"
                    currentIcon = "leaf.fill"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "shield.checkerboard").font(.system(size: 30))
                        Text("Protect Habitats").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                Button(action: {
                    currentText = "Avoiding unnessecary fossil fuels and looking for alternatives when possible, is always good as a consumer, not only energy, but other things such as plastic products."
                    currentHeading = "Fossil Fuels"
                    currentIcon = "drop.triangle.fill"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "drop.fill").font(.system(size: 30))
                        Text("Dinosaur Fuel").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
            HStack(spacing: 30.0) {
                Button(action: {
                    currentText = "Efficency is a broad term, but things like light bulbs, appliances, and wasting less food, while it could be argued that on a single consumer scale doens't have too much effect, as said, every bit counts, and spreading awareness to reduce the global footprint of consumers is always good."
                    currentHeading = "Efficiency"
                    currentIcon = "dial.min"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "leaf.arrow.triangle.circlepath").font(.system(size: 30))
                        Text("Stay Efficient").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                Button(action: {
                    currentText = "While there is probably not alot you the individual can do right now (even electric cars pollute due to their sources) as green energy becomes more viable, it will soon become more cost effective and the industry will switch over. For now, looking towards solar, and suppourting and investing in green tech, or tech in general, such as Battery and energy generation is our best hope."
                    currentHeading = "Renewable Energy"
                    currentIcon = "aqi.medium"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "sun.max").font(.system(size: 30))
                        Text("Green Technology").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
            HStack(spacing: 30.0) {
                Button(action: {
                    currentText = "Consumers themselves don't have as large of a footprint as industry. The only way is to vote with your wallet and suppourt products farmed and produced sustainably."
                    currentHeading = "Sustainable Products"
                    currentIcon = "dollarsign.circle.fill"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "tortoise.fill").font(.system(size: 30))
                        Text("Sustainablity").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                Button(action: {
                    currentText = "A Single Consumer can't do much. One person fighting against billions going the other way never gets anywhere but swept away, however by education and spreading awareness - the point of this project - we can together steer humans back on the right course. Through Community, advocacy, and awareness, as humans we have the power."
                    currentHeading = "Education"
                    currentIcon = "books.vertical"
                    showingSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "text.book.closed.fill").font(.system(size: 30))
                        Text("Education").font(.system(size: 30))
                    }.padding(40.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
            Text("Many scientists point to 2030-2050 being the tipping point, where either countries work together to challenge industry and put the climate on the right path, or herald the end of the world as we know it and a destruction of the planet we call home.").font(.system(size: 30)).padding(100)
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.needsIndefiniteExecution = true
