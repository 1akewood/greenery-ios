//
//  ContentView.swift
//  greenery-ios
//
//  Created by Heap on 2021/05/31.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

struct ContentView: View {
    var body: some View {
        
        Button(action : {
            //카카오톡이 깔려있는지 확인하는 함수
            if (UserApi.isKakaoTalkLoginAvailable()) {
                //카카오톡이 설치되어있다면 카카오톡을 통한 로그인 진행
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    print(oauthToken?.accessToken)
                    print(error)
                }
            }else{
                //카카오톡이 설치되어있지 않다면 사파리를 통한 로그인 진행
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    print(oauthToken?.accessToken)
                    print(error)
                }
            }
        }){
            
            Text("카카오 로그인")
        }
        //ios가 버전이 올라감에 따라 sceneDelegate를 더이상 사용하지 않게되었다
        //그래서 로그인을 한후 리턴값을 인식을 하여야하는데 해당 코드를 적어주지않으면 리턴값을 인식되지않는다
        //swiftUI로 바뀌면서 가장큰 차이점이다.
        .onOpenURL(perform: { url in
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        })
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
