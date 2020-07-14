//
//  ViewController.swift
//  DoModulemap
//
//  Created by rocky on 2020/7/14.
//  Copyright © 2020 Rocky. All rights reserved.
//

import UIKit
import Ease
import Elevator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegateService = MMDelegateService(delegates: [self])
        delegateService?.addDelegate("one")
        delegateService?.addDelegate("two")
        delegateService?.removeDelegate("two")
        
        let con = MMConversation()
        con.names = ["rocky"]
        
        let elevator = XXXElevator()
        elevator.open()
        elevator.run()
        elevator.close()
        elevator.stop()
        
//        view.backgroundColor = UIColor(hexString: "")
        view.backgroundColor = UIColor.random()
    }


}

