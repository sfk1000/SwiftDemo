//
//  ContentView.swift
//  WebViewDemo
//
//  Created by Clip-1152 on 2022/01/20.
//  Start 2022

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

struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    //Build Number (Currebt Project Version)
    func currentBuildNumber() -> String {
      if let info: [String: Any] = Bundle.main.infoDictionary,
          let buildNumber: String
            = info["CFBundleVersion"] as? String {
            return buildNumber
      }
      return "nil"
    }
    
    //App Version (Marketing Version)
    func currentAppVersion() -> String {
      if let info: [String: Any] = Bundle.main.infoDictionary,
          let currentVersion: String
            = info["CFBundleShortVersionString"] as? String {
            return currentVersion
      }
      return "nil"
    }
    
    @State private var presentAlert = true
    
    
    //apple ID
    var body: some View {
        
        let targetBuildVersion = currentBuildNumber()
        let targetAppVersion = currentAppVersion()
        
        
        let oldVersion = "0.11.2"
        let lastVersion = "0.12.1"
        
        let compareResult = oldVersion.compare(lastVersion, options: .numeric)
        
        
        
        VStack {
            Text(presentAlert ? "True 2" : "False 2").alert(isPresented: $presentAlert, content: {
                    
                    Alert(
                        title: Text("선택적 업데이트 안내"),
                        message: Text("앱 변경 사항이 있습니다."),
                        primaryButton: .destructive(Text("업데이트")) {
                            print("앱 업데이트로 이동...")
                        },
                        secondaryButton: .cancel()
                    )
                }
            )
            
            Text(targetBuildVersion)
            Text(targetAppVersion)
            
            switch compareResult {
                //lastVersion 이 클 경우
                case .orderedAscending:
                    Text("T1")
                //lastVersion 이 작을 경우
                case .orderedDescending:
                    Text("T2")
                case .orderedSame:
                    Text("T3")
            }
            
        }
        
        
        /*
        let urlString = "https://www.naver.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebView(request: urlReq)
        }
        else{
                Text("Try Again")
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
