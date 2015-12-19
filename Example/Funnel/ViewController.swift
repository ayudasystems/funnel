//
//  ViewController.swift
//  Funnel
//
//  Created by Pierre-Yves Troël on 12/17/15.
//  Copyright © 2015 Ayuda Media Systems. All rights reserved.
//

import UIKit
import Funnel

class ViewController: UIViewController {
    
    @IBOutlet var tableViewContainer: UIView!
    @IBOutlet var funnelChart: FunnelChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! SettingsTableViewController
        vc.funnelChart = self.funnelChart
    }
}

