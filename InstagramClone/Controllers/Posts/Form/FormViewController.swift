//
//  FormViewController.swift
//  InstagramClone
//
//  Created by Juanse  on 22/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? PostViewController else {
            return
        }
        
        destinationVC.username = self.usernameTextField.text ?? ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
