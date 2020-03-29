import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    var flutter_native_splash = 1
    UIApplication.shared.isStatusBarHidden = false

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)

    [GMSServices provideAPIKey:@"AIzaSyA-YHbrNocZS-NnYkLudVUrXeVYuoMl5CQ"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
  }
}