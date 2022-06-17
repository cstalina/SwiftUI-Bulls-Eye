//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Alina Costache on 6/13/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("textColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("buttonStrokeColor"), lineWidth: Constants.General.strokeWidth )
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("buttonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                .fill(Color("buttonFilledBackgroundColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("textColor"))
            .kerning(-0.2)
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .background(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color("buttonStrokeColor"), lineWidth: 2)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedRectTextView(text: "200")
        }

    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
