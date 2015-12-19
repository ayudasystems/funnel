//
//  SettingTableViewController.swift
//  Funnel
//
//  Created by Pierre-Yves Troël on 12/18/15.
//  Copyright © 2015 Ayuda Media Systems. All rights reserved.
//

import UIKit
import Funnel

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet var coneLipHeightStepper: UIStepper!
    @IBOutlet var coneLipHeightLabel: UILabel!
    @IBOutlet var animateIntoViewSwitch: UISwitch!
    @IBOutlet var stemHeightStepper: UIStepper!
    @IBOutlet var stemHeightLabel: UILabel!
    @IBOutlet var stemWidthStepper: UIStepper!
    @IBOutlet var stemWidthLabel: UILabel!
    @IBOutlet var sliceSpacingStepper: UIStepper!
    @IBOutlet var sliceSpacingLabel: UILabel!
    @IBOutlet var drawHorizontalLinesSwitch: UISwitch!
    @IBOutlet var drawFunnelLeftShadowSwitch: UISwitch!
    @IBOutlet var funnelLeftShadowWidthStepper: UIStepper!
    @IBOutlet var funnelLeftShadowWidthLabel: UILabel!
    
    private var _funnerChart: FunnelChart?
    
    var funnelChart: FunnelChart? {
        get {
            return _funnerChart
        }
        set (newValue){
            _funnerChart = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.syncFromChart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChangeValueOfConeLipHeightStepper(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.coneLipHeightAsFractionOfViewHeight = CGFloat(self.coneLipHeightStepper.value / 100)
            self.updateLabels()
        }
    }
    
    @IBAction func didChangeValueOfStemHeightStepper(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.stemHeightAsFractionOfViewHeight = CGFloat(self.stemHeightStepper.value / 100)
            self.updateLabels()
        }
    }
    
    @IBAction func didChangeValueOfStemWidthStepper(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.stemWidthAsFractionOfViewWidth = CGFloat(self.stemWidthStepper.value / 100)
            self.updateLabels()
        }
    }
    
    @IBAction func didChangeValueOfSliceSpacingStepper(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.sliceSpacingAsFractionOfViewHeight = CGFloat(self.sliceSpacingStepper.value / 100)
            self.updateLabels()
        }
    }
    
    @IBAction func didChangeValueOfAnimateIntoViewSwitch(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.animateIntoViewWhenPropertiesChange = self.animateIntoViewSwitch.on
        }
    }
    
    @IBAction func didChangeValueOfDrawHorizontalLinesSwitch(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.drawHorizontalLines = self.drawHorizontalLinesSwitch.on
        }
    }
    
    @IBAction func didChangeValueOfDrawFunnelLeftShadowSwitch(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.drawFunnelLeftShadow = self.drawFunnelLeftShadowSwitch.on
        }
    }

    @IBAction func didChangeValueOfFunnelLeftShadowWidthStepper(sender: AnyObject) {
        if funnelChart != nil {
            funnelChart!.funnelLeftShadowWidthAsFractionOfViewWidth = CGFloat(self.funnelLeftShadowWidthStepper.value / 100)
            self.updateLabels()
        }
    }

    
    func syncFromChart() {
        if funnelChart == nil {
            return
        }
        
        self.coneLipHeightStepper.value = Double(self.funnelChart!.coneLipHeightAsFractionOfViewHeight * CGFloat(100))
        self.stemHeightStepper.value = Double(self.funnelChart!.stemHeightAsFractionOfViewHeight * CGFloat(100))
        self.stemWidthStepper.value = Double(self.funnelChart!.stemWidthAsFractionOfViewWidth * CGFloat(100))
        self.sliceSpacingStepper.value = Double(self.funnelChart!.sliceSpacingAsFractionOfViewHeight * CGFloat(100))
        self.funnelLeftShadowWidthStepper.value = Double(self.funnelChart!.funnelLeftShadowWidthAsFractionOfViewWidth * CGFloat(100))

        self.animateIntoViewSwitch.on = self.funnelChart!.animateIntoViewWhenPropertiesChange
        self.drawFunnelLeftShadowSwitch.on = self.funnelChart!.drawFunnelLeftShadow
        self.drawHorizontalLinesSwitch.on = self.funnelChart!.drawHorizontalLines

        self.updateLabels()
    }
    
    func updateLabels () {
        let coneLipHeightLabelValue = funnelChart!.coneLipHeightAsFractionOfViewHeight * 100
        self.coneLipHeightLabel.text = "\(coneLipHeightLabelValue)%"
        let stemHeightLabelValue = funnelChart!.stemHeightAsFractionOfViewHeight * 100
        self.stemHeightLabel.text = "\(stemHeightLabelValue)%"
        let stemWidthLabelValue = funnelChart!.stemWidthAsFractionOfViewWidth * 100
        self.stemWidthLabel.text = "\(stemWidthLabelValue)%"
        let sliceSpacingLabelValue = funnelChart!.sliceSpacingAsFractionOfViewHeight * 100
        self.sliceSpacingLabel.text = "\(sliceSpacingLabelValue)%"
        let funnelLeftShadowWidthLabelValue = funnelChart!.funnelLeftShadowWidthAsFractionOfViewWidth * 100
        self.funnelLeftShadowWidthLabel.text = "\(funnelLeftShadowWidthLabelValue)%"
    }
}

