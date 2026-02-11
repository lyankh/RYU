
import SwiftUI

struct AppleWatchScreen: View {
    @Environment(\.dismiss) private var dismiss

    @State private var allowHaptics: Bool = true
    @State private var notificationsOn: Bool = false

    private let waterEveryText = "Every 5 hours"
    private let stepsEveryText = "Every 50 mins"

    var body: some View {
        ZStack {
            GradientBackgroundView()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {

                    header

                    AppleWatchHeaderImages()

                    Text("Apple Watch")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)

                    ToggleRow(icon: "applewatch", title: "Allow Haptics", isOn: $allowHaptics)

                    Text("Vibrate on Apple Watch when alerts are triggered.")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                        .padding(.top, -10)

                    Text("Alerts")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)

                    Card {
                        VStack(spacing: 0) {
                            AlertRow(icon: "drop.fill", title: "Water Alert", trailing: waterEveryText)
                            Divider().opacity(0.35)
                            AlertRow(icon: "figure.walk", title: "Steps Goal Reminder", trailing: stepsEveryText)
                            Divider().opacity(0.35)
                            SimpleChevronRow()
                        }
                    }

                    Text("Permissions")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)
                        .padding(.top, 8)

                    ToggleRow(icon: "bell.fill", title: "Notifications", isOn: $notificationsOn)

                    Spacer(minLength: 24)

                    Text("Apple Health Access")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)

                    Card {
                        HStack(spacing: 12) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.red)

                            Text("Steps & Heart Rate")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)

                            Spacer()
                        }
                        .padding(.vertical, 14)
                        .padding(.horizontal, 14)
                    }

                    Spacer(minLength: 60)
                }
                .padding(.horizontal, 18)
                .padding(.top, 10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private var header: some View {
        ZStack {
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(width: 36, height: 36)
                        .background(Color.white.opacity(0.85))
                        .clipShape(Circle())
                }
                Spacer()
            }

            Text("Apple Watch")
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
        }
    }
}

private struct AppleWatchHeaderImages: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.white.opacity(0.25))
                .frame(height: 220)

            Image("wat")
                .resizable()
                .scaledToFit()
                .frame(height: 210)
                .rotationEffect(.degrees(-18))
                .offset(x: 60, y: 10)
                .opacity(0.98)

            Image("watg")
                .resizable()
                .scaledToFit()
                .frame(height: 210)
                .rotationEffect(.degrees(10))
                .offset(x: -45, y: 0)
                .opacity(0.98)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 6)
    }
}

private struct Card<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        VStack(spacing: 0) { content }
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.55)))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.35), lineWidth: 1))
    }
}

private struct ToggleRow: View {
    let icon: String
    let title: String
    @Binding var isOn: Bool

    var body: some View {
        Card {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.black.opacity(0.85))

                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)

                Spacer()

                Toggle("", isOn: $isOn).labelsHidden()
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 14)
        }
    }
}

private struct AlertRow: View {
    let icon: String
    let title: String
    let trailing: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.black.opacity(0.85))
                .frame(width: 22)

            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.black)

            Spacer()

            Text(trailing)
                .font(.system(size: 14))
                .foregroundStyle(.gray)

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 14)
    }
}

private struct SimpleChevronRow: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 14)
    }
}

#Preview {
    NavigationStack { AppleWatchScreen() }
}
