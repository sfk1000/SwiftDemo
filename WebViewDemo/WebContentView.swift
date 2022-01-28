//
//  WebContentView.swift
//  WebViewDemo
//
//  Created by Clip-1152 on 2022/01/28.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct WebContentView: View {
    
    @State private var image = UIImage()
    
    var body: some View {
        
        let urlString = "https://www.naver.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebView(request: urlReq)
        }
        else{
                Text("Try Again")
        }
        
    }
}

struct WebContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebContentView()
    }
}
