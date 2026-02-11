
import Foundation
import Combine

@MainActor
final class AppSettings: ObservableObject {

    private enum Keys {
        static let isSignedIn = "isSignedIn"
        static let fullName   = "fullName"
        static let email      = "email"
        static let avatarHex  = "avatarHex"
    }

    @Published var isSignedIn: Bool {
        didSet { UserDefaults.standard.set(isSignedIn, forKey: Keys.isSignedIn) }
    }

    @Published var fullName: String {
        didSet { UserDefaults.standard.set(fullName, forKey: Keys.fullName) }
    }

    @Published var email: String {
        didSet { UserDefaults.standard.set(email, forKey: Keys.email) }
    }

    @Published var avatarHex: String {
        didSet { UserDefaults.standard.set(avatarHex, forKey: Keys.avatarHex) }
    }

    init() {
        let ud = UserDefaults.standard
        self.isSignedIn = ud.bool(forKey: Keys.isSignedIn)
        self.fullName   = ud.string(forKey: Keys.fullName) ?? "Abeer"
        self.email      = ud.string(forKey: Keys.email) ?? "Abeer@gmail.com"
        self.avatarHex  = ud.string(forKey: Keys.avatarHex) ?? "E8C9D5"
    }

    func signOut() {
        isSignedIn = false
    }
}
