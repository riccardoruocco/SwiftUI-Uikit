//
//  ContentView.swift
//  SwiftUI Project
//
//  Created by riccardo ruocco on 25/03/22.
//

import SwiftUI
import Accelerate

struct ContentView: View {
    var body: some View {
        MathShape(predicate: line)
            .stroke()
        
    }
}
func line(x:CGFloat,y:CGFloat)->Bool{
    var esito = false
    if(pow(x,2) + pow(y,2) == 1){
       esito = true
    }
    
    return esito
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Rombo:Shape{
    func path(in rect:CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/2))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/2))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
        
        return path
    }
}

struct MathShape:Shape{
    
    private var internalPredicate:(CGFloat,CGFloat)->Bool
    
    init(predicate:@escaping (CGFloat,CGFloat)->Bool){
        internalPredicate = predicate
    }
    private func computeKeyPoint(in rect:CGRect)->[CGPoint]{
        var points:[CGPoint] = []
        var xInterval = Array(stride(from: rect.minX, to: rect.maxX, by: 1))
        var yInterval = Array(stride(from: rect.minY, to: rect.maxY, by: 1))
        
        for i in xInterval{
            for j in yInterval{
                if(internalPredicate(i,j) == true){
                    var newPoint = CGPoint(x: i, y: rect.maxY - j)
                    print("aggiunto \(i),\(j)")
                    points.append(newPoint)
                }
            }
        }
        return points
    }
    
     func path(in rect:CGRect) -> Path{
        var path = Path()
        var keyPoints:[CGPoint] = computeKeyPoint(in: rect)
         
         path.move(to: .zero)
        // IMP: Remove the space between the < and points
        for i in 1..<keyPoints.count {
            path.addLine(to: keyPoints[i])
        }
         path.border(.red, width: 1)
        return path
    }
    
}

