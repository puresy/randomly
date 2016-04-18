//
//  ViewController.swift
//  Randomly
//
//  Created by YuChunzi on 4/13/16.
//  Copyright © 2016 YuChunzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var max: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func setRandomNumber(sender: UIButton) {
        
        let minString:String = self.min.text!
        
        let maxString:String = self.max.text!
        
        // TODO: not number? || min >= max
        
        doGetRandomNumber(minString, max: maxString)

    }
    
    func doGetRandomNumber(min:String, max:String) {
        self.numberLabel.text = "loading…"
        
        let url = NSURL(string: "https://www.random.org/integers/?num=1&min="+min+"&max="+max+"&col=1&base=10&format=plain&rnd=new")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding:NSUTF8StringEncoding))
            let s:String = String(data: data!, encoding: NSUTF8StringEncoding)!
            //self.numberLabel.text = s
            
            dispatch_async(dispatch_get_main_queue(), {
                self.numberLabel.text = s
            })
        }
        
        task.resume()
        
        // let n:Int = random()
        //numberLabel.text = String(n)    
    }
    
    func test(min:String, max:String) {
        self.numberLabel.text = "loading…"
        self.numberLabel.text = min + max
        
    }
    
}

