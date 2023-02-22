//
//  SettingView.swift
//  MyTimer
//
//  Created by Yoshino Hayashi on 2023/02/18.
//

import SwiftUI

struct SettingView: View {
    // 秒数設定
    @State var timerValue = 10
    
    var body: some View {
        // 奥から手前方向にレイアウト
        ZStack {
            // 背景色表示
            Color("backgroundSetting")
            // セーフエリアを超えて画面全体に配置
                .ignoresSafeArea()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
