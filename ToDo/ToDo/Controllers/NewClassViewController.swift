//
//  NewClassViewController.swift
//  ToDo
//
//  Created by Emre Cakir on 6/9/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import UIKit

class NewClassViewController: UIViewController {
    @IBOutlet weak var className: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newClassButtonPressed(_ sender: Any) {
        guard let classNameText = className.text else { return }
        
        let randomNum = Int(arc4random_uniform(UInt32(Constants.Colors.colorsArr.count)))
        let classSchool = ClassSchool(id: dataReciever.randomId(), name: classNameText, color: Constants.Colors.colorsArr[randomNum], assignments: [])
        dataReciever.addClassSchool(classSchool: classSchool)
        
        self.navigationController?.popViewController(animated: true)
        print(self.navigationController?.viewControllers )
    }
}
