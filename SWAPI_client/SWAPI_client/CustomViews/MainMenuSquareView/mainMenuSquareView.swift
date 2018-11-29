//
//  mainMenuSquareView.swift
//  SWAPI_client
//
//  Created by JanSzala on 05/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

internal class mainMenuSquareView: UIView {
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var button: UIButton!
        
    var onButton: () -> () = {
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.layer.cornerRadius = 10
    }
    
    @IBAction func onButton(_ sender: Any) {
        onButton()
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
        Bundle.main.loadNibNamed("mainMenuSquareView", owner: self, options: nil)
        sceneView.fixInView(self)
    }
}
