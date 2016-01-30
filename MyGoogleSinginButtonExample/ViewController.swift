//
//  ViewController.swift
//  MyGoogleSinginButtonExample
//
//  Created by Lupti on 1/25/16.
//  Copyright © 2016 lupti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

    }

    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        print("Google Sign in will dispatch")
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
        presentViewController viewController: UIViewController!) {
            self.presentViewController(viewController, animated: true, completion: nil)
            print("Sign in presented")
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
        dismissViewController viewController: UIViewController!) {
            self.dismissViewControllerAnimated(true, completion: nil)
            print("Sign in dismissed")
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Perform any operations on signed in user here.
                _ = user.userID                  // For client-side use only!
                _ = user.authentication.idToken // Safe to send to the server
                let name = user.profile.name
                _ = user.profile.email
                
                print("Did Sign in for user and user profile is \(name)")
                
                // [START_EXCLUDE]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification",
                    object: nil,
                    userInfo: ["statusText": "Signed in user:\n\(name)"])
                // [END_EXCLUDE]
                
                let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let protectedPage = myStoryBoard.instantiateViewControllerWithIdentifier("ProtectedPageViewController") as! ProtectedPageViewController
                    presentViewController(protectedPage, animated: true, completion: nil)
                /*
                let protectedPageNav = UINavigationController(rootViewController: protectedPage)
                
                self.window?.rootViewController = protectedPageNav
                
                */
                
            } else {
                print("\(error.localizedDescription)")
                // [START_EXCLUDE silent]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification", object: nil, userInfo: nil)
                // [END_EXCLUDE]
            }
    }

    
}

