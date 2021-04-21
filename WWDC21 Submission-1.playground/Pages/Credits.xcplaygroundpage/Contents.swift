/*: some text
 # Credits
 
 **NOTE:** I don't really count this as part of the 3 minute experience

 This will just be in mark(down)up, as there is no real need for code to explain all the image sources, references used for text and issues with code and whatnot.

 I **DID** however include a cool image and quote that I think is really impactful so if you want hit that "Run Code" :D

 ## Images and Text

 All images were listed as Creative Commons or were from the Wikimedia Foundation. Information was pulled from CarbonBreif, NOAA, NASA, and University pages, although most of it was just from me reading in the past.

 ## Code

 Code was written in Swift 5.0 with Xcode 12.4, Swift Playgrounds 3.4.1 on a 2018 iMac base, as well as a 7th generation iPad with the latest as of writing version of Swift Playgrounds.

 UIKit and SwiftUI were both used, SceneKit was used to generate most of the features in the scene, the background was ARKit, no other notable frameworks were used.

 The code used, if you choose to browse is a bit messy, but due to the "Hackathon" style nature of this competition, with the submissions opening right as WWDC is announced (hyped for iOS15 and macOS <california landmark>, but most importantly Craig who is hilariously fun) and closing around two and a bit weeks later.
 
 */
// I was planning on not having any code here, but whateverrrrrr this was fun and inspiring
// Click "Run My Code" 

//#-hidden-code
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
//#-end-hidden-code
