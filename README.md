# DoModulemap
学习llvm中的module-map-language

// http://clang.llvm.org/docs/Modules.html#module-map-language

// 如果某些模块之间是有关联的，可以将他们放在一个module中，内部再使用子模块嵌套的方式进行export
``` c
// in module.modulemap file
module Ease {
    module DelegateService {
        // 这里可以使用相对路径去获取对应模块的相应头文件
        header "../DelegateService/MMDelegateService.h"
    }
    module Conversation {
        // 如果模块中的类比较多，可以使用一个公用的header文件，然后在这里将这个header文件引入
        // 另外还可以使用umbrella这个关键字，
        header "MMConversation-header.h"
        export Color
    }
    module Color {
        header "../UIColor+Common/UIColor+Common.h"
    }
}

// 如果某些模块之间是没有关联的，可以使用这样的方式，再次制作一个module
module Elevator {
    header "../Elevator/XXXElevator.h"
    //export *
}

```

很多第三方framework的modulemap文件都是类似下面的结构
 ``` swift
 framework module RxSwift {
     umbrella header "RxSwift-umbrella.h"
     
     export *
     module * { export * }
 }
 ```
 
 使用一个`umbrella header`修饰一个地址，地址文件内部大多都是这样的样式，
 
 ``` c
 #ifdef __OBJC__
 #import <UIKit/UIKit.h>
 #else
 #ifndef FOUNDATION_EXPORT
 #if defined(__cplusplus)
 #define FOUNDATION_EXPORT extern "C"
 #else
 #define FOUNDATION_EXPORT extern
 #endif
 #endif
 #endif


 FOUNDATION_EXPORT double RxSwiftVersionNumber;
 FOUNDATION_EXPORT const unsigned char RxSwiftVersionString[];
 ```
