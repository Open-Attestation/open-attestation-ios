//
//  ViewController.swift
//  OpenAttestationIOS
//
//  Created by Tan Cher Shen on 12/23/2022.
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
    
    private func verifySelectedDocument(filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: "oa") else {
            print("oa file not found")
            return
        }
        
        guard let oaDocument = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            print("oa file cannot be loaded")
            return
        }
        
        oa.verifyDocument(oaDocument: oaDocument) { isValid in
            let title = isValid ? "Verification successful" : "Verification failed"
            let message = isValid ? "This document is valid" : "This document has been tampered with"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func verifyTap(_ sender: Any) {
        
        let alert = UIAlertController(title: "Select document", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "sample.oa", style: .default , handler:{ (UIAlertAction) in
            self.verifySelectedDocument(filename: "sample")
        }))
        
        alert.addAction(UIAlertAction(title: "sample-card.oa", style: .default , handler:{ (UIAlertAction) in
            self.verifySelectedDocument(filename: "sample-card")
        }))
        
        alert.addAction(UIAlertAction(title: "sample-a4.oa", style: .default , handler:{ (UIAlertAction) in
            self.verifySelectedDocument(filename: "sample-a4")
        }))
        
        alert.addAction(UIAlertAction(title: "tampered.oa", style: .default , handler:{ (UIAlertAction) in
            self.verifySelectedDocument(filename: "tampered")
        }))
        
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
    
    private func viewSelectedDocument(filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: "oa") else {
            print("oa file not found")
            return
        }
        
        guard let oaDocument = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            print("oa file cannot be loaded")
            return
        }
        
        let rendererVC = OaRendererViewController(oaDocument: oaDocument)
        rendererVC.title = "\(filename).oa"
        let navigationController = UINavigationController(rootViewController: rendererVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    @IBAction func viewDocumentTap(_ sender: Any) {
        let alert = UIAlertController(title: "Select document", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "sample.oa", style: .default , handler:{ (UIAlertAction) in
            self.viewSelectedDocument(filename: "sample")
        }))
        
        alert.addAction(UIAlertAction(title: "sample-card.oa", style: .default , handler:{ (UIAlertAction) in
            self.viewSelectedDocument(filename: "sample-card")
        }))
        
        alert.addAction(UIAlertAction(title: "sample-a4.oa", style: .default , handler:{ (UIAlertAction) in
            self.viewSelectedDocument(filename: "sample-a4")
        }))
        
        alert.addAction(UIAlertAction(title: "tampered.oa", style: .default , handler:{ (UIAlertAction) in
            self.viewSelectedDocument(filename: "tampered")
        }))
        
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
    
}

