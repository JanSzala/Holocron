//
//  AppDelegate.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import CoreData
import LifetimeTracker
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let dependencyContainer: DependencyContainer = DependencyContainer()
    var flowController: FlowControllerType?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        LifetimeTracker.setup(onUpdate: LifetimeTrackerDashboardIntegration(visibility: .alwaysVisible, style: .circular).refreshUI)
        #endif
        
        if UserDefaults.isFirstLaunch() {
            UserDefaults.standard.set(true, forKey: "isDarkModeOn")
        }
                    
        window = {
            let flowController = dependencyContainer.flowController
            
            let appearanceConfig = dependencyContainer.appearanceConfig
            appearanceConfig.applyDefault()
            
            let mainWindow = UIWindow(frame: UIScreen.main.bounds)
            mainWindow.rootViewController = flowController.rootViewController
            mainWindow.makeKeyAndVisible()
            
            return mainWindow
        }()
        
        return true
    }
}
