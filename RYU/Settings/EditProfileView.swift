//
//  EditProfileView.swift
//  RYU
//
//  Created by Lyan on 15/08/1447 AH.
//
import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject private var settings: AppSettings
    @Environment(\.dismiss) private var dismiss

    @State private var email: String = ""

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 16) {
                Text("Edit Profile")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.blueDark)
                    .padding(.top, 10)

                HStack(spacing: 10) {
                    Image(systemName: "envelope").foregroundColor(.gray).frame(width: 26)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding()
                .background(.white.opacity(0.92))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 16)

                Button {
                    settings.email = email.trimmingCharacters(in: .whitespacesAndNewlines)
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .frame(width: 160, height: 46)
                        .background(Color(hex: "C6E1E8"))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }

                Spacer()
            }
        }
        .onAppear {
            email = settings.email
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { EditProfileView() }
        .environmentObject(AppSettings())
}
