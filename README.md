# KeyboardKit

Add a custom software keyboard toolbar above the keyboard with ability to swipe toolbar down to dismiss the toolbar with the keyboard.

SwiftUI


## Use
Apply func keyboardToolbar() to root view:

```
var body: some View {  
	VStack { ... }	
	.keyboardToolbar(...)  
}  
```

Two options:  
1. Function call with parameter toolbar - a view closure for toolbar.  
2. No parameter would use `default` toolbar with one trailing button to  dismiss the keyboard. 


## References

Moving view up (not to be hidden by keyboard:

* (kontiki) [How to make the bottom button follow the keyboard display in SwiftUI - Stack Overflow](https://stackoverflow.com/a/57743709/11793043)
* great discussion in comments at [ios - How to show complete List when keyboard is showing up in SwiftUI - Stack Overflow](https://stackoverflow.com/a/56718632/11793043)


[How to dismiss the keyboard for a TextField - a free SwiftUI by Example tutorial](https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield)  
[How to Make Pure SwiftUI Keyboard Toolbar? | by Prafulla Singh | The Startup | Medium](https://medium.com/swlh/how-to-make-pure-swiftui-keyboard-toolbar-16a3d092b4df)  
[How to make the bottom button follow the keyboard display in SwiftUI - Stack Overflow](https://stackoverflow.com/a/57743709)   
[Keyboard Animation](https://stackoverflow.com/a/57743709/11793043)  

[iOS Custom Keyboard Guide - Shyngys Kassymov](https://shyngys.com/ios-custom-keyboard-guide)  
[How to add a toolbar above the keyboard using inputAccessoryView - free Swift 5.1 example code and tips](https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-toolbar-above-the-keyboard-using-inputaccessoryview)   
[ios - SwiftUI in target (custom keyboard) - Stack Overflow](https://stackoverflow.com/questions/59869589/swiftui-in-target-custom-keyboard)  
[ios - Extend SwiftUI Keyboard with Custom Button - Stack Overflow](https://stackoverflow.com/questions/59003612/extend-swiftui-keyboard-with-custom-button)  

* KeyboardKit  

    [KeyboardKitSwiftUI](https://github.com/danielsaidi/KeyboardKitSwiftUI)      	
    [KeyboardKit](https://github.com/danielsaidi/KeyboardKit)   
    [KeyboardKit SwiftUI Readme](https://github.com/danielsaidi/KeyboardKit/blob/master/Readmes/SwiftUI.md)  
    [SwiftUI-Tutorial](https://github.com/danielsaidi/KeyboardKit/blob/master/Readmes/SwiftUI-Tutorial.md)  
