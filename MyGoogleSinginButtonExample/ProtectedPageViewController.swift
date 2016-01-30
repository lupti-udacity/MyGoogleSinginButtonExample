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
        /*
        let signInPageNav = UINavigationController(rootViewController: signInPage)
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = signInPageNav
        */
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
