//
//  ToDoItem.swift
//  ClearStyle
//
//  Created by A30607 on 2015/5/14.
//  Copyright (c) 2015年 A30607. All rights reserved.
//

import UIKit

class ToDoItem: NSObject
{
    var text:String
    var completed:Bool
    init(text:String)
    {
        self.text = text
        self.completed = false
    }
   
}
