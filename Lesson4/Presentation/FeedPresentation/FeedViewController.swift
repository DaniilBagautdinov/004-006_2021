//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    var data: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 3*60*60)
        let formatteddate = formatter.string(from: time as Date)
        
        data = [Post(communityImage: UIImage(named: "1"), communityTitle: "Serv", publicationDate: formatteddate, article: "23231423142314231423142314231423142314231423142314231423142314231423142314231423142314231232314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314142323142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423141423231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231423142314231414423142314231423142314231423142314231423142314231423142314231423142314231423142314231414", postImage: UIImage(named: "image1"))]
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.estimatedRowHeight = 60
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
        cell.setData(post: data[indexPath.row])
        return cell
    }
    
    
}
