//
//  MainMenuViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import UIKit

internal class MainMenuViewController: UIViewController {
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var mainMenuAnimatedView: MainMenuAnimatedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.isInternetConnected() ? nil : presentAlert()
        
        mainMenuAnimatedView.onFilms = {
            self.viewModel.onFilms?()
        }
        
        mainMenuAnimatedView.onPeople = {
            self.viewModel.onPeople?()
        }
        
        mainMenuAnimatedView.onPlanets = {
            self.viewModel.onPlanets?()
        }
        
        mainMenuAnimatedView.onSpecies = {
            self.viewModel.onSpecies?()
        }
        
        mainMenuAnimatedView.onShips = {
            self.viewModel.onShips?()
        }
        
        mainMenuAnimatedView.onVehicles = {
            self.viewModel.onVehicles?()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        applyCurrentColorModeToController()
        mainMenuAnimatedView.applyCurrentColorModeToViewAndSubviews()
    }
}

extension MainMenuViewController {
    private func applyCurrentColorModeToController() {
        sceneView.backgroundColor = darkModeColor()
    }
    
    private func presentAlert() {
        self.present(viewModel.alert, animated: true)
    }
}

extension MainMenuViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: MainMenuViewModelType) {
    }
}
