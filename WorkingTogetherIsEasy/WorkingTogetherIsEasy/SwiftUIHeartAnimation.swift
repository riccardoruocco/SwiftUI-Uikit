//
//  SwiftUIHeartAnimation.swift
//  WorkingTogetherIsEasy
//
//  Created by riccardo ruocco on 26/03/22.
//

import SwiftUI

struct SwiftUIHeartAnimation: View {
    @State var xScale = 0.8
    @State var yScale = 0.8
    @EnvironmentObject var viewModel:SwiftUIHeartAnimationViewModel
    @State var color:Color = Color.random

    @ViewBuilder
    func getHeartAnimation(duration:Double, action:@escaping (String)->Void)->some View{
        HeartShape()
            .padding()
            .foregroundColor(color)
            .scaleEffect(x: xScale, y: yScale, anchor: .center)
            .onAppear(perform:{
                xScale = 0.8
                yScale = 0.8
                action(color.description)
                withAnimation(.linear(duration: duration)
                                .repeatForever(), {
                    xScale = xScale + 0.1
                    yScale = yScale + 0.1
                })
            })
            .onTapGesture {
                color = Color.random
                action(color.description)
            }
    }


    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.black)

            if(viewModel.getHeartSpeed() == heartSpeed.slow){
                getHeartAnimation(duration: 3.0,action: viewModel.setColorCode)
            }
            else if(viewModel.getHeartSpeed() == heartSpeed.medium){
                getHeartAnimation(duration: 2.0,action: viewModel.setColorCode)

            }
            else if(viewModel.getHeartSpeed() == heartSpeed.fast){
                getHeartAnimation(duration: 0.5,action: viewModel.setColorCode)
            }
        }

    }
}
extension Color {
  // Return a random color
  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
) }
}


struct HeartShape:Shape{
  
    func path(in rect:CGRect) -> Path{
        var path = Path()

        let offSet:CGFloat = rect.maxY/4
        
        let initialPoint = CGPoint(x: rect.maxX/2, y: rect.maxY-offSet)
        let endTriangle1 = CGPoint(x: rect.minX, y: rect.maxY/2 - offSet)
        var endTriangle2 = CGPoint(x: rect.maxX, y: rect.maxY/2 - offSet)
        
        path.move(to: initialPoint)
        path.addLine(to: endTriangle1)
        path.addLine(to: CGPoint(x: rect.maxX/4, y: rect.maxY/2-offSet))
        path.addLine(to: endTriangle2)
        path.addLine(to: initialPoint)
        path.addLine(to: endTriangle1)
        path.addLine(to: CGPoint(x: rect.maxX/4, y: rect.maxY/2 - offSet))

        path.addArc(center: CGPoint(x: rect.maxX/4, y: rect.maxY/2 - offSet), radius: rect.maxX/4, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        path.addLine(to: CGPoint(x: 3*rect.maxX/4, y: rect.maxY/2 - offSet))
        path.addArc(center: CGPoint(x: 3*rect.maxX/4, y: rect.maxY/2 - offSet), radius: rect.maxX/4, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        
        return path
    }
}



