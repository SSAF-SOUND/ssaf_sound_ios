//
//  TestWebView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/24.
//
import SwiftUI
import WebKit

struct TestWebView: View {
    
    @State var showWebView = false
    @State var socialSigninURL: String
    
    var body: some View {
        Button {
            showWebView.toggle()
        } label: {
            Text("Open WebView")
        }
        .fullScreenCover(isPresented: $showWebView){
            WebView(url: URL(string: socialSigninURL)!, showWebView: $showWebView)
        }
    }
}

struct WebView: UIViewRepresentable {
 
    var url: URL
    @Binding var showWebView: Bool
 
    func makeUIView(context: Context) -> WKWebView {
        let wKWebView = WKWebView()
        wKWebView.navigationDelegate = context.coordinator
        return wKWebView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
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
//            let urlToMatch = "https://workshop.appcoda.com/"

            let urlString = navigationAction.request.url?.absoluteString ?? ""
                decisionHandler(.allow)
            print("url = \(urlString)")
            
        
        }
        
    }
}

struct TestWebView_Previews: PreviewProvider {
    static var previews: some View {
        TestWebView(socialSigninURL: "https://api.ssafsound.com/auth/github")
    }
}
