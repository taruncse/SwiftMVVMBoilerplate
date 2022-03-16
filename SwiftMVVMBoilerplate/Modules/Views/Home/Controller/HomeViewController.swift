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
        ActivityIndicator.shared.showIndicator(onView: self.view)
        HomeUserCell.registerWithTable(self.homeTableView)
    }
    
    private func observeEvents(){
        self.homeListViewModel.tableDataSource.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.homeTableView.reloadData()
                if self?.homeListViewModel.shouldHideProgress == true {
                    ActivityIndicator.shared.dismissIndicator()
                    self?.homeListViewModel.shouldHideProgress = false
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeViewModel = self.homeListViewModel.peopleAtIndex(indexPath.row)
        
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeUserCell.reuseIdentifier, for: indexPath) as? HomeUserCell else {
            fatalError("ArticleTableViewCell not found")
        }
        cell.selectionStyle = .none
        cell.prepareCell(homeViewModel: homeViewModel)
        return cell
    }
    
}

