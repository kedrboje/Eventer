//
//  TrackingViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol TrackingViewProtocol: class {
    func proccessBadgePosition(badge: Badge)
}

final class TrackingViewController: UIViewController {
    
    var presenter: TrackingPresenterProtocol?
    
    /// single badge for the test
    private var badge: Badge?
    
    private var mapContainer: UIView!
    private var topLeftBase: UIImageView!
    private var topRightBase: UIImageView!
    private var bottomLeftBase: UIImageView!
    private var bottomRigthBase: UIImageView!
    private var badgeView: UIImageView!
    
    private var rssiOne: UILabel!
    private var rssiTwo: UILabel!
    private var rssiThree: UILabel!
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    private var badgeX: CGFloat!
    private var badgeY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        evntrSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Private Methods
private extension TrackingViewController {
    
    func evntrSetup() {
        setupMap()
        setupBases()
        setupInfo()
        setupBadgeView()
    }
    
    func evntLayout(){
        guard let bg = self.badge else { return }
        rssiOne.sizeToFit()
        rssiTwo.sizeToFit()
        rssiThree.sizeToFit()
        rssiOne.frame = CGRect(x: 16, y: mapContainer.frame.maxY + 16, width: rssiOne.frame.width, height: rssiOne.frame.height)
        rssiTwo.frame = CGRect(x: 16, y: rssiOne.frame.maxY + 8, width: rssiTwo.frame.width, height: rssiTwo.frame.height)
        rssiThree.frame = CGRect(x: 16, y: rssiTwo.frame.maxY + 8, width: rssiThree.frame.width, height: rssiThree.frame.height)
        
        guard let x = getBadgeX(), let y = getBadgeY() else { return }
        badgeView.frame = CGRect(x: x, y: y, width: 20, height: 20)
    }
    
    func setupBadgeView() {
        badgeView = UIImageView(image: UIImage(named: "badge"))
        view.addSubview(badgeView)
        badgeView.frame = .zero
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
    
    func setupInfo() {
        rssiOne = UILabel()
        rssiOne.numberOfLines = 1
        rssiOne.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        view.addSubview(rssiOne)
        rssiTwo = UILabel()
        rssiTwo.numberOfLines = 1
        rssiTwo.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        view.addSubview(rssiTwo)
        rssiThree = UILabel()
        rssiThree.numberOfLines = 1
        rssiThree.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        view.addSubview(rssiThree)
    }
    
    func getBadgeX() -> CGFloat? {
        guard let b = self.badge else { return nil }
        let numerator = CGFloat(b.distanceOne) * CGFloat(b.distanceOne) - CGFloat(b.distanceTwo) * CGFloat(b.distanceTwo) + mapContainer.frame.width * mapContainer.frame.width
        let denominator = 2 * mapContainer.frame.width
        return numerator/denominator
    }
    
    func getBadgeY() -> CGFloat? {
        guard let b = self.badge, let x = getBadgeX() else { return nil }
        let numerator = CGFloat(b.distanceTwo) * CGFloat(b.distanceTwo) - CGFloat(b.distanceThree) * CGFloat(b.distanceThree) - mapContainer.frame.width * mapContainer.frame.width + 2 * mapContainer.frame.width * x + mapContainer.frame.height * mapContainer.frame.height
        let denominator = 2 * mapContainer.frame.height
        return numerator/denominator
    }
    
}

// MARK: - TrackingViewProtocol
extension TrackingViewController: TrackingViewProtocol {
    func proccessBadgePosition(badge: Badge) {
        self.badge = badge
        rssiOne.text = "RSSI 1: " + String(describing: badge.rssiOne)
        rssiTwo.text = "RSSI 2: " + String(describing: badge.rssiTwo)
        rssiThree.text = "RSSI 3: " + String(describing: badge.rssiThree)
        evntLayout()
    }
}
