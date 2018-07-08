//
//  CarView.swift
//  EmiratesauctionTest
//
//  Created by Islam Elshazly on 7/7/18.
//  Copyright © 2018 Islam Elshazly. All rights reserved.
//

import UIKit

final class CarView: UIView {

    //MARK: vaialbes
    
    var timer: Timer?
    
    //MARK: outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var bidsLabel: UILabel!
    @IBOutlet weak var lotLabel: UILabel!
    @IBOutlet weak var carInfoContainerView: UIView!
    
    
    
    //MARK: life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubViews()
    }
    
    
    func initSubViews(withFrame frame : CGRect) {
        
        let nib = UINib(nibName: "CarView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        view.frame = frame
        addSubview(view)
    }
    
    func initSubViews () {
        
        let nib = UINib(nibName: "CarView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        view.frame = bounds
        addSubview(view)
        carInfoContainerView.roundedShadow()
    }

    deinit {
        timer?.invalidate()
    }
    
    //MARK: Actions
    
    
    @IBAction func favAction(_ sender: Any) {
        
    }
    
    //MARK: Helping Methods
    
    func configure(car: CarModel) {
        carImage.ShowLoadingOnImage()
        carImage.imageFromURL(car.image, placeHolder: nil)
        nameLabel.text = car.name
        priceLabel.text = "\(car.auctionInfo.currentPrice)"
        currencyLabel.text = car.auctionInfo.currency
        lotLabel.text = "\(car.auctionInfo.lot)"
        bidsLabel.text = "\(car.auctionInfo.bids)"
        calulateRemainigTime(car: car)
    }
    
    func showRemainingTime(car: CarModel) {
        let hours = car.auctionInfo.remmainingTime.hours
        let mintes = car.auctionInfo.remmainingTime.minutes
        let seconds = car.auctionInfo.remmainingTime.seconds
        if mintes <= 5 {
        timerLabel.textColor = .red
        }
        timerLabel.text = "\(hours)" + ":\(mintes)" + ":\(seconds)"
    }
    
    func calulateRemainigTime(car: CarModel) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update(timer:)), userInfo: ["car" : car], repeats: true)
    }
    
    @objc func update(timer: Timer!) {
        let info = timer.userInfo as! [String : Any]
        let car = info["car"] as? CarModel
        showRemainingTime(car: car!)
    }

}
