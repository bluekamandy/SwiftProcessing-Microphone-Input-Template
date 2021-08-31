/*
 * SwiftProcessing Microphone Input Template
 */

import UIKit
import SwiftProcessing

class MySketch: Sketch, SketchDelegate {
    
    func setup() {
        AudioIn.multiplier = 10.0
        AudioIn.start()
    }
    
    func draw() {
        background(0)
        
        AudioIn.update()
        
        circle(width/2, height/2, AudioIn.getLevel())
    }
}


