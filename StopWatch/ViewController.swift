//
//  ViewController.swift
//  StopWatch
//
//  Created by 長崎茉優 on 2022/08/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var perfect:UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        perfect.isHidden = true
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if 9.8 <= count && count <= 10.2{
            perfect.isHidden = false
            perfect.text = String("Perfect")
            perfect.textColor = UIColor.red
        }
        else if 9.7 <= count && count <= 10.3{
            perfect.isHidden = false
            perfect.text = String("Great")
            perfect.textColor = UIColor.green
        }
        
        else if 9.5 <= count && count <= 10.5{
            perfect.isHidden = false
            perfect.text = String("Good")
            perfect.textColor = UIColor.blue
        }
        
        else {
            perfect.isHidden = false
            perfect.text = String("Bad")
            perfect.textColor = UIColor.black
        }
    }
    
    @IBAction func start(){
        
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func stop(){
        
        if timer.isValid{
            timer.invalidate()
        }
        self.hantei()
        
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0
        label.text = String(count)
    }


}

