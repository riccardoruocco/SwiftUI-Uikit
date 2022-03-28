//
//  Controller.swift
//  WorkingTogetherIsEasy
//
//  Created by riccardo ruocco on 26/03/22.
//

import Foundation
import CoreText
import SwiftUI

class SwiftUIHeartAnimationViewModel:ObservableObject{
    @Published var heartSpeed:heartSpeed? = nil
    var updateViewAction:((String)->Void)? = nil

    func setUpdateViewAction(updateAction:@escaping (String)->Void){
        updateViewAction = updateAction
    }
    func getHeartSpeed()->heartSpeed{
        return self.heartSpeed!
    }
    func setHeartSpeed(_ speed:heartSpeed){
        self.heartSpeed = speed
    }
    func setColorCode(code:String){
        updateViewAction!(code)
    }

}
enum heartSpeed{
    case slow
    case medium
    case fast
}


//class SwiftUIHeartAnimationViewModel:ObservableObject{
//    @Published var heartSpeed:heartSpeed? = nil
//
//    func getHeartSpeed()->heartSpeed{
//        return self.heartSpeed!
//    }
//    func setHeartSpeed(_ speed:heartSpeed){
//        self.heartSpeed = speed
//    }
//
//
//}
//enum heartSpeed{
//    case slow
//    case medium
//    case fast
//}
