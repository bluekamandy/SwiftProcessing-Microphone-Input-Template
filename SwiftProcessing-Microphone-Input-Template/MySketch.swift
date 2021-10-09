/*
 * SwiftProcessing Microphone Input Template
 */

import UIKit
import SwiftProcessing

class MySketch: Sketch, SketchDelegate {
    
    var easing = 0.5  // The closer to 1 the less it eases. The closer to 0 the more it eases.
    
    var reVolume = 0.0
    var eaVolume = 0.0
    
    func setup() {
        // AudioIn.multiplier just multiplies the incoming decibels by a number. It's one optional way of modifying the input. Uncomment the line below to use it. map() is more precise.
        
        // AudioIn.multiplier = 10.0
        
        AudioIn.start()
    }
    
    func draw() {
        background(0)
        AudioIn.update()
        
        // print(AudioIn.getLevel())
        
        // map() remaps one number set to another. Our v variable returns straight audio decibel levels in a room. In a quiet room this rangles from 10 db silent to 50 db when someone whistles. To see it's range in your environment, uncomment the line above. You may need to remap it to a more appropriate value.
        
        reVolume = map(AudioIn.getLevel(), 10, 50, 0, 300)
        
        eaVolume += (reVolume - eaVolume) * easing
        
        circle(width/2, height/2, eaVolume)
    }
}


