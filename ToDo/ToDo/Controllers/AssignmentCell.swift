//
//  AssignmentCellTableViewCell.swift
//  ToDo
//
//  Created by Emre Cakir on 6/8/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import UIKit

class AssignmentCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    // MARK: - Properties
    var assignment: Assignment? {
        didSet {
            guard let assignment = assignment else { return }
            
            titleLabel.text = assignment.title
            descriptionLabel.text = assignment.description
            classLabel.text = assignment.classSchool.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
