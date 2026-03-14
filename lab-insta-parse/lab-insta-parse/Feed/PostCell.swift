//
//  PostCell.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/3/22.
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//  Email: alfredn.lima210@gmail.com
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    func configure(with post: Post) {
        // TODO: Pt 1 - Configure Post Cell
        if let user = post.user {
            usernameLabel.text = user.username
        }
        
        // Use AlamofireImage extension which handles caching, downloading, and cell reuse seamlessly to prevent flickering
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            postImageView.af.setImage(withURL: imageUrl)
        } else {
            postImageView.image = nil
        }

        captionLabel.text = post.caption
        
        if let date = post.createdAt {
            dateLabel.text = DateFormatter.postFormatter.string(from: date)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // TODO: P1 - Cancel image download
        postImageView.af.cancelImageRequest()
        postImageView.image = nil
    }
}
