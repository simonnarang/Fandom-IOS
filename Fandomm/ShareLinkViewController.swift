//
//  ShareLinkViewController.swift
//  Fandomm
//
//  Created by Simon Narang on 11/29/15.
//  Copyright © 2015 Simon Narang. All rights reserved.
//

import UIKit

class ShareLinkViewController: UIViewController {
    
    //vars
    var shareLinkk = String()
    var fandommcount = 0
    var usernameThreeTextOne = String()
    var userFandoms = [AnyObject]()
    
    //IBOUTLETS
    @IBOutlet weak var shareLink: UITextField!
    
    //after text is typed in... share it!
    func next() -> Void {
        if self.shareLink.text != "" && self.shareLink.text != " " {
            
            //make user inputted text the text to share
            self.shareLinkk = self.shareLink.text!
            print("Text to be shared typed in by user @\(self.usernameThreeTextOne)")
            performSegueWithIdentifier("segueThree", sender: nil)
            
            
        }else{
        
            print("user didnt type anything in for sharing text")
            
        }
    }
    
    @IBAction func shareLinkButton(sender: AnyObject) {
        
        self.next()
    
    }
    
    //startup junk
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap screen to close keyboard in case it doesnt close some other way
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShareLinkViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        fandommcount = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueThree" {
            
            let destViewContOne: ShareToFandomNavigationViewController = segue.destinationViewController as! ShareToFandomNavigationViewController
            destViewContOne.usernameThreeTextOne = self.usernameThreeTextOne
            destViewContOne.shareLinky = self.shareLinkk
            destViewContOne.userFandoms = self.userFandoms
            
        }else {
            
            print("there is an undocumented segue form the sharelink tab")
            
        }
        
    }
    
    //dissmiss keyboard on tap
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    //perform  posting with return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.next()
        return false
        
    }
}
