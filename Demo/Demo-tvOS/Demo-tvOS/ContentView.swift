import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator = MPVMetalPlayerView.Coordinator()  // 保持唯一的播放器协调器
    @State var loading = false
    @State var inputURL: String = ""
    @State var recentURLs: [String] = UserDefaults.standard.stringArray(forKey: "recentURLs") ?? []
    @State var isPlaying = false
    @State private var showPlayer = false  // 控制是否显示播放器
    @State private var mpvPlayer: MPVMetalPlayerView? = nil  // 保持唯一的播放器实例

    var body: some View {
        NavigationStack {
            VStack {
                URLInputView(inputURL: $inputURL, recentURLs: $recentURLs, onURLSelected: { url in
                    playURL(url)
                })
                .navigationDestination(isPresented: $showPlayer) {
                    playerView
                }
            }
            .preferredColorScheme(.dark)
            .navigationBarHidden(true)  // 隐藏导航栏
        }
    }
    
    private var playerView: some View {
        VStack {
            if let mpvPlayer = mpvPlayer {
                mpvPlayer
                    .play(URL(string: inputURL)!)
                    .onPropertyChange { player, propertyName, propertyData in
                        switch propertyName {
                        case MPVProperty.pausedForCache:
                            loading = propertyData as! Bool
                        default: break
                        }
                    }
                    .edgesIgnoringSafeArea(.all)  // 确保播放器全屏显示
                    .overlay(overlayView)
                    .navigationBarBackButtonHidden(true)  // 隐藏默认返回按钮
                    .navigationTitle("")  // 确保标题为空
                    .onDisappear {
                        // 停止播放并释放资源
                        mpvPlayer.coordinator.player?.pause()
//                        mpvPlayer.deallocate()
//                        mpvPlayer.coordinator.player=nil
                        UIApplication.shared.isIdleTimerDisabled = false
                        isPlaying = false
                    }
            } else {
                EmptyView()  // 占位视图
            }
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        if loading {
            ProgressView()
                .edgesIgnoringSafeArea(.all)  // 全屏覆盖加载指示器
        } else {
            EmptyView()
        }
    }
    
    private func playURL(_ urlString: String) {
        inputURL = urlString
        isPlaying = true
        showPlayer = true  // 导航到播放器界面
        UIApplication.shared.isIdleTimerDisabled = true
        
        // 如果播放器还存在，先停止之前的播放
//        if mpvPlayer?.coordinator.player != nil{
//            mpvPlayer?.coordinator.player?.pause()
//            mpvPlayer?.deallocate()
//        }
//        mpvPlayer?.coordinator.player = nil  // 释放播放器实例
        
        // 创建新的播放器实例
        mpvPlayer = MPVMetalPlayerView(coordinator: coordinator)
        
        // 更新播放历史
        if let index = recentURLs.firstIndex(of: urlString) {
            recentURLs.remove(at: index)
        }
        
        recentURLs.insert(urlString, at: 0)
        
        if recentURLs.count > 5 {
            recentURLs.removeLast()
        }
        saveRecentURLs()
    }
    
    private func saveRecentURLs() {
        UserDefaults.standard.set(recentURLs, forKey: "recentURLs")
    }
}

struct URLInputView: View {
    @Binding var inputURL: String
    @Binding var recentURLs: [String]
    var onURLSelected: (String) -> Void
    
    var body: some View {
        VStack {
            TextField("Enter video URL", text: $inputURL)
                .padding()
                .foregroundColor(.white)
                .background(Color.clear)
                .cornerRadius(10)
                .padding()
            
            Button("Play URL") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                onURLSelected(inputURL)
            }
            .padding()
            
            List {
                Section(header: Text("Recent URLs")) {
                    ForEach(recentURLs, id: \.self) { url in
                        Button(url) {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            onURLSelected(url)
                        }
                    }
                }
            }
        }
        .navigationTitle("Enter Video URL")
    }
}
