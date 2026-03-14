//
//  Post.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/29/22.
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//  Email: alfredn.lima210@gmail.com
//

import Foundation

import ParseSwift


// TODO: Pt 1 - Create Post Parse Object model
struct Post: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var caption: String?
    var user: User?
    var imageFile: ParseFile?
}
