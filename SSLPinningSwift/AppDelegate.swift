

import UIKit
import GoogleSignIn



@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate,  GIDSignInDelegate {



        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          GIDSignIn.sharedInstance().clientID = "892448913910-rrruf40offgklir32iava13os2pesn9u.apps.googleusercontent.com"
          GIDSignIn.sharedInstance().delegate = self

          return true
        }
        

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
        func application(_ application: UIApplication,
                         open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
          return GIDSignIn.sharedInstance().handle(url)
        }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                  withError error: Error!) {
          if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
              print("The user has not signed in before or they have since signed out.")
            } else {
              print("\(error.localizedDescription)")
            }
            return
          }
          // Perform any operations on signed in user here.
          let userId = user.userID                  // For client-side use only!
          let idToken = user.authentication.idToken // Safe to send to the server
          let fullName = user.profile.name
          let givenName = user.profile.givenName
          let familyName = user.profile.familyName
          let email = user.profile.email
          // ...
        }


}

