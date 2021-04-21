
// Points.swift

// This file helps map world coordinates too the subchild of the Earth modifier

// Imports
import SceneKit
import ARKit


// Degrees to Radians (The world is in degrees, math is in radians) 
public func DEG2RAD(Deg: Int) -> Double {
    return ((Double(Deg) * Double.pi)/180)
}

// Mapping:
// Sine Latitude, * the diameter of the sphere is the coordinate for y in y-up
// Cosine Latitude * the diameter of the sphere is the coordinate for x in y-up
// Cosine Longitude * the diameter of the sphere is the coordiante for z in y-up

public func sphereCoord(lat: Int, long: Int, Rad: Float) -> SCNVector3 {
    let yval = sin((Double(lat) * Double.pi)/180) * Double(Rad)
    let zval = (cos((Double(long) * Double.pi)/180) * ((cos((Double(lat) * Double.pi)/180) * Double(Rad))))
    let xval = (sin((Double(long) * Double.pi)/180) * ((cos((Double(lat) * Double.pi)/180) * Double(Rad))))  // BROKEN
    let outputs: SCNVector3 = SCNVector3(x: Float(xval), y: Float(yval), z: Float(zval))
    return outputs
}

// If you are reading this I am actually super proud of this function even though it's just elementary trig, and it makes me really apprecaite the genius of map creators and projections
