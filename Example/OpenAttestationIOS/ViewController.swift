//
//  ViewController.swift
//  OpenAttestationIOS
//
//  Created by Tan Cher Shen on 12/23/2022.
//  Copyright (c) 2022 Tan Cher Shen. All rights reserved.
//

import UIKit
import OpenAttestationIOS

class ViewController: UIViewController {
    let oa = OpenAttestation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyTap(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "national-youth-council_obs-moc", ofType: "oa") else {
            print("oa file not found")
            return
        }
        
        guard let oaDocument = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            print("oa file cannot be loaded")
            return
        }
        
        oa.verifyDocument(view: self.view, oaDocument: oaDocument) { isValid in
            let title = isValid ? "Verification successful" : "Verification failed"
            let message = isValid ? "This document is valid" : "This document has been tampered with"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

