# Unit 2 Lab: Instaparse Foundation

**Student Name:** Alfredo Lima
**Panther ID:** 5867669
**Section:** COP4655
**Semester:** Spring
**Email:** alfredn.lima210@gmail.com

---

## Overview

This repository contains the foundation code for **Instaparse** developed during Unit 2. It is an Instagram-like social media clone built natively for iOS using **Swift** and **UIKit**. 

The main objective of this unit was to integrate the **Parse Swift SDK** to establish a secure connection with a remote **Back4App Parse Server**, form the fundamental data structures, and handle user and media operations asynchronously.

## Features Implemented

* **Backend Integration Setup:** 
  * Configured `AppDelegate.swift` to securely initialize `ParseSwift` using the Application ID and Client Key provisioned from the Back4App workspace.
* **Persistent Sessions & Authentication:** 
  * Implemented `User.signup` and `User.login` Parse methods to safely cache login tokens.
  * Added `SceneDelegate` checks to automatically direct authenticated users to the Feed screen, bypassing the login sequence.
  * Successfully set up a Log Out mechanism that triggers the `User.logout` closure and resets the session safely.
* **Feed Representation:**
  * Displays a chronological list of posts from the remote Parse DB sorted descendingly by `createdAt`.
  * Customized `UITableView` data models fetching linked user names (`.include("user")`), post captions, and remote images via `AlamofireImage`.
* **Post Creation:**
  * Used `PHPickerViewController` for single-image selection from the user's photo library.
  * Encapsulated `UIImage` conversions into `ParseFile(name: data:)` allowing seamless, lightweight media uploads to the Parse Cloud.

## Models
* `User.swift`: Conforms to `ParseUser` to manage core credentials and custom properties linked to accounts.
* `Post.swift`: Conforms to `ParseObject` maintaining references to text (`caption`), binary images (`imageFile`), and the authoring User object (`user`).

## Setup & Running Instructions

1. **Open the Project:**
   Navigate into the `lab_2` directory and open the `.xcodeproj` file.
2. **Swift Package Manager:**
   Xcode will automatically resolve the necessary dependencies (`Parse-Swift`, `Alamofire`, `AlamofireImage`). Ensure you have an active internet connection.
3. **Build and Run:**
   * Select a target simulator (e.g., iPhone 14 Pro).
   * Press `Cmd + R` or click the Play button to load the login screen. Note that login testing requires the Back4App database to remain active.

---
*Created for COP4655 - Unit 2 Advanced iOS Programming Module.*
