//
//  ViewController.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 14/10/2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var viewModel : JokesViewModel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup(){
        let apiClient = JokesClient()
        self.viewModel = JokesViewModel(with: [], apiClient: apiClient)
        self.fetchJokes()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func fetchResults(_ sender: Any) {
        self.fetchJokes()
    }
    
    func fetchJokes(){
        viewModel.updateJokes { [weak self] in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                print("callback.")
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func alertJokesSwitch(_ sender: Any) {
        
        let alert = UIAlertController(title: viewModel.alertTitle,
                                      message: viewModel.alertMessage,
                                      preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let changeAction = UIAlertAction(title: viewModel.confirmActionTitle, style: .default) { [weak self] _  in
            
            guard let self = self else { return }
            
            self.viewModel.explictJokesState.flip()
            self.viewModel.clear()
            self.fetchJokes()
        }
        alert.addAction(changeAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfObjects(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView.called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.titleForObject(at: indexPath)
        return cell
        
    }


}
