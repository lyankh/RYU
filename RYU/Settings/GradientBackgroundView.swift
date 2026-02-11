//
//  GradientBackgroundView.swift
//  RYU
//
//  Created by Abeer Alshabrami on 2/5/26.
//

import SwiftUI

enum AppColors {
    static let blueVeryLight = Color(hex: "EAF4FF")
    static let blueLight     = Color(hex: "DDEBFF")
    static let softWhite     = Color(hex: "F7F7F7")
    static let blueDark      = Color(hex: "0B1B3A")
    static let sand          = Color(hex: "F2EEEB")
}

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                AppColors.blueVeryLight,
                AppColors.blueLight,
                AppColors.softWhite
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
