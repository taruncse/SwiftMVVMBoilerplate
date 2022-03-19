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

        self.homeTableView.backgroundColor = .green
        self.configuration()
        self.observeEvents()
    }
    
    private func configuration(){
        self.title = homeListViewModel.title
        ActivityIndicator.shared.showIndicator(onView: self.view)
        HomeUserCell.registerWithTableViewXib(self.homeTableView)
    }
    
    private func observeEvents(){
        self.homeListViewModel.dataList.bind { [weak self] _ in
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
        
        let homeViewModel = self.homeListViewModel.valueAtIndex(indexPath.row)
        
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeUserCell.reuseIdentifier, for: indexPath) as? HomeUserCell else {
            fatalError("ArticleTableViewCell not found")
        }
        cell.selectionStyle = .none
        cell.prepareCell(homeViewModel: homeViewModel)
        return cell
    }
    
}

