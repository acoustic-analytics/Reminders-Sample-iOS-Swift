//
//  main.swift
//  RemindersSwiftApp
//
//  Created by Chanikya on 8/1/17.
//  Copyright (C) 2017 Acoustic, L.P. All rights reserved.
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
