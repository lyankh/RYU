//
//  ChangePasswordView.swift
//  RYU
//
//  Created by Lyan on 15/08/1447 AH.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var oldInput: String = ""
    @State private var newInput: String = ""

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 18) {
                Text("Change Password")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .padding(.top, 6)

                fieldCard(icon: "lock.heart", placeholder: "Old Password", text: $oldInput)
                Divider().opacity(0.25)
                fieldCard(icon: "lock.heart", placeholder: "New Password", text: $newInput)

                Text("Minimum 8 characters, including upper and lowercase letters and at least one number")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 18)

                Button {
                    // لا نحفظ كلمات مرور هنا (تصميم فقط)
                    oldInput = ""
                    newInput = ""
                    dismiss()
                } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 44)
                        .background(Color(hex: "C6E1E8"))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 8)

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .onAppear {
            oldInput = ""
            newInput = ""
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func fieldCard(icon: String, placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.black.opacity(0.75))
                .frame(width: 26)

            SecureField(placeholder, text: text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .padding()
        .background(.white.opacity(0.92))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack { ChangePasswordView() }
}
