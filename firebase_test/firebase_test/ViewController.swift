//
//  ViewController.swift
//  firebase_test
//
//  Created by rubl333 on 2016/4/4.
//  Copyright (c) 2016年 appcoda. All rights reserved.
//

import UIKit
import Firebase



class ViewController: UIViewController,UITextFieldDelegate {
    // Create a reference to a Firebase location
//    var myRootRef = Firebase(url:"https://chatroom-ios-test.firebaseio.com")
    var myRootRef = Firebase(url:"https://vivid-inferno-5031.firebaseio.com")
    
    
    
    @IBOutlet weak var outPut: UITextView!
    @IBOutlet weak var nameInput: UITextField!

    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func button(sender: AnyObject) {
        // Read data and react to changes
        
        let usersRef = myRootRef.childByAutoId()
        
       var users = ["name": nameInput.text, "text": textInput.text]
        usersRef.setValue(users)
        
        usersRef.childByAppendingPath("name").setValue(nameInput.text)
        usersRef.childByAppendingPath("text").setValue(textInput.text)
        

        
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
            

        })
        var timer:NSTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "text_clean", userInfo: nil, repeats: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameInput.delegate = self
        textInput.delegate = self
        // Write data to Firebase
        
        
        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            println(snapshot.value.objectForKey("name"))
            println(snapshot.value.objectForKey("text"))
            
            var x: String! = snapshot.value.objectForKey("name") as! String
            var y: String! = snapshot.value.objectForKey("text") as! String
            
            self.outPut.text = self.outPut.text + "\(x)" + " : " + "\(y)" + "\n"
            
            
        })
        
        
    }
    
    func textFieldShouldReturn(nameInput: UITextField) -> Bool { //隐藏键盘
        nameInput.resignFirstResponder()
        textInput.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(nameInput: UITextField)
    {
        nameInput.becomeFirstResponder()
        textInput.canBecomeFirstResponder()
        let frame: CGRect = nameInput.frame
        var offset: CGFloat = frame.origin.y+32-(self.view.frame.size.height-263)
        let animationDuration : NSTimeInterval = 0.30
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(animationDuration) //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
        if(offset > 0) { self.view.frame = CGRectMake(0.0, -offset, self.view.frame.size.width, self.view.frame.size.height) }
        UIView.commitAnimations()
    }
    func textFieldDidEndEditing( nameInput: UITextField) {
        self.view.frame = CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height)
    }

    func text_clean(){
        textInput.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

