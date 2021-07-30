## MVVM-C Demo for ModuloTech
Sample iOS application using MVVM-C pattern and RxSwift

![<img src="image.png" width="100"/>](https://github.com/phuongnl/ModuloTechDemo/blob/develop/ModuloTech.png)

## Application Features
- List all device
- Delete device
- Filter by type
- Show device detail
- Each device type have separate screen with custom UI 
- Profile

## Architecture

- View is represented by `UIViewController` designed in Xib
- Model represents state and domain objects
- ViewModel interacts with Model and prepares data to be displayed. View uses ViewModel's data either directly or through bindings (using RxSwift) to configure itself. View also notifies ViewModel about user actions like button tap.
- Coordinator is responsible for handling application flow, decides when and where to go based on events from ViewModel (using RxSwift bindings).

![](https://miro.medium.com/max/2000/1*d1DXDtaoZVm8J-exVOkSOw.png)

## Famework
- SwiftyJSON: Parse json
- SwiftyBeaver: Logging
- Swinject: Dendency Injection
- SwinjectAutoregistration: Automatically register DI
- TPKeyboardAvoiding: Handle keyboard
- RxSwift
- SwiftGen
- SwiftLint


## Setup Project 
- SwiftLint, SwiftGen:

    `brew install swiftlint swiftgen`

- RxSwift:

    `carthage update --platform ios`

## References
- https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518
- https://wojciechkulik.pl/ios/mvvm-coordinators-rxswift-and-sample-ios-application-with-authentication