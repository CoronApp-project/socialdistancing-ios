//
//  NewsViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit

final class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var newsLoader: NewsLoader?
    var arrNews: ([News]) = []
    
    var dowloadedImages: [UIImage?] = []

    
    init(newsLoader: NewsLoader) {
        self.newsLoader = newsLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.newsLoader = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NewsCell.identifier)
        let nib2 = UINib.init(nibName: "HeaderCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.separatorStyle = .none
        loadNews()
    }
    
    private func loadNews() {
        newsLoader?.load { [weak self] results in
            guard self != nil else { return }
            
            switch results {
                
            case .success(let arrNews):
                self?.arrNews = arrNews
                self?.tableView.reloadData()
            case .failure(let error):
                debugPrint(error)
                self?.arrNews = []
            }
        }
    }
    
    //MARK: - Table View Delegate and DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrNews.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier) as? HeaderCell else {
            fatalError("You've forgotten to register the cell: HeaderCell")
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            fatalError("You've forgotten to register the cell: NewsCell")
        }
        
        if indexPath.section == 0 {
            headerCell.isUserInteractionEnabled = false
            return headerCell
        } else {
            cell.titleLabel.text = arrNews[indexPath.row].title
            cell.descriptionLabel.text = arrNews[indexPath.row].description
            cell.newsImageView.imageFromServerURL(arrNews[indexPath.row].photo, contentMode: .scaleToFill)
            
            return cell
        }
         

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = URL(string: arrNews[indexPath.row].web) else { return }
        UIApplication.shared.open(url)
   
    }
    
}
