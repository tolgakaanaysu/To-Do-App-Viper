//
//  UpdateVC.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import UIKit

class UpdateVC: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    
    var note: Note?
    var updatePresenter: ViewToPresenterUpdateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        UpdateRouter.createModule(ref: self)
        
        addTextFieldConfigure()
        if let note  = note {
            titleTextField.text = note.note_title
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let text =  titleTextField.text, let note = note {
            updatePresenter?.update(note_id: note.note_id!, note_title: text)
        }
    }
    
    func addTextFieldConfigure(){
        titleTextField.textColor = .white
        titleTextField.backgroundColor = .black
        titleTextField.tintColor = .white
        titleTextField.clearButtonMode = .always
        titleTextField.layer.cornerRadius = 3.0
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = UIColor.white.cgColor
        titleTextField.layer.masksToBounds = true
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Update Note",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
    }
}
