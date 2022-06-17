//
//  TextViews.swift
//  Bullseye
//
//  Created by Alina Costache on 6/10/22.
//

import SwiftUI



struct InstructionsText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("textColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("textColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("textColor"))
            .frame(width: 35)
    }
}


struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    var body: some View {
   
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }, label: {
            Text("Hit me".uppercased())
                .kerning(1.0)
                .bold()
                .font(.title3)
        })
        
        .padding(20.0)
        .background(
            ZStack {
                Color("buttonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
    }
}


struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(1.5)
            .font(.caption)
            .bold()
            .foregroundColor(Color("textColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .font(.body)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12)
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("textColor"))
            .bold()
            .font(.title3)
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .overlay(
                Circle()
                    .strokeBorder(Color("leaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .foregroundColor(Color("textColor"))
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(maxWidth: Constants.Leaderboard.scoreColWidth)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .foregroundColor(Color("textColor"))
            .bold()
            .font(.title3)
            .frame(maxWidth: Constants.Leaderboard.dateColWidth)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            InstructionsText(text: "Instructions")
//            BigNumberText(text: "85")
//            LabelTextView(text: "SCORE")
//                .preferredColorScheme(.dark)
//            BodyText(text: "You scored 200 points \n  🎉🎉🎉")
//            ButtonText(text: "Start new Round")
            RoundedTextView(text: "1")
            ScoreText(score: 6044440)
        }
    }
}
