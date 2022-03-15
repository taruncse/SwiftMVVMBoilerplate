//
//  HomeViewController.swift
//  SwiftMVVMBoilerplate
//
//  Created by Tarun on 14/3/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var homeTableView: UITableView!
    
    private var homeListViewModel = HomeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTableView()
        self.observeEvents()
    }
    
    private func configureTableView(){
        HomeUserCell.registerWithTable(self.homeTableView)
    }
    
    private func observeEvents(){
        self.homeListViewModel.reloadTable = { [weak self] in
            DispatchQueue.main.async {
                self?.homeTableView.reloadData()
            }
        }
    }
    
//    private func cellForHomeUser(indexPath: IndexPath, viewModel: PaginationCellVM)->PaginationCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: PaginationCell.reuseIdentifier, for: indexPath) as! PaginationCell
//        cell.selectionStyle = .none
//        cell.prepareCell(viewModel: viewModel)
//        return cell
//    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // return cellForHomeUser(indexPath: indexPath, viewModel: model)
        
        let homeViewModel = self.homeListViewModel.peopleAtIndex(indexPath.row)

        
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeUserCell.reuseIdentifier, for: indexPath) as? HomeUserCell else {
            fatalError("ArticleTableViewCell not found")
        }
        cell.selectionStyle = .none
        cell.prepareCell(homeViewModel: homeViewModel)
        return cell
    }
    
}

