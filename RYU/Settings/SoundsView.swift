//
//  Notifications.swift
//  RYU
//
//  Created by Abeer Alshabrami on 2/9/26.
//

import SwiftUI

struct SoundsView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var soundsOn = true
    @State private var hapticsOn = true

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 20) {

                // ✅ Header (Back + Centered Title)
                ZStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 36, height: 36)
                                .background(.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                        Spacer()
                    }

                    Text("Sounds")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(AppColors.blueDark)
                }
                .padding(.horizontal)
                .padding(.top, 10)

                // ✅ Card (Sounds + Haptics) + Divider
                VStack(spacing: 0) {

                    HStack {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(AppColors.blueDark)

                        Text("Sounds")
                            .foregroundColor(AppColors.blueDark)

                        Spacer()

                        Toggle("", isOn: $soundsOn)
                            .labelsHidden()
                    }
                    .padding()

                    Divider()
                        .padding(.leading, 16)

                    HStack {
                        Text("Haptics")
                            .foregroundColor(AppColors.blueDark)

                        Spacer()

                        Toggle("", isOn: $hapticsOn)
                            .labelsHidden()
                    }
                    .padding()
                }
                .background(.white.opacity(0.92))
                .cornerRadius(18)
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        SoundsView()
    }
}
