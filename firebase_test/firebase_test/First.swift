//
//  First.swift
//  
//
//  Created by rubl333 on 2016/4/8.
//
//

import UIKit

class First: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a custom login button to app
        var myLoginButton: UIButton = UIButton.buttonWithType(.Custom) as! UIButton
        
        
        // myLoginButton.frame = CGRectMake(15,22, 290, 47)
        myLoginButton.frame = CGRectMake(30,0, 250, 35)
        //myLoginButton.center.x = self.view.center.x
        myLoginButton.setBackgroundImage(UIImage(named:"ui__fc_x_fbbar"),forState:.Normal)
        myLoginButton.setBackgroundImage(UIImage(named:"ui__fc_x_fbbar"),forState: UIControlState.Highlighted)
        
        
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: "loginButtonClicked", forControlEvents: .TouchUpInside)
        
        // Add the button to the view
        myLoginButton.tag = 10
        self.view2!.addSubview(myLoginButton)
        
        //Add Text to Button
        var myLoginButtonText = UILabel()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var lans = defaults.objectForKey("AppleLanguages") as! NSArray!
        var lan = lans.firstObject as! String
        
        if lan == "zh-TW" || lan.hasPrefix("zh-Hant") || lan == "zh-HK" || lan == "zh-MO" || lan == "zh-SG"{
            myLoginButtonText.text = "Facebook帳號登入"
            
        }else if lan.hasPrefix("zh-Hans"){
            myLoginButtonText.text = "Facebook账号登入"
            
        }else {
            myLoginButtonText.text = "Facebook Sign In"
        }
        
        myLoginButtonText.textColor = UIColor.blackColor()
        //myLoginButtonText.frame = CGRectMake(116,35, 145, 21)
        myLoginButtonText.frame = CGRectMake(115,12, 145, 13)
        //myLoginButtonText.center.x = self.view.center.x + CGFloat(30)
        myLoginButtonText.tag = 20
        self.view2!.addSubview(myLoginButtonText)
        ///////
        
   

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "first_to_talk"{
            let toTalk = segue.destinationViewController as! ViewController
            toTalk.getName = name.text
            
           
            
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
