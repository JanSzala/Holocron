//
//  AppDelegate.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
internal class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let dependencyContainer: DependencyContainer = DependencyContainer()
    var flowController: FlowControllerType?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        flowController = dependencyContainer.flowController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = flowController?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

