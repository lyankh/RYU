//
//  WelcomeView.swift
//  RYU
//
//  Created by Abeer Alshabrami on 2/10/26.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var settings: AppSettings
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 18) {
                Text("Welcome!")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .padding(.top, 10)

                Image("migo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
                    .padding(.top, 6)

                Text("Sign up to migo!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)

                Spacer()

                NavigationLink {
                    AuthEmailView(mode: .signUp)
                } label: {
                    pillButton("Sign up with email")
                }
                .buttonStyle(.plain)

                NavigationLink {
                    AuthEmailView(mode: .signIn)
                } label: {
                    pillButton("Sign in with email")
                }
                .buttonStyle(.plain)

                Spacer(minLength: 18)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)

        // ✅ هذا اللي يرجعك للـSettings لما تم تسجيل الدخول
        .onChange(of: settings.isSignedIn) { _, newValue in
            if newValue { dismiss() }
        }
    }

    private func pillButton(_ title: String) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.black.opacity(0.85))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(.white.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
    .environmentObject(AppSettings())
}
