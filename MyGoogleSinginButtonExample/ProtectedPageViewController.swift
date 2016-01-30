//
//  ProtectedPageViewController.swift
//  MyGoogleSinginButtonExample
//
//  Created by Lupti on 1/27/16.
//  Copyright © 2016 lupti. All rights reserved.
//

import UIKit

class ProtectedPageViewController: UIViewController, GIDSignInUIDelegate{

    @IBAction func signOutButtonTapped(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        
        let signInPage = self.storyboard!.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        self.presentViewController(signInPage, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        GIDSignIn.sharedInstance().uiDelegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
