/*: some text
 # Credits
 
 This will just be in mark(down)up, as there is no real need for code to explain all the image sources, references used for text and issues with code and whatnot.
 
 ## General Complaints
 
 I had a few just complaints about the workflow I used, I have access to a 7th generation iPad, not exactly an 11 inch iPad Pro, but close enough, as well as an iMac18,1 (2018)
 
 */
import SwiftUI
import UIKit
import PlaygroundSupport
struct ContentView: View {
    var body: some View {
        ScrollView {
            Text("Credits and Technical Notes").font(.system(size: 20))
            Image(uiImage: UIImage(named: "PBD.png")!)
            
            
            VStack {
                Text("Look again at that dot. That's here. That's home. That's us. On it everyone you love, everyone you know, everyone you ever heard of, every human being who ever was, lived out their lives.").padding(10)
                Text("In our obscurity, in all this vastness, there is no hint that help will come from elsewhere to save us from ourselves.").padding(10)
                Text("The Earth is the only world known so far to harbor life. There is nowhere else, at least in the near future, to which our species could migrate. Visit, yes. Settle, not yet. Like it or not, for the moment the Earth is where we make our stand.").padding(10)
                Text("There is perhaps no better demonstration of the folly of human conceits than this distant image of our tiny world. To me, it underscores our responsibility to deal more kindly with one another, and to preserve and cherish the pale blue dot, the only home we've ever known. — Carl Sagan.").padding(10)
            }
        }.padding(50)
        
        
        
    }
}
PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.needsIndefiniteExecution = true
