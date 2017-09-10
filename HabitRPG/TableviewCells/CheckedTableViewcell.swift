//
//  HRPGCheckedTableViewcell.swift
//  Habitica
//
//  Created by Phillip Thelen on 09/03/2017.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

import UIKit
import Down

class CheckedTableViewCell: TaskTableViewCell {

    @IBOutlet weak var checkBox: HRPGCheckBoxView!
    @IBOutlet weak var checklistIndicator: UIView!
    @IBOutlet weak var checklistDoneLabel: UILabel!
    @IBOutlet weak var checklistAllLabel: UILabel!
    @IBOutlet weak var checklistSeparator: UIView!
    @IBOutlet weak var checklistIndicatorWidth: NSLayoutConstraint!
    @IBOutlet weak var checklistContainer: UIStackView!
    @IBOutlet weak var checklistLeftBorderView: UIView!
    @IBOutlet weak var checklistRightBorderView: UIView!
    
    weak var task: Task?
    var isExpanded = false
    var checklistItemTouched: ((_ item: ChecklistItem) -> Void)?

    override func configure(task: Task) {
        self.task = task
        super.configure(task: task)
        self.checkBox.configure(for: task)
        
        handleChecklist(task)

        if task.completed {
            self.checklistIndicator.backgroundColor = .gray500()
            self.titleLabel.textColor = .gray300()
            self.backgroundColor = .gray600()
        } else {
            self.backgroundColor = .white
            self.titleLabel.textColor = .gray10()
        }

        self.titleLabel.backgroundColor = self.backgroundColor
        self.subtitleLabel.backgroundColor = self.backgroundColor

        self.checklistIndicator.layoutIfNeeded()
    }
    
    func handleChecklist(_ task: Task) {
        self.checklistIndicator.backgroundColor = task.lightTaskColor()
        self.checklistLeftBorderView.backgroundColor = task.taskColor()
        self.checklistRightBorderView.backgroundColor = task.taskColor()
        self.checklistIndicator.isHidden = false
        self.checklistIndicator.translatesAutoresizingMaskIntoConstraints = false
        //let checklistCount = task.checklist?.count ?? 0
        let checklistCount = 0
        
        if checklistCount > 0 {
            var checkedCount = 0
            /*if let checklist = task.checklist?.array as? [ChecklistItem] {
                for item in checklist where item.completed.boolValue {
                    checkedCount += 1
                }
            }*/
            self.checklistDoneLabel.text = "\(checkedCount)"
            self.checklistAllLabel.text = "\(checklistCount)"
            self.checklistDoneLabel.textColor = .white
            self.checklistAllLabel.textColor = .white
            self.checklistSeparator.backgroundColor = .white
            if checkedCount == checklistCount {
                self.checklistIndicator.backgroundColor = .gray500()
                self.checklistDoneLabel.textColor = .gray300()
                self.checklistAllLabel.textColor = .gray300()
                self.checklistSeparator.backgroundColor = .gray300()
                self.checklistLeftBorderView.backgroundColor = .gray400()
                self.checklistRightBorderView.backgroundColor = .gray400()
            }
            self.checklistDoneLabel.isHidden = false
            self.checklistAllLabel.isHidden = false
            self.checklistSeparator.isHidden = false
            self.checklistIndicatorWidth.constant = 32.0
        } else {
            self.checklistDoneLabel.isHidden = true
            self.checklistAllLabel.isHidden = true
            self.checklistSeparator.isHidden = true
            self.checklistIndicatorWidth.constant = 0
        }
        
        checklistContainer.arrangedSubviews.forEach { (view) in
            view.removeFromSuperview()
        }
        if isExpanded {
            /*if let checklist = task.checklist?.array as? [ChecklistItem] {
                for item in checklist {
                    let checkbox = HRPGCheckBoxView()
                    checkbox.configure(for: item, withTitle: true)
                    checklistContainer.addArrangedSubview(checkbox)
                    checkbox.wasTouched = {[weak self] in
                        if let action = self?.checklistItemTouched {
                            action(item)
                        }
                    }
                }
            }*/
        }
    }
}
