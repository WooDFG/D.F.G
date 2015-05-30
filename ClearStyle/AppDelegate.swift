//
//  AppDelegate.swift
//  ClearStyle
//
//  Created by WengVic on 2015/5/7.
//  Copyright (c) 2015年 WengVic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        //Setting Plist因為要可以讀寫,所以要移到Documents的folder底下
//        let path:String = NSBundle.mainBundle().pathForResource("textCellPlist", ofType: "plist")!;
//        let destinationPath = String(format: "%@/Documents/textCellPlist.plist", arguments:[NSHomeDirectory()]);
//        var fm: NSFileManager = NSFileManager();
//        if (!fm.fileExistsAtPath(destinationPath))
//        {
//            //如果在documents資料夾底下找不到該檔案,則複製一份過去
//            fm.copyItemAtPath(path, toPath: destinationPath, error: nil);
//        }
        return true
    }
}

