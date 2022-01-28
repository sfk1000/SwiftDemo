//
//  ContentView.swift
//  WebViewDemo
//
//  Created by Clip-1152 on 2022/01/20.
//  Start 2022

import SwiftUI


struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    
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
            Text("App Version Check").alert(isPresented: $presentAlert, content: {
                    
                    Alert(
                        title: Text("필수 업데이트 안내"),
                        message: Text("앱데아트를 하셔야 정상적으로 이용이 가능합니다."),
                        dismissButton: .default(Text("OK"), action: {
                            // APP Page go
                            // later Stop
                            print("APP Page go")
                        })
                    )
                }
            )
            
            /*
            Text("App Version Check 2").alert(isPresented: $presentAlert, content: {
                    
                    Alert(
                        title: Text("선택적 업데이트 안내"),
                        message: Text("앱데아트를 하셔야 정상적으로 이용이 가능합니다."),
                        primaryButton: Alert.Button.default(
                            Text("UPDATE"), action: {
                                // APP Page go
                                // later Stop
                                print("Yes")
                            }
                        ),
                        secondaryButton: Alert.Button.cancel(
                            Text("Next.."), action: {
                                print("No")
                            }
                        )
                    )
                }
            )
            */
            
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
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
