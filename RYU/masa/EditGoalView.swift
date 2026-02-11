import SwiftUI

struct EditGoalView: View {
    @State private var steps: Int = 4000

    var body: some View {
        ZStack {
            // MARK: - Background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.88, green: 0.93, blue: 0.96),
                    Color(red: 0.97, green: 0.95, blue: 0.93)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {

                // MARK: - Top Bar
                HStack {
                    Text("Edit goal")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)

                Spacer()

                // MARK: - Character Image
                Image("character") // 👈 حط نفس الشخصية بالـ Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .shadow(radius: 20)

                // MARK: - Steps Goal Title
                HStack(spacing: 8) {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 0.25, green: 0.32, blue: 0.42))
                    Text("Steps Goal")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.25, green: 0.32, blue: 0.42))
                }

                // MARK: - Counter Card
                HStack {
                    Button {
                        steps -= 500
                    } label: {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 56, height: 56)
                            .overlay(
                                Image(systemName: "minus")
                                    .foregroundColor(.gray)
                            )
                    }

                    Spacer()

                    VStack(spacing: 4) {
                        Text("\(steps.formatted())")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color(red: 0.22, green: 0.28, blue: 0.38))

                        HStack(spacing: 4) {
                            Image(systemName: "figure.walk")
                            Text("Steps")
                        }
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    }

                    Spacer()

                    Button {
                        steps += 500
                    } label: {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 56, height: 56)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.gray)
                            )
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white.opacity(0.6))
                        .blur(radius: 0.2)
                )
                .padding(.horizontal)

                // MARK: - Continue Button
                Button {} label: {
                    Text("Contine")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.25, green: 0.32, blue: 0.42))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.pink.opacity(0.4),
                                            Color.purple.opacity(0.3)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .blur(radius: 0.2)
                        )
                }
                .padding(.horizontal)

                Spacer()

                // MARK: - Bottom Navigation
                HStack {
                    Image(systemName: "figure.run")
                        .font(.title2)

                    Spacer()

                    Image("character")
                        .resizable()
                        .frame(width: 44, height: 44)

                    Spacer()

                    Image(systemName: "slider.horizontal.3")
                        .font(.title2)
                }
                .foregroundColor(Color(red: 0.25, green: 0.32, blue: 0.42))
                .padding(.horizontal, 40)
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    EditGoalView()
}
