# Re:Connect Social Media Application

## 💡 Quick Note About This Repository
This repository was previously home to many other projects besides Re:Connect. They were moved to make this repository less cluttered and confusing. However, the original path to the Re:Connect source code were still in the same place to prevent errors when Xcode trying to find the original path.

## ℹ️ About Re:Connect

### Info
Re:Connect (pronounced "reconnect") is a social media application similar to X (Twitter) but it focuses more on keeping users safe online. It has a native iOS user interface that feels right at home for Apple users and an incredible user experience that feels delightful to use.

### Re:Connect (iOS)
This is the original version of Re:Connect written for iOS. It was built entirely using SwiftUI and with modification can be optimized for the iPad interface, as well as reusing the same code to port the app to macOS.

### Re:Connect (Cross-platform)
This version of Re:Connect is still being planned. The purpose and functionality of this app remains identical to its iOS counterpart. The only difference is that this app will be built with Flutter instead of SwiftUI, allowing it to be run on Android rather than exclusive to iOS.

## 🛜 Backend Management
Both the iOS and future cross platform app use Google Firebase for database and authentication support on the backend.

### Firebase Database Integration
The data for almost everything the user does in the app (i.e. user profiles, posts, user metadata, etc.) are stored in **Firebase Database**, a NoSQL database that store data as a dictionary format that can also be easily read as JSON.

### Firebase Auth Integration
The login/logout and account management is handled by **Firebase Auth**, it does everything under the hood including "Sign in with Google/Facebook/Apple" buttons, as well as the standard Email/Password sign in that is very secured, requiring no knowledge of encryption to work with this API.