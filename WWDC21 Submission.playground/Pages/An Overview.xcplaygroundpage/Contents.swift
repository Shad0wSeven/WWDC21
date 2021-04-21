/*: some text
 
# Hey There!
 
Welcome to my playground!

In this playground, you get to explore a model of our earth and selected points across it all describing a different facet of the current Global Warming crisis. I believe that with the world erupting into protest about many crucial topics affecting society, one of the longest-running and potentially most detrimental of them all, Climate Change, has been relatively missed from the public eye, possibly just due to fatigue, but it is still the largest threat facing humanity and the most crucial to solving.
 
**NOTE:** This playground uses ARKit and SceneKit and MUST be run on an iPad

## How to use

Go ahead and click "Run my Code"

This playground needs to be run in full-screen mode, however, I would prefer if you started with split-view to read the details on the side like you are right now.

**Don't drag it over yet!**

There are three ways to interact with the playground, the first is manipulating the Earth Model. If you look on the top left corner under the Picker, there is a bit of whitespace. This is where you can put your finger and start dragging to rotate the Earth.

The second is to change what Earth you are looking at. By sliding the Picker you can select any Earth texture, and view it. Keep in mind, switching views is taxing on the iPad so it takes a second to load. You may have to step back from the axis to see the full earth model if you don't see it.

The third is to select any of the red spheres called Points of Interest around the scene which each have their own displays.

So go ahead and explore! Slide over the view and tap around. When you are finished tap over to the next view.


## Technical Details

This playground uses *both* `UIKit` and `SwiftUI` (I like SwiftUI 2147483647x better, however), for 2D UI, and showcases both `SceneKit` and `ARKit`. More details are explored on the Credits page at the end.

**NOTE:** This playground has been optimized for a 7th generation iPad as I do not have an iPad Pro available, however, it should work just fine on those devices.

*/
// Click "Run My Code"
//#-hidden-code
//  Code needed to setup and run the playground
POI(view: 0)
import PlaygroundSupport
PlaygroundPage.current.liveView = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

// Quick Note: ARKit takes some time, and when switching materials sometimes recompiles the scene for some reason, if you don't see the Earth don't fear! Step Back!

// Quick Note 2: Also there is like 5-6 minutes of content here, just skip what you dont really care about and maybe skim the reading, it's meant to be a personal experience, so you only explore what impacts you most.
