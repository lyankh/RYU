
import SwiftUI

struct AppleHealthView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var stepsOn = false
    @State private var workoutsOn = true
    @State private var heartRateOn = true

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 18) {
                header("Apple Health")

                Text("Sync with Apple Health")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                VStack(spacing: 0) {
                    healthRow(icon: "figure.walk", title: "Steps", isOn: $stepsOn)
                    Divider().padding(.leading, 16)
                    healthRow(icon: "figure.strengthtraining.traditional", title: "Workouts", isOn: $workoutsOn)
                    Divider().padding(.horizontal, 16).padding(.vertical, 10)
                    healthRow(icon: "heart.fill", title: "Heart Rate", isOn: $heartRateOn)
                }
                .background(.white.opacity(0.92))
                .cornerRadius(18)
                .padding(.horizontal, 16)

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

    private func healthRow(icon: String, title: String, isOn: Binding<Bool>) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon).foregroundColor(.black).frame(width: 24)
            Text(title).foregroundColor(.black)
            Spacer()
            Toggle("", isOn: isOn).labelsHidden()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
    }
}

#Preview {
    NavigationStack { AppleHealthView() }
}
