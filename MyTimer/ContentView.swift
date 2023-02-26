//
//  ContentView.swift
//  MyTimer
//
//  Created by Yoshino Hayashi on 2023/02/18.
//

import SwiftUI

struct ContentView: View {
    // タイマーの変数
    @State var TimerHandler : Timer?
    // カウントの変数
    @State var count = 0
    // 永続化する秒数設定
    @AppStorage("timer_value") var timerValue = 10
    
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
                
                // 縦方向にレイアウト
                // View間の感覚を30にする
                VStack(spacing: 30.0) {
                    // テキスト表示
                    Text("残り10秒")
                    // 文字サイズを指定
                        .font(.largeTitle)
                    // 横方向にレイアウト
                    HStack {
                        // スタートボタン
                        Button {
                            // ボタンをタップした時のアクション
                        } label: {
                            Text("スタート")
                            // 文字サイズを指定
                                .font(.title)
                            // 文字色を白に指定
                                .foregroundColor(Color.white)
                            // 幅高さを140に指定
                                .frame(width: 140, height: 140)
                            // 背景を指定
                                .background(Color("startColor"))
                            // 円形に切り抜く
                                .clipShape(Circle())
                        }
                        // ストップボタン
                        Button {
                            // ボタンをタップした時のアクション
                        } label: {
                            Text("ストップ")
                            // 文字サイズを指定
                                .font(.title)
                            // 文字色を白に指定
                                .foregroundColor(Color.white)
                            // 幅高さを140に指定
                                .frame(width: 140, height: 140)
                            // 背景を設定
                                .background(Color("stopColor"))
                            // 円形に切り抜く
                                .clipShape(Circle())
                        }
                    }
                }
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
    
    // 1秒ごとに実行されてカウントダウンする
    func countDownTimer() {
        // countに+1していく
        count += 1
        
        // 残り時間が0以下の時タイマーを止める
        if timerValue - count <= 0 {
            TimerHandler?.invalidate()
    
    // タイマーをカウントダウン開始する関数
    func startTimer() {
        // timerHandlerをアンラップしてunwrappedTimerHandlerに代入
        if let unwrapedTimerHandler = timerHandler {
            // もしタイマーが実行中だったらスタートしない
            if unwrapedTimerHandler.isValid == true {
                // 何もしない
                return
            }
        }
        
        // 残り時間が0以下の時countを0に初期化する
        if timerValue - count <= 0 {
            count = 0
        }
        
        // タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            // タイマー実行時に呼び出される
            // 1秒ごとに実行されてカウントダウンする関数を実行
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
