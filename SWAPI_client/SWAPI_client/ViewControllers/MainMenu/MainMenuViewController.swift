//
//  MainMenuViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var menuView: MainMenuSquareView!
    
    lazy var xAxisSpacing = menuView.frame.width + viewModel.spacingBetweenButtons
    lazy var yAxisSpacing = menuView.frame.height + viewModel.spacingBetweenButtons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.isInternetConnected() ? nil : presentAlert()
        setupMainMenuButton()
        animateMenuView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        sceneView.backgroundColor = darkModeColor()
        viewModel.applyCurrentModeToViews(color: darkModeColor(), reversedColor: darkModeColor(reversedColors: true))
    }
    
    func setupMainMenuButton() {
        menuView.frame.origin.y = sceneView.frame.maxY + menuView.frame.height + viewModel.additionalSpace
        
        menuView.onButton = {
            self.viewModel.onOptions?()
        }
        
        viewModel.addViewToArray(menuView)
    }
}

extension MainMenuViewController {
    private func animateMenuView() {
        UIView.animate(withDuration: viewModel.animationDuration, delay: viewModel.animationDelay, options: .curveEaseInOut, animations: {
            self.menuView.frame.origin.y = self.sceneView.frame.height / 2
        }, completion: { _ in
            
            //TODO: Change it to iterate through enum
            self.createView(delay: 0.1, viewPlacing: .leftMiddle, index: 0)
            self.createView(delay: 0.2, viewPlacing: .leftTop, index: 1)
            self.createView(delay: 0.3, viewPlacing: .rightTop, index: 2)
            self.createView(delay: 0.4, viewPlacing: .rightMiddle, index: 3)
            self.createView(delay: 0.5, viewPlacing: .rightDown, index: 4)
            self.createView(delay: 0.6, viewPlacing: .leftDown, index: 5)
        })
    }
    
    private func createView(delay: TimeInterval, viewPlacing: ViewPlacing, index: Int) {
        let view = MainMenuSquareView(frame: menuView.frame)
        view.button.setTitle(viewModel.buttonTitle(for: index), for: .normal)
        sceneView.insertSubview(view, belowSubview: menuView)
        
        view.mainView.backgroundColor = darkModeColor(reversedColors: true)
        view.button.setTitleColor(darkModeColor(), for: .normal)
        
        view.onButton = {
            self.viewModel.onTapped?(self.viewModel.dataType(for: index), self.viewModel.buttonTitle(for: index))
        }
        
        viewModel.addViewToArray(view)
        animateView(view: view, delay: delay, viewPlacing: viewPlacing)
    }
    
    private func animateView(view: UIView, delay: TimeInterval, viewPlacing: ViewPlacing) {
        UIView.animate(withDuration: viewModel.placingAnimationDuration, delay: delay, options: .curveEaseInOut, animations: {
            switch viewPlacing {
            case .leftDown:
                view.frame.origin.x -= self.xAxisSpacing / 2
                view.frame.origin.y += self.yAxisSpacing
            case .leftMiddle:
                view.frame.origin.x -= self.xAxisSpacing
            case .leftTop:
                view.frame.origin.x -= self.xAxisSpacing / 2
                view.frame.origin.y -= self.yAxisSpacing
            case .rightTop:
                view.frame.origin.x += self.xAxisSpacing / 2
                view.frame.origin.y -= self.yAxisSpacing
            case .rightMiddle:
                view.frame.origin.x += self.xAxisSpacing
            case .rightDown:
                view.frame.origin.x += self.xAxisSpacing / 2
                view.frame.origin.y += self.yAxisSpacing
            }
        }, completion: nil)
    }
}

extension MainMenuViewController {
    private func presentAlert() {
        self.present(viewModel.alert, animated: true)
    }
}

extension MainMenuViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: MainMenuViewModelType) {
    }
}
