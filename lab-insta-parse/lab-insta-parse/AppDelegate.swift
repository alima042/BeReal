//
//  AppDelegate.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 10/29/22.
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//  Email: alfredn.lima210@gmail.com
//

import UIKit

import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // TODO: Pt 1 - Initialize Parse SDK
        ParseSwift.initialize(applicationId: "sUw5qoQcIUuRTKF0j55Xnj8inFzpYAbitdjg0lJ9",
                              clientKey: "INPdtqfZOZO9hG52aIYv2ZHG21rhJBXhK8xpZ4jD",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)

        // TODO: Pt 1: - Instantiate and save a test parse object to your server
        var score = GameScore()
        score.playerName = "Kingsley"
        score.points = 13
        score.save { result in
            switch result {
            case .success(let savedScore):
                print("✅ Parse Object SAVED! Player: \(String(describing: savedScore.playerName)), Score: \(String(describing: savedScore.points))")
            case .failure(let error):
                print("❌ Parse Object Save Failed (This is OK if class doesn't exist yet): \(error.localizedDescription)")
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

// TODO: Pt 1 - Create Test Parse Object
struct GameScore: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var playerName: String?
    var points: Int?
}
