//
//  MostPopularArticlesVC.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import UIKit

class MostPopularArticlesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var datasource: [MostPopularArticleModel] = []
    var selectedArticle:MostPopularArticleModel?
    let detailsSegueId = "showMostPopularArticleDetails"
    
    var viewModel: MostPopularArticleVM = MostPopularArticleVM(articles: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSettings()
            
        viewModel.refreshUI = {[weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func tableViewSettings() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerNib(MostPopularArticleCell.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailsSegueId {
            let detailsVC = segue.destination as! MostPopularArticlesDetailVC
            detailsVC.detailItem = selectedArticle
        }
    }
}


extension MostPopularArticlesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MostPopularArticleCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(model: viewModel.articleForIndex(index: indexPath.row))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = viewModel.articleForIndex(index: indexPath.row)
        performSegue(withIdentifier: detailsSegueId, sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
