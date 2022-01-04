import UIKit
import Flutter
import GoogleMaps
import Foundation


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let url = Bundle.main.object(forInfoDictionaryKey: "GOOGLE_MAP_KEY") as! String   

      GMSServices.provideAPIKey(url)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
