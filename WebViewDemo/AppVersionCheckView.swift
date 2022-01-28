//
//  AppVersionCheckView.swift
//  WebViewDemo
//
//  Created by Clip-1152 on 2022/01/28.
//

import SwiftUI

struct AppVersionCheckView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var presentAlert = true
    
    func latestVersion() -> String? {
            //나중에 ID 변경
            let appleID = "1548711244"
            guard let url = URL(string: "http://itunes.apple.com/lookup?id=\(appleID)"),
                  let data = try? Data(contentsOf: url),
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                  let results = json["results"] as? [[String: Any]],
                  let appStoreVersion = results[0]["version"] as? String else {
                return nil
            }
            return appStoreVersion
        }
    
    
    var body: some View {
        
        //App Local Version
        let dictionary = Bundle.main.infoDictionary!
        let appVersion = dictionary["CFBundleShortVersionString"] as! String
        let BuildNumber = dictionary["CFBundleVersion"] as! String
        
        //App Store Version
        let lastVersion = latestVersion() as! String
        
        //App Version Check
        let compareResult = appVersion.compare(lastVersion, options: .numeric)
        
        VStack {
            
            Text(lastVersion)
            Text(appVersion)
            Text(BuildNumber)
            
            switch compareResult {
                //App Store Version 이 클 경우
                //App Store Move 는 테스트 불가 , 리얼 테스트만 가능
                case .orderedAscending:
                    Text("App Store Move")
                //App Store Version 이 작을 경우
                case .orderedDescending:
                    Text("Main Page Move")
                case .orderedSame:
                    Text("Main Page Move")
            }
            /*
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
            */
            
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
            
        }
        
    }
}

struct AppVersionCheckView_Previews: PreviewProvider {
    static var previews: some View {
        AppVersionCheckView()
    }
}
