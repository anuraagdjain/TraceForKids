//
//  drawView.swift
//  Tracing App
//
//  Created by Mihir Kelkar on 7/26/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit


class drawView: UIView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    @IBOutlet var drawView: AnyObject?
    //We will define a touch began function which
    //signifies when you touch something.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        firstpoint = touch!.location(in: self)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        newpoint = touch!.location(in: self)
        lineslist.append(line(start: firstpoint, end: newpoint))
        //Now we have to make this point the first point in the next line
        firstpoint = newpoint
        //This line calls the drawRect thingy evertime the touch moves
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect)
    {
    let context = UIGraphicsGetCurrentContext()
    context?.beginPath()
    for lines in lineslist{
            print("\(lines.start)")
            print("\(lines.end)")
            context?.move(to: CGPoint(x: lines.start.x, y: lines.start.y))
           context?.addLine(to: CGPoint(x: lines.end.x, y: lines.end.y))
        }
//        context?.setLineCap(kCALineCapRound)
        
        //CGContextSetRGBStrokeColor(context, 0, 0, 0, 0)
        print("Stroke Color Set")
        context?.setLineWidth(5)
        context?.strokePath()
        print("Path Drawn")
    }
    
    func clearcall(){
        self.setNeedsDisplay()
    }
}
