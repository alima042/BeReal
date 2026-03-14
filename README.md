# Project 2 - BeReal Clone PT 1

Submitted by: **Alfredo Lima**

**BeReal Clone PT 1** is an app that allows users to post photos of what they're currently doing, featuring full user authentication and photo uploading using Parse backend.

Time spent: **3** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] Users see an app icon in the home screen and a styled launch screen.
- [x] User can register a new account
- [x] User can log in with newly created account
- [x] App has a feed of posts when user logs in
- [x] User can upload a new post which takes in a picture from photo library and an optional caption    
- [x] User is able to logout    
 
The following **optional** features are implemented:

- [x] Users can pull to refresh their feed and see a loading indicator
- [x] Users can infinite-scroll in their feed to see past the 10 most recent photos
- [ ] Users can see location and time of photo upload in the feed   
- [x] User stays logged in when app is closed and open again    

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://submissions.us-east-1.linodeobjects.com/ios102_swiftUI/QrNGpkDR.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


## Notes

Used ParseSwift SDK to manage authentication (Signup, Login, Logout) and to fetch/upload Posts safely to the Back4App database backend. Handled image resizing and Data conversion using Alamofire and AlamofireImage.

## License

    Copyright [2026] [Alfredo Lima]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
