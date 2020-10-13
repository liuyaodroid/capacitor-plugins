import Foundation
import Capacitor

@objc(AppPlugin)
public class AppPlugin: CAPPlugin {

    override public func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUrlOpened(notification:)), name: Notification.Name(CAPNotifications.URLOpen.name()), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUniversalLink(notification:)), name: Notification.Name(CAPNotifications.UniversalLinkOpen.name()), object: nil)
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: OperationQueue.main) { [weak self] (_) in
            self?.notifyListeners("appStateChange", data: [
                "isActive": true
            ])
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: OperationQueue.main) { [weak self] (_) in
            self?.notifyListeners("appStateChange", data: [
                "isActive": false
            ])
        }

    }

    @objc func handleUrlOpened(notification: NSNotification) {
        guard let object = notification.object as? [String: Any?] else {
            return
        }

        notifyListeners("appUrlOpen", data: makeUrlOpenObject(object), retainUntilConsumed: true)
    }

    @objc func handleUniversalLink(notification: NSNotification) {
        guard let object = notification.object as? [String: Any?] else {
            return
        }

        notifyListeners("appUrlOpen", data: makeUrlOpenObject(object), retainUntilConsumed: true)
    }

    func makeUrlOpenObject(_ object: [String: Any?]) -> JSObject {
        guard let url = object["url"] as? NSURL else {
            return [:]
        }

        let options = object["options"] as? [String: Any?] ?? [:]
        return [
            "url": url.absoluteString ?? "",
            "iosSourceApplication": options[UIApplication.OpenURLOptionsKey.sourceApplication.rawValue] as? String ?? "",
            "iosOpenInPlace": options[UIApplication.OpenURLOptionsKey.openInPlace.rawValue] as? String ?? ""
        ]
    }

    @objc func exitApp(_ call: CAPPluginCall) {
        call.unimplemented()
    }

    @objc func getInfo(_ call: CAPPluginCall) {
        if let info = Bundle.main.infoDictionary {
            call.resolve([
                "name": info["CFBundleDisplayName"] as? String ?? "",
                "id": info["CFBundleIdentifier"] as? String ?? "",
                "build": info["CFBundleVersion"] as? String ?? "",
                "version": info["CFBundleShortVersionString"] as? String ?? ""
            ])
        } else {
            call.reject("Unable to get App Info")
        }

    }

    @objc func getLaunchUrl(_ call: CAPPluginCall) {
        if let lastUrl = CAPBridge.getLastUrl() {
            let urlValue = lastUrl.absoluteString
            call.resolve([
                "url": urlValue
            ])
        }
        call.resolve()
    }

    @objc func getState(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            call.resolve([
                "isActive": UIApplication.shared.applicationState == UIApplication.State.active
            ])
        }
    }
}
