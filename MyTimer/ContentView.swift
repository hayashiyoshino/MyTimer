//
//  ContentView.swift
//  MyTimer
//
//  Created by Yoshino Hayashi on 2023/02/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 階層的な画面遷移を管理する機能
        NavigationStack {
            // 奥から手前方向にレイアウト
            ZStack {
                // 背景画像
                Image("backgroundTimer")
                // リサイズする
                    .resizable()
                // セーフエリアを「超えて画面全体に配置
                    .ignoresSafeArea()
                // アスペクト比を維持して親に合わせてビューをスケーリング
                    .scaledToFill()
            }
            // ナビゲーションにボタン追加
            .toolbar {
                // ナビゲーションバーの右にボタンを追加
                ToolbarItem(placement: .navigationBarTrailing) {
                    // ナビゲーション繊維
                    NavigationLink {
                        SettingView()
                    } label: {
                        // テキストを表示
                        Text("秒数設定")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
