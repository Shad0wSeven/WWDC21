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
        Text(currentText).font(.title2).padding(EdgeInsets(top: 40, leading: 30, bottom: 40, trailing: 30))
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
        Text("What can we do?").font(.system(size: 80)).padding(20)
        
        // VStack
        VStack(spacing: 30.0) {
        HStack(spacing: 30.0) {
        Button(action: {
            currentText = "asdfasdfasd"
            currentHeading = "asdfasdf"
            showingSheet.toggle()
        }) {
            HStack {
                Image(systemName: "bookmark.fill").font(.system(size: 30))
                Text("Bookmark").font(.system(size: 30))
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
                currentText = "While there is probably not alot you can do right now (even electric cars pollute due to their sources) as green energy becomes more viable, it will soon become more cost effective and the industry will switch over."
                currentHeading = "Fossil Fuels"
                currentIcon = "drop.triangle.fill"
                showingSheet.toggle()
            }) {
                HStack {
                    Image(systemName: "drop.fill").font(.system(size: 30))
                    Text("Dinasour Fuel").font(.system(size: 30))
                }.padding(40.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
            }
        }
    }
    }
    
}


PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.needsIndefiniteExecution = true
