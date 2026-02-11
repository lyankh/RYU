//
//  AccountView.swift
//  RYU
//
//  Created by Lyan on 15/08/1447 AH.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject private var settings: AppSettings
    @State private var newsletterEnabled: Bool = true

    var body: some View {
        ZStack {
            GradientBackgroundView()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {

                    VStack(spacing: 12) {
                        Circle()
                            .fill(Color(hex: settings.avatarHex).opacity(0.35))
                            .frame(width: 130, height: 130)
                            .overlay(
                                Text(initialLetter)
                                    .font(.system(size: 60, weight: .bold))
                                    .foregroundColor(.black)
                            )

                        Text(settings.fullName)
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)

                    NavigationLink { EditProfileView() } label: {
                        accountCard { accountRow(title: "Edit Profile") }
                    }
                    .buttonStyle(.plain)

                    accountCard {
                        VStack(spacing: 0) {
                            NavigationLink { ChangeEmailView() } label: {
                                accountRow(title: "Change Email")
                            }
                            .buttonStyle(.plain)

                            Divider()

                            NavigationLink { ChangePasswordView() } label: {
                                accountRow(title: "Change Password")
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    accountCard {
                        HStack {
                            Text("Email Newsletter")
                                .foregroundColor(AppColors.blueDark)
                            Spacer()
                            Toggle("", isOn: $newsletterEnabled).labelsHidden()
                        }
                        .padding()
                    }

                    VStack(spacing: 12) {
                        Button { settings.signOut() } label: { dangerButton(title: "Sign Out") }
                        Button { } label: { dangerButton(title: "Delete Account") }
                    }

                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var initialLetter: String {
        let trimmed = settings.fullName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.first.map { String($0).uppercased() } ?? "?"
    }

    private func accountCard<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content()
            .background(.white.opacity(0.92))
            .cornerRadius(16)
    }

    private func accountRow(title: String) -> some View {
        HStack {
            Text(title).foregroundColor(AppColors.blueDark)
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray)
        }
        .padding()
    }

    private func dangerButton(title: String) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.white.opacity(0.92))
            .cornerRadius(16)
    }
}

#Preview {
    NavigationStack {
        AccountView()
    }
    .environmentObject(AppSettings())
}
