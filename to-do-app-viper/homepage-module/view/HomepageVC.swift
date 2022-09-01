//
//  ViewController.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import UIKit

class HomepageVC: UIViewController {
    
    //MARK: - Property
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var notesTableView: UITableView!
    var homepagePresenter: ViewToPresenterHomepageProtocol?
    var notesList: [Note] = [] {
        didSet {
            notesList.reverse()
            notesTableView.reloadData()
        }
    }
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        notesTableView.delegate = self
        notesTableView.dataSource = self
        searchBar.delegate = self
        searchBarConfig()
        HomepageRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenter?.getAllNote()

        
    }
    
    @IBAction func addNoteButton(_ sender: Any) {
        performSegue(withIdentifier: "toCreateVC", sender: nil)
    }
}

//MARK: - TableView
extension HomepageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomepageCell
        cell.titleLbl.text = note.note_title
        cell.titleLbl.textColor = .white
        cell.dateLbl.text =  note.note_date
        cell.dateLbl.textColor = .white
        cell.backgroundColor = .black
        cell.cellViewBackground.backgroundColor = .systemGray
        cell.cellViewBackground.layer.cornerRadius = 15.0
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notesList[indexPath.row]
        performSegue(withIdentifier: "toUpdateVC", sender: note)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let note = notesList[indexPath.row]
        let delete = UIContextualAction(style: .destructive,
                                        title: "Delete") { contextualAction, view, bool in
            let alert = UIAlertController(title: "Delete Process",
                                          message: "Are you sure, this note will delete",
                                          preferredStyle: .alert)
            let deleteButton = UIAlertAction(title: "Delete",
                                             style: .destructive) { _ in
                self.homepagePresenter?.deleteNote(note_id: note.note_id!)
            }
            alert.addAction(deleteButton)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelButton)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

//MARK: - Prepare for segue
extension HomepageVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateVC" {
            
        }
        else if segue.identifier == "toUpdateVC" {
            if let note = sender as? Note {
                let updateVC = segue.destination as! UpdateVC
                updateVC.note = note
            }
        }
    }
}

//MARK: - SearchBar
extension HomepageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            homepagePresenter?.getAllNote()
            return
        }
        homepagePresenter?.searchNote(searchText: searchText)
    }
    
    func searchBarConfig(){
        searchBar.barTintColor = .black
        searchBar.placeholder = "Search Note"
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tokenBackgroundColor = .white
        
    }
}

//MARK: - PresenterToViewHomepageProtocol
extension HomepageVC: PresenterToViewHomepageProtocol {
    func sendDataToView(noteList: Array<Note>) {
        self.notesList = noteList
    }
}

