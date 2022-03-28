//
//  ViewController.swift
//  WorkingTogetherIsEasy
//
//  Created by riccardo ruocco on 26/03/22.


import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    var swiftUIHeartAnimationViewModel = SwiftUIHeartAnimationViewModel()

    func updateLabel(newLabel:String){
        colorLabel.text = newLabel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swiftUIHeartAnimationViewModel.setUpdateViewAction(updateAction: self.updateLabel)

        switch(segmented.selectedSegmentIndex){
        case 0:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.slow)
               SoundManager.shared.playSound("heartBeat.mp3",rate: 1.0)

        case 1:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.medium)
               SoundManager.shared.playSound("heartBeat.mp3",rate: 2.0)

        case 2:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.fast)
            SoundManager.shared.playSound("heartBeat.mp3",rate: 3.0)

        default:
            break
        }
    }
    @IBSegueAction func presentSwiftUIHeartAnimation(_ coder: NSCoder) -> UIViewController?{

        return UIHostingController(coder: coder, rootView: SwiftUIHeartAnimation().environmentObject(swiftUIHeartAnimationViewModel))
    }
    @IBAction func selectSegment(_ sender: UISegmentedControl) {
        switch(sender.selectedSegmentIndex){
        case 0:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.slow)
            SoundManager.shared.setRate(rate: 1.0)

        case 1:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.medium)
            SoundManager.shared.setRate(rate: 2.0)

        case 2:swiftUIHeartAnimationViewModel.setHeartSpeed(heartSpeed.fast)
            SoundManager.shared.setRate(rate: 3.0)

        default:
            break
        }
    }
}



