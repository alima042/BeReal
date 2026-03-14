//
//  FeedViewController.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/1/22.
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//  Email: alfredn.lima210@gmail.com
//

import UIKit

import ParseSwift


class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Create a refresh control instance
    private let refreshControl = UIRefreshControl()
    
    // Pagination settings
    private var limit = 10
    private var isFetching = false

    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }

    @objc private func refreshFeed() {
        limit = 10 // Reset limit on manual refresh
        queryPosts()
    }

    private func queryPosts() {
        if isFetching { return }
        isFetching = true
        
        // TODO: Pt 1 - Query Posts
        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])
            .limit(limit)

        query.find { [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                self?.refreshControl.endRefreshing() // Stop the loading animation

                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure(let error):
                    self?.showAlert(description: error.localizedDescription)
                }
            }
        }
    }

    @IBAction func onLogOutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }

    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of your account?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Simple Infinite Scroll logic: when reaching the last cell, increase limit and query again
        if indexPath.row == posts.count - 1 && !isFetching {
            limit += 10
            queryPosts()
        }
    }
}
