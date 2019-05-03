# iOS Base Project



## Requirements



- iOS 9.0+

- Install the latest version of xCode.

- Swift version 4 was the last version of Swift used.



### Getting Started ###



* Clone the repository



Run `git clone https://github.com/CottaCush/iOSBaseProject.git`





## Setup

- Close Xcode

- Open a terminal window, and `$ cd` into your project directory.

- Run `$ pod install` if you are installing for the first time

- You may require to run `$ pod update`

-  `$ open iOSBaseProject.xcworkspace` and build.



### Pods



- [Alamofire](https://github.com/Alamofire/Alamofire): Elegant HTTP Networking in Swift



- [EVReflection](https://github.com/evermeer/EVReflection): Reflection based (Dictionary, CKRecord, NSManagedObject, Realm, JSON and XML) object mapping with extensions for Alamofire



- [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager): Codeless drop-in universal library allows to prevent issues of keyboard sliding up and cover UITextField/UITextView with one line of code



-  [MBProgressHUD](https://github.com/jdg/MBProgressHUD)



- [Toast-Swift](https://github.com/scalessec/Toast-Swift) : A Swift extension that adds toast notifications to the UIView object class.



### Upload to TestFlight 1.0 ###

- Add the OptionsPlist file and the buildscript.sh file to the root directry of your project

- Ensure to set up your project to be useful with  xcode build tools as itemised [here](https://docs.google.com/document/d/1fCXVenGy4BjLDUWLgHHC-26ZsCq_MRt9QBAqDu8K2bQ/edit)

- Open Terminal and cd to your root directory.

- run script like so (./build.script.sh) and follow the prompts
