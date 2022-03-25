//
//  HeartViewModel.swift
//  SwiftUI Project
//
//  Created by riccardo ruocco on 25/03/22.
//

import Foundation
import SwiftUI


class HeartViewModel:ObservableObject{
    
    var position = Angle(degrees: 0)
    
    init(){
        
    }
    func changePosition(){
        position += Angle(degrees: 90)        
        objectWillChange.send()
    }
    func stopAnimation(){
        let actualPosition = position
        position = actualPosition
        objectWillChange.send()
    }
    func getPosition()->Angle{
        return self.position
    }
    
}
