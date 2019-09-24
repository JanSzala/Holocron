//
//  MainMenuAnimatedView.swift
//  SWAPI_client
//
//  Created by GLaDOS on 18/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

public enum DataType {
    case People
    case Films
    case Species
    case Starships
    case Vehicles
    case Planets
}

private enum ViewPlacing {
    case leftMiddle
    case leftTop
    case rightTop
    case rightMiddle
    case rightDown
    case leftDown
}

class MainMenuAnimatedView: UIView {
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainMenuButton: MainMenuSquareView!
    
    var onOptions: () -> () = {}
    
    var onFilms: () -> () = {}
    var onPeople: () -> () = {}
    var onPlanets: () -> () = {}
    var onSpecies: () -> () = {}
    var onShips: () -> () = {}
    var onVehicles: () -> () = {}
    
    var onTapped: ((DataType, String) -> ())?
    var views = [MainMenuSquareView]()
    
    lazy var xAxisSpacing = mainMenuButton.frame.width + spacingBetweenButtons
    lazy var yAxisSpacing = mainMenuButton.frame.height + spacingBetweenButtons

    let spacingBetweenButtons: CGFloat = 10
    let additionalSpace: CGFloat = 70
    let animationDuration: TimeInterval = 0.5
    let placingAnimationDuration: TimeInterval = 0.3
    let animationDelay: TimeInterval = 0.5
    
    lazy var closures: [() -> ()] = [onFilms, onPeople, onPlanets, onSpecies, onShips, onVehicles]
    
    var buttonTitlesArray: [String] = [NSLocalizedString("Films", comment: ""),
                                       NSLocalizedString("People", comment: ""),
                                       NSLocalizedString("Planets", comment: ""),
                                       NSLocalizedString("Species", comment: ""),
                                       NSLocalizedString("Ships", comment: ""),
                                       NSLocalizedString("Vehicles", comment: "")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMainMenuButton()
        animatemainMenuButton()
        applyCurrentColorModeToViewAndSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MainMenuAnimatedView", owner: self, options: nil)
        containerView.fixInView(self)
    }
}

extension MainMenuAnimatedView {
    private func setupMainMenuButton() {
        mainMenuButton.frame.origin.y = containerView.frame.maxY + mainMenuButton.frame.height + additionalSpace
        mainMenuButton.accessibilityIdentifier = "Options"
        
        mainMenuButton.onButton = {
            self.onOptions()
        }
        
        views.append(mainMenuButton)
    }
    
    private func animatemainMenuButton() {
        UIView.animate(withDuration: animationDuration, delay: animationDelay, options: .curveEaseInOut, animations: {
            self.mainMenuButton.frame.origin.y = self.containerView.frame.height / 2
        }, completion: { _ in
            self.createView(delay: 0.1, viewPlacing: .leftMiddle, index: 0)
            self.createView(delay: 0.2, viewPlacing: .leftTop, index: 1)
            self.createView(delay: 0.3, viewPlacing: .rightTop, index: 2)
            self.createView(delay: 0.4, viewPlacing: .rightMiddle, index: 3)
            self.createView(delay: 0.5, viewPlacing: .rightDown, index: 4)
            self.createView(delay: 0.6, viewPlacing: .leftDown, index: 5)
        })
    }
    
    private func createView(delay: TimeInterval, viewPlacing: ViewPlacing, index: Int) {
        let view = MainMenuSquareView(frame: mainMenuButton.frame)
        view.button.setTitle(buttonTitlesArray[index], for: .normal)
        view.button.accessibilityIdentifier = buttonTitlesArray[index]
        containerView.insertSubview(view, belowSubview: mainMenuButton)
        
        view.mainView.backgroundColor = darkModeColor(reversedColors: true)
        view.button.setTitleColor(darkModeColor(), for: .normal)
        
        view.onButton = {
            self.closures[index]()
        }
        
        views.append(view)
        animateView(view: view, delay: delay, viewPlacing: viewPlacing)
    }
    
    private func animateView(view: UIView, delay: TimeInterval, viewPlacing: ViewPlacing) {
        UIView.animate(withDuration: placingAnimationDuration, delay: delay, options: .curveEaseInOut, animations: {
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

extension MainMenuAnimatedView {
    func applyCurrentColorModeToViewAndSubviews() {
        containerView.backgroundColor = darkModeColor()
        applyCurrentModeToButtons(color: darkModeColor(), reversedColor: darkModeColor(reversedColors: true))
    }
    
    private func applyCurrentModeToButtons(color: UIColor, reversedColor: UIColor) {
        for view in views {
            view.mainView.backgroundColor = reversedColor
            view.button.setTitleColor(color, for: .normal)
        }
    }
}
