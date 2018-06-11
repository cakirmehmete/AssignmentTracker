//
//  AddAssignmnetViewController.swift
//  ToDo
//
//  Created by Emre Cakir on 6/9/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import UIKit

class AddAssignmnetViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var classPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addAssignmentButtonPressed(_ sender: Any) {
    }
}
