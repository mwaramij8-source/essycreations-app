import UIKit
import Capacitor
import WebKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = EssyBridgeViewController()
        window?.makeKeyAndVisible()

        SceneDelegateProxy.shared.scene(scene, willConnectTo: session, options: connectionOptions)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        SceneDelegateProxy.shared.scene(scene, openURLContexts: URLContexts)
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        SceneDelegateProxy.shared.scene(scene, continue: userActivity)
    }
}

/// Capacitor view controller that adds the "Admin Login" button to every page of essycreations.co.tz
class EssyBridgeViewController: CAPBridgeViewController {
    override func webViewConfiguration(for instanceConfiguration: InstanceConfiguration) -> WKWebViewConfiguration {
        let config = super.webViewConfiguration(for: instanceConfiguration)
        let source = """
        (function(){
          if (location.hostname.indexOf('essycreations.co.tz') === -1) return;
          if (document.getElementById('essy-admin-btn')) return;
        var s=document.createElement('style');s.textContent='.essy-download-app{display:none!important}';(document.head||document.documentElement).appendChild(s);
          if (/^\\/(login|admin|dashboard)/i.test(location.pathname)) return;
          var b = document.createElement('a');
          b.id = 'essy-admin-btn';
          b.href = 'https://essycreations.co.tz/login';
          b.textContent = '\u{1F512} Admin Login';
          b.setAttribute('style', 'position:fixed;right:16px;bottom:calc(20px + env(safe-area-inset-bottom));z-index:2147483647;background:#D4AF37;color:#111;font:700 14px Lato,Arial,sans-serif;padding:12px 18px;border-radius:999px;text-decoration:none;box-shadow:0 6px 18px rgba(0,0,0,.45)');
          (document.body || document.documentElement).appendChild(b);
        })();
        """
        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        config.userContentController.addUserScript(script)
        return config
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView?.allowsBackForwardNavigationGestures = true   // swipe back like Safari
    }
}
