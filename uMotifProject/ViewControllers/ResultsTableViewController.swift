//
//  ResultsTableViewController.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 15/10/2020.
//

import UIKit

enum Section : CaseIterable{
    case main
}

class ResultsTableViewController: UITableViewController {
    
    private let cellReuseIdentifier = "cell"
    private var jokes : [Joke] = []
    var dataSource : UITableViewDiffableDataSource<Section,Joke>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
    }

    func loadData(viewMode:JokesViewModel){
        print("viewModel=\(viewMode)")
        self.tableView.reloadData()
        self.setupTableView()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        dataSource = UITableViewDiffableDataSource
        <Section, Joke>(tableView: tableView) { [self]
            (tableView: UITableView, indexPath: IndexPath,
             joke: Joke) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
            cell.textLabel?.text = joke.joke
            return cell
        }
    }

}

extension ResultsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
