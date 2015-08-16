//
//  ViewController.swift
//  Tips
//
//  Created by Whitney Gonzalez on 8/13/15.
//  Copyright (c) 2015 WhitneyDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var tipView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billView.transform.ty = 100
        
        tipView.alpha = 0
        tipView.transform.ty = 100
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func setVisibilityOfTipView() {
        if billField.text == "" {
            UIView.animateWithDuration( 0.3, animations:{
                self.tipView.alpha = 0
                self.tipView.transform.ty = 100
            })
        } else {
            UIView.animateWithDuration( 0.3, animations:{
                self.tipView.alpha = 1
                self.tipView.transform.ty = 0
            })
        }
    }

    @IBAction func onEditingDidBegin(sender: UITextField) {
        UIView.animateWithDuration( 0.3, animations:{
            self.billView.transform.ty = 0
        })
        self.setVisibilityOfTipView()
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tipAmount = billAmount * tipPercentage
        var totalAmount = billAmount + tipAmount
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(totalAmount)"
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        
        self.setVisibilityOfTipView()
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
        self.setVisibilityOfTipView()
        
        UIView.animateWithDuration( 0.3, animations:{
            
            self.billView.transform.ty = 100
            self.tipView.transform.ty = 100
            
        })
    }
}

