//
//  SettingView.swift
//  RYU
//
//  Created by Lyan on 15/08/1447 AH.
//
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settings: AppSettings
    @State private var selectedAppearance: Appearance = .light

    enum Appearance: String, CaseIterable {
        case system = "System"
        case dark = "Dark"
        case light = "Light"
    }

    private var initialLetter: String {
        let trimmed = settings.fullName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.first.map { String($0).uppercased() } ?? "A"
    }

    var body: some View {
        ZStack {
            GradientBackgroundView()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {

                    Text("Settings")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundColor(AppColors.blueDark)
                        .padding(.top, 2)

                    sectionHeader("Account")

                    NavigationLink {
                        if settings.isSignedIn {
                            AccountView()
                        } else {
                            WelcomeView()
                        }
                    } label: {
                        HStack(spacing: 12) {

                            Circle()
                                .fill(Color(hex: settings.avatarHex).opacity(0.35))
                                .frame(width: 44, height: 44)
                                .overlay(
                                    Text(initialLetter)
                                        .font(.headline)
                                        .foregroundColor(AppColors.blueDark)
                                )

                            VStack(alignment: .leading, spacing: 2) {

                                if settings.isSignedIn {
                                    Text(settings.fullName)
                                        .font(.headline)
                                        .foregroundColor(.black)

                                    Text("My Profile")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                } else {
                                    Text("Create Free Account")
                                        .font(.headline)
                                        .foregroundColor(.black)

                                    Text("or Sign-In")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(.white.opacity(0.92))
                        .cornerRadius(16)
                    }
                    .buttonStyle(.plain)

                    sectionHeader("Appearance")

                    HStack {
                        appearanceChoice(.system).frame(maxWidth: .infinity)
                        appearanceChoice(.dark).frame(maxWidth: .infinity)
                        appearanceChoice(.light).frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(.white.opacity(0.45))
                    .cornerRadius(16)

                    sectionHeader("General")

                    VStack(spacing: 12) {
                        SettingsNavRow(icon: "speaker.wave.2.fill", title: "Sounds") {
                            SoundsView()
                        }

                        SettingsNavRow(icon: "bell.fill", title: "Notifications") {
                            NotificationsSettingsView()
                        }
                    }

                    sectionHeader("Add-ons")

                    VStack(spacing: 12) {
                        SettingsNavRow(icon: "heart.fill", title: "Apple Health") {
                            AppleHealthView()
                        }

                        SettingsNavRow(icon: "applewatch", title: "Apple Watch") {
                            AppleWatchScreen()
                        }
                    }

                    if settings.isSignedIn {
                        Button {
                            settings.signOut()
                        } label: {
                            Text("Sign out")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppColors.sand)
                                .foregroundColor(.red)
                                .cornerRadius(16)
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 18)
                    }

                    Spacer(minLength: 12)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Components

private func sectionHeader(_ title: String) -> some View {
    Text(title)
        .font(.headline)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 4)
}

private struct SettingsNavRow<Destination: View>: View {
    let icon: String
    let title: String
    @ViewBuilder var destination: () -> Destination

    var body: some View {
        NavigationLink {
            destination()
        } label: {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .frame(width: 24)

                Text(title)
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(.white.opacity(0.92))
            .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

private extension SettingsView {
    func appearanceChoice(_ option: Appearance) -> some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(appearanceFillColor(option))
                    .frame(width: 70, height: 70)

                if option == .system {
                    Image("Settings")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                }

                Circle()
                    .stroke(
                        selectedAppearance == option ? Color.blue : Color.gray.opacity(0.25),
                        lineWidth: selectedAppearance == option ? 4 : 2
                    )
                    .frame(width: 74, height: 74)
            }
            .onTapGesture { selectedAppearance = option }

            Text(option.rawValue)
                .font(.caption)
                .foregroundColor(.black)
        }
    }

    func appearanceFillColor(_ option: Appearance) -> Color {
        switch option {
        case .system:
            return Color.gray.opacity(0.20)
        case .dark:
            return Color(red: 0.10, green: 0.14, blue: 0.26)
        case .light:
            return Color(red: 242/255, green: 238/255, blue: 235/255)
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(AppSettings())
    }
}
