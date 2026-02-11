//
//  Notifications.swift
//  RYU
//
//  Created by Abeer Alshabrami on 2/9/26.
//

import Foundation

import SwiftUI

struct NotificationsSettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var notificationsOn = false

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 20) {
                header("Notifications")

                VStack {
                    HStack {
                        Image(systemName: "bell.fill").foregroundColor(AppColors.blueDark)
                        Text("Notifications").foregroundColor(AppColors.blueDark)
                        Spacer()
                        Toggle("", isOn: $notificationsOn).labelsHidden()
                    }
                    .padding()
                }
                .background(.white.opacity(0.92))
                .cornerRadius(18)
                .padding(.horizontal)

                Text("Alerts")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                VStack(spacing: 0) {
                    alertRow(icon: "drop.fill", title: "Water Alert")
                    Divider().padding(.leading, 16)
                    alertRow(icon: "figure.walk", title: "Steps Goal Reminder")
                }
                .background(.white.opacity(0.92))
                .cornerRadius(18)
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationBarHidden(true)
    }

    private func header(_ title: String) -> some View {
        ZStack {
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 36, height: 36)
                        .background(.white.opacity(0.7))
                        .clipShape(Circle())
                }
                Spacer()
            }
            Text(title)
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundColor(AppColors.blueDark)
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }

    private func alertRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon).foregroundColor(AppColors.blueDark)
            Text(title).foregroundColor(AppColors.blueDark)
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    NavigationStack { NotificationsSettingsView() }
}
