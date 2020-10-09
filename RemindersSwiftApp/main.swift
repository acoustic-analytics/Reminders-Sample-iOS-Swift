//
//  main.swift
//  RemindersSwiftApp
//
//  Created by Chanikya on 8/1/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import Foundation
import UIKit

/*
    Swift 3 ?
 UIApplicationMain(CommandLine.argc, UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(
        to: UnsafeMutablePointer<Int8>.self,
        capacity: Int(CommandLine.argc)), NSStringFromClass(RemindersCustomApplication.self), NSStringFromClass(AppDelegate.self))
*/

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(RemindersCustomApplication.self),
    NSStringFromClass(AppDelegate.self)
)
