//
//  TrackingViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

final class TrackingViewController: UIViewController {
    
    private var mapContainer: UIView!
    private var topLeftBase: UIImageView!
    private var topRightBase: UIImageView!
    private var bottomLeftBase: UIImageView!
    private var bottomRigthBase: UIImageView!
    private var badgeView: UIImageView!
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        evntrSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension TrackingViewController {
    
    func evntrSetup() {
        setupMap()
        setupBases()
    }
    
    func setupMap() {
        mapContainer = UIView()
        mapContainer.backgroundColor = .clear
        view.addSubview(mapContainer)
        mapContainer.frame = CGRect(x: 20, y: 100, width: width - 40, height: height - 300)
    }
    
    func setupBases() {
        topLeftBase = UIImageView(image: UIImage(named: "base"))
        topRightBase = UIImageView(image: UIImage(named: "base"))
        bottomLeftBase = UIImageView(image: UIImage(named: "base"))
        bottomRigthBase = UIImageView(image: UIImage(named: "base"))
        
        mapContainer.addSubview(topLeftBase)
        mapContainer.addSubview(topRightBase)
        mapContainer.addSubview(bottomLeftBase)
        mapContainer.addSubview(bottomRigthBase)
        
        topLeftBase.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        topRightBase.frame = CGRect(x: mapContainer.frame.width - 24, y: 0, width: 24, height: 24)
        bottomLeftBase.frame = CGRect(x: 0, y: mapContainer.frame.height - 24, width: 24, height: 24)
        bottomRigthBase.frame = CGRect(x: mapContainer.frame.width - 24, y: mapContainer.frame.height - 24, width: 24, height: 24)
    }
    
}
