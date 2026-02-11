//
//  ChangeEmailView.swift
//  RYU
//
//  Created by Lyan on 15/08/1447 AH.
//

import SwiftUI

struct ChangeEmailView: View {
    @EnvironmentObject private var settings: AppSettings
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 22) {
                Text("Change Email")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .padding(.top, 20)

                HStack(spacing: 10) {
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Enter new email", text: $settings.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding()
                .background(.white.opacity(0.92))
                .cornerRadius(16)
                .padding(.horizontal, 18)

                Button { dismiss() } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: 180)
                        .padding(.vertical, 12)
                        .background(Color(hex: "C6E1E8"))
                        .cornerRadius(16)
                }

                Spacer()
            }
            .padding(.top, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { ChangeEmailView() }
        .environmentObject(AppSettings())
}
