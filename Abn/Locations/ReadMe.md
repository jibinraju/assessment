# About this application
This is a coding assessment, application's main functionality to show few predefined locations in a table view and allow user to enter location name in a text box and application predict the location names with the help of google map API's, if user tap on any location then application will invoke the Wikipedia application and navigation to the places screen and show that location in map.

# Development Environment
    Xcode - 9.3
    iOS SDK - 11.3
    Language - swift (4.1)
    Deployment Target - 10.0 and later
    
# ThirdParty Libraries/Frameworks
    Google Places
    Google MapBase (for license details: https://developers.google.com/maps/terms#top_of_page )

#  Design Approches
* MVVM pattern
* Tired to stick on S.O.L.I.D principles

# Application Functionality
The application shows the predefined list places in a table view and it has an option to search places decided by the user.  While user entering the place in the text field, the application has auto-completion capability,  that functionality achieved with the help of Google Maps Service framework. If the user taps on the place in the table view, it will compose a Wikipedia deep link URL with that place and coordinates and try to open the Wikipedia application's place tab. Wikipedia application should be in your simulator/device otherwise there is no effect on tapping the location. 

For achieving this functionality in Wikipedia application, I have tweaked the source code, because as per the current implementation, it is looking for an article on local persistence (if data is already cached in local persistence then it will show the information on map) now it's taking extra data like coordinates along with place name and show it on map and parallel it will trigger Wikipedia place web service call and retrieve that location information as well.

Below files, I have modified in Wikipedia project and commented on the major modifications.
* Wikipedia/Code/NSUserActivity+WMFExtensions.m
* Wikipedia/Code/PlacesViewController.swift

# Testing Enviroment
This application not developed in Test Driven Development but I have few unit test case I didn't write more because I would not use any unit test framework for mocking (Quick/Nimble). The application is only tested on iOS simulator (iPhone 8/8+). 


