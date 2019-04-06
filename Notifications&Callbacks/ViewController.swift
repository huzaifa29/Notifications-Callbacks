//
//  ViewController.swift
//  Notifications&Callbacks
//
//  Created by Hamza Jalal on 02/04/2019.
//  Copyright © 2019 simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSubscribe: UILabel!
    @IBOutlet weak var btnSubscribe: UIButton!
    
    var callBack: (()-> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Default text assign to Label
        self.lblSubscribe.text = "Please subscribe it"
        
        //
        self.callBack = {
            self.lblSubscribe.text = "You have successfully subscribed by CallBack"
            self.btnSubscribe.setTitle("SUBSCRIBED", for: .normal)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(successfullySubscribed), name: Notification.Name.successfullySubscribedName, object: nil)
    }
    
    @objc func successfullySubscribed() {
        self.lblSubscribe.text = "You have successfully subsribed by Notification Center"
        self.btnSubscribe.setTitle("SUBSCRIBED", for: .normal)
    }
    
    @IBAction func subscribePressed(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name.successfullySubscribedName, object: nil)
//        self.callBack!()
    }
}

extension Notification.Name{
    static let successfullySubscribedName = Notification.Name("successfullySubscribed")
}

