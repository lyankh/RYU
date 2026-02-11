//
//  AuthEmailView.swift
//  RYU
//
//  Created by Abeer Alshabrami on 2/10/26.
//

import Foundation
import SwiftUI

struct AuthEmailView: View {
    enum Mode { case signUp, signIn }

    @EnvironmentObject private var settings: AppSettings
    @Environment(\.dismiss) private var dismiss

    let mode: Mode

    @State private var email: String = ""
    @State private var password: String = ""   // ✅ بس للاستخدام هنا (ما نخزنه)
    @State private var showAlert = false

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 18) {

                Text(mode == .signUp ? "Sign up" : "Sign in")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .padding(.top, 10)

                VStack(spacing: 12) {

                    // ✅ Email
                    field(icon: "envelope", placeholder: "Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)

                    // ✅ Password
                    secureField(icon: "lock.fill", placeholder: "Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.horizontal, 16)

                Button {
                    let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
                    let trimmedPass  = password.trimmingCharacters(in: .whitespacesAndNewlines)

                    // ✅ تحقق بسيط عشان ما ندخل فاضي ونخرب UI
                    guard !trimmedEmail.isEmpty, !trimmedPass.isEmpty else {
                        showAlert = true
                        return
                    }

                    // ✅ خزّني الإيميل فقط + فعّلي الحساب
                    settings.email = trimmedEmail
                    settings.isSignedIn = true

                    // ✅ لا تسوين dismiss هنا (حتى ما يصير dismiss مزدوج)
                    // نخلي WelcomeView هي اللي ترجع للـSettings لما isSignedIn يصير true
                } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 160, height: 46)
                        .background(Color(hex: "C6E1E8"))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 8)

                Spacer()
            }
        }
        .onAppear {
            // ✅ يبدأ فاضي مثل ما تبين
            email = ""
            password = ""
        }
        .alert("Please enter email & password", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func field(icon: String, placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 26)

            TextField(placeholder, text: text)
        }
        .padding()
        .background(.white.opacity(0.92))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func secureField(icon: String, placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 26)

            SecureField(placeholder, text: text)
        }
        .padding()
        .background(.white.opacity(0.92))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        AuthEmailView(mode: .signUp)
            .environmentObject(AppSettings())
    }
}
