//
//  ViewController.swift
//  firebase_test
//
//  Created by rubl333 on 2016/4/4.
//  Copyright (c) 2016年 appcoda. All rights reserved.
//

import UIKit
import Firebase



class ViewController: UIViewController {
    // Create a reference to a Firebase location
    var myRootRef = Firebase(url:"https://chatroom-ios-test.firebaseio.com")
    
    
    
    @IBOutlet weak var outPut: UITextView!
    @IBOutlet weak var nameInput: UITextField!

    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func button(sender: AnyObject) {
        // Read data and react to changes
        
        let usersRef = myRootRef.childByAutoId()
        
       
        
        usersRef.childByAppendingPath("name").setValue(nameInput.text)
        usersRef.childByAppendingPath("text").setValue(textInput.text)
        

        
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
            

        })
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Write data to Firebase

        
        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            println(snapshot.value.objectForKey("name"))
            println(snapshot.value.objectForKey("text"))
            
            var x: String! = snapshot.value.objectForKey("name") as! String
            var y: String! = snapshot.value.objectForKey("text") as! String
            
            self.outPut.text = self.outPut.text + "\(x)" + " : " + "\(y)" + "\n"
            
            
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

