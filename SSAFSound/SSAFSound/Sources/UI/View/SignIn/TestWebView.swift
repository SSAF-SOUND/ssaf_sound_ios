import SwiftUI
import WebKit

struct TestWebView: View {
    
    @State var showWebView = false
    @State var socialSigninURL: String
    @AppStorage("authCode") var authCode: String = ""
    
    public init(socialSigninURL: String) {
        authCode = UserDefaults.standard.string(forKey: "authCode") ?? ""
        // 예시 코드
//            isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        self.socialSigninURL = socialSigninURL
        }
    
    var body: some View {
        Button {
            showWebView.toggle()
        } label: {
            Text("Open WebView")
        }
        .fullScreenCover(isPresented: $showWebView){
            WebView(url: socialSigninURL, showWebView: $showWebView, authCode: $authCode)
        }
        .onAppear() {
            print("authCode : \(authCode)")
        }
    }
}

struct WebView: UIViewRepresentable {
 
    var url: String
    @Binding var showWebView: Bool
    @Binding var authCode: String
 
//    func makeUIView(context: Context) -> WKWebView {
//        let wKWebView = WKWebView()
//        wKWebView.navigationDelegate = context.coordinator
//        return wKWebView
//    }
    
    public func makeUIView(context: Context) -> WKWebView {
            guard let url = URL(string: self.url) else {
                return WKWebView()
            }

            //웹뷰 인스턴스 생성
            let configuration = WKWebViewConfiguration()
            let websiteDataStore = WKWebsiteDataStore.default()
            let webView = WKWebView(frame: .zero, configuration: configuration)
            webView.scrollView.showsVerticalScrollIndicator = false

            //웹뷰를 로드한다
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
                let configuration = webView.configuration
                if let cookie = HTTPCookie(properties: [.domain: url.host!,
                                                        .path: "/",
                                                        .name: "CookieName",
                                                        .value: "CookieValue"]) {
                    configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                }
                // Set power-saving preferences
                configuration.preferences.minimumFontSize = 16
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    webView.load(request)
                }
            }
            print("(webView)")
            return webView
        }

    
 
    func updateUIView(_ webView: WKWebView, context: Context) {
//        let request = URLRequest(url: URL(string: url)!)
//        webView.load(request)
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }
    
    class WebViewCoordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            let urlString = navigationAction.request.url?.absoluteString ?? ""
                decisionHandler(.allow)
            
            if urlString.contains("https://test.ssafsound.com/auth/callback/") {
                if urlString.contains("code") {
                    print("url = \(urlString)")
                    let components = URLComponents(string: urlString)
                    let items = components?.queryItems ?? []
                    for item in items {
                        print("\(item.name), \(item.value)")
//                        parent.authCode = item.value
                        if let code = item.value {
                            parent.authCode = code
                            print("code : \(code)")
                        } else {
                            print("no code")
                        }
                    }
                    parent.showWebView = false
                }
            }
        }
    }
}

struct TestWebView_Previews: PreviewProvider {
    static var previews: some View {
        TestWebView(socialSigninURL: "https://api.ssafsound.com/auth/kakao")
    }
}
