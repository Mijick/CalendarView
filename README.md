<br>
<p align="center">
    
<!-- Mijick Header -->
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Dark/Header.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Light/Header.svg">
    <img alt="Mijick Header" width="100%">
</picture>


<!-- Social Buttons -->
<p align="center">

<!-- GitHub -->
<a href="https://github.com/Mijick">
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Dark/Button/Github.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Light/Button/Github.svg">
    <img alt="Mijick GitHub" height="32px">
</picture>
</a>

<!-- Twitter -->
<a href="https://twitter.com/MijickTeam">
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Dark/Button/X.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Light/Button/X.svg">
    <img alt="Mijick Twitter" height="32px">
</picture>
</a>

<!-- Email -->
<a href="mailto:team@mijick.com?subject=Hello">
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Dark/Button/Email.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Light/Button/Email.svg">
    <img alt="Mijick Mail" height="32px">
</picture>
</a>


<!-- Separator -->
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Dark/Separator.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/Mijick/On%20Light/Separator.svg">
    <img alt="Separator" width="100%" height="0.25px">
</picture>

</p>

<!-- Header End -->

<br><br>

<!-- CalendarView Logo -->
<p align="center">
<picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Mijick/Assets/blob/main/CalendarView/Logo/Dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/Mijick/Assets/blob/main/CalendarView/Logo/Light.svg">
    <img alt="CalendarView Logo" width="72%">
</picture>
</p>

<!-- Library Name -->
<h3 align="center">
    Calendars made simple
</h3>

<!-- Library Description -->
<p align="center">
    Create fully customisable calendar in no time. Keep your code clean
</p>

<!-- Demo Link -->
<p align="center">
<a href="https://github.com/Mijick/CalendarView-Demo" rel="nofollow">
    Try demo we prepared
</a>
</p>

<br>


<!-- Labels -->
<p align="center">
    <img alt="SwiftUI logo" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/Language.svg"/>
    <img alt="Platforms: iOS, iPadOS, macOS, tvOS" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/Platforms.svg"/>
    <img alt="Current Version" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/Version.svg"/>
    <img alt="License: MIT" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/License.svg"/>
</p>
<p align="center">
    <img alt="Made in Kraków" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/Origin.svg"/> 
    <a href="https://github.com/Mijick/CalendarView/stargazers">
        <img alt="Stargazers" src="https://github.com/Mijick/Assets/blob/main/CalendarView/Labels/Stars.svg"/>
    </a>                                                                                                               
</p>


<!-- GIFs -->
<p align="center">
    <img alt="Calendar Example 1" src="https://github.com/Mijick/Assets/blob/main/PopupView/GIFs/PopupView-Bottom.gif" width="23%"/>
    <img alt="Calendar Example 2" src="https://github.com/Mijick/Assets/blob/main/PopupView/GIFs/PopupView-Centre.gif" width="23%"/>
    <img alt="Calendar Example 3" src="https://github.com/Mijick/Assets/blob/main/PopupView/GIFs/PopupView-Top.gif" width="23%"/>
    <img alt="Calendar Example 4" src="https://github.com/Mijick/Assets/blob/main/PopupView/GIFs/PopupView-Top.gif" width="23%"/>
</p>

<br>

<!-- Summary -->
CalendarView is a free and open-source library designed for SwiftUI that makes the process of creating calendars easier and much cleaner.
* **Improves code quality.** Create a calendar using `MCalendarView` constructor and pass the selected date / range to it. Simple as never!
* **Customize calendar in no time.** We know how important customisation is; that's why we give you the opportunity to design your calendar in any way you like.
* **Designed for SwiftUI.** While developing the library, we have used the power of SwiftUI to give you powerful tool to speed up your implementation process.

<br>


<!-- Getting Started -->
# Getting Started
### ✋ Requirements

| **Platforms** | **Minimum Swift Version** |
|:----------|:----------|
| iOS 14+ | 5.0 |
| iPadOS 14+ | 5.0 |
| macOS 11+ | 5.0 |
| watchOS 7+ | 5.0 |


<!-- Installation -->
### ⏳ Installation
#### [Swift Package Manager][spm]
Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the Swift compiler.

Once you have your Swift package set up, adding CalendarView as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```Swift
dependencies: [
    .package(url: "https://github.com/Mijick/CalendarView.git", branch(“main”))
]
```

<!-- Cocoapods -->
#### [Cocoapods][cocoapods]   
Cocoapods is a dependency manager for Swift and Objective-C Cocoa projects that helps to scale them elegantly.

Installation steps:
- Install CocoaPods 1.10.0 (or later)
- [Generate CocoaPods][generate_cocoapods] for your project
```Swift
    pod init
```
- Add CocoaPods dependency into your `Podfile`   
```Swift
    pod 'MijickCalendarView'
```
- Install dependency and generate `.xcworkspace` file
```Swift
    pod install
```
- Use new XCode project file `.xcworkspace`
<br>


<!-- Usage -->
# Usage





[MIT]: https://en.wikipedia.org/wiki/MIT_License
[SPM]: https://www.swift.org/package-manager

[Demo]: https://github.com/Mijick/CalendarView-Demo
[License]: https://github.com/Mijick/CalendarView/blob/main/LICENSE

[spm]: https://www.swift.org/package-manager/
[cocoapods]: https://cocoapods.org/
[generate_cocoapods]: https://github.com/square/cocoapods-generate

[PopupView]: https://github.com/Mijick/PopupView
[Navigattie]: https://github.com/Mijick/Navigattie 
[GridView]: https://github.com/Mijick/GridView
[Timer]: https://github.com/Mijick/Timer
