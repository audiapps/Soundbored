//
//  Colors.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 24/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import UIKit

enum Color {
    case white
    case grey
    case black
    case red
    case orange
    case yellow
    case lime
    case green
    case aqua
    case sky
    case blue
    case purple
    case pink
    
    static var all: [Color] {
        return [.white, .grey, .black, .red , .orange, .yellow, .lime, .green, .aqua, .sky, .blue, .purple, .pink]
    }
    
    static var random: Color {
        return Color.all.randomElement()!
    }
    
    var bgColor: UIColor {
        switch self {
        case .white:  return #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.8352941176, alpha: 1)
        case .grey:   return #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        case .black:  return #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        case .red:    return #colorLiteral(red: 0.6392156863, green: 0.02352941176, blue: 0.02352941176, alpha: 1)
        case .orange: return #colorLiteral(red: 0.9215686275, green: 0.4431372549, blue: 0, alpha: 1)
        case .yellow: return #colorLiteral(red: 0.9764705882, green: 0.8549019608, blue: 0.08235294118, alpha: 1)
        case .lime:   return #colorLiteral(red: 0.3647058824, green: 0.831372549, blue: 0.09019607843, alpha: 1)
        case .green:  return #colorLiteral(red: 0.02745098039, green: 0.3882352941, blue: 0.09411764706, alpha: 1)
        case .aqua:   return #colorLiteral(red: 0.2156862745, green: 0.7294117647, blue: 0.6117647059, alpha: 1)
        case .sky:    return #colorLiteral(red: 0.3764705882, green: 0.7137254902, blue: 1, alpha: 1)
        case .blue:   return #colorLiteral(red: 0.06274509804, green: 0.1098039216, blue: 0.631372549, alpha: 1)
        case .purple: return #colorLiteral(red: 0.2, green: 0, blue: 0.3764705882, alpha: 1)
        case .pink:   return #colorLiteral(red: 0.6784313725, green: 0.231372549, blue: 0.7725490196, alpha: 1)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .white, .yellow, .lime, .aqua, .sky:
            return UIColor.black
        case .grey, .black, .red, .orange, .green, .blue, .purple, .pink:
            return UIColor.black
        }
    }
}
