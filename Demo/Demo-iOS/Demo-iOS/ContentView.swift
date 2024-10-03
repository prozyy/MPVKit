import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator = MPVMetalPlayerView.Coordinator()
    @State var loading = false
    @State var inputURL: String = ""
    @State var recentURLs: [String] = UserDefaults.standard.stringArray(forKey: "recentURLs") ?? []
    @State var isPlaying = false
    @State var showingURLInput = true
    
    var body: some View {
        Group {
            if isPlaying {
                VStack {
                    MPVMetalPlayerView(coordinator: coordinator)
                        .play(URL(string: inputURL)!)
                        .onPropertyChange { player, propertyName, propertyData in
                            switch propertyName {
                            case MPVProperty.pausedForCache:
                                loading = propertyData as! Bool
                            default: break
                            }
                        }
                }
                .overlay(overlayView)
            } else {
                URLInputView(inputURL: $inputURL, recentURLs: $recentURLs, onURLSelected: { url in
                    playURL(url)
                })
                .onDisappear {
                    // 强制在消失时更新界面，确保键盘已完全隐藏
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    private var overlayView: some View {
        if loading {
            ProgressView()
        } else {
            EmptyView()
        }
    }
    
    private func playURL(_ urlString: String) {
        inputURL = urlString
        isPlaying = true
        UIApplication.shared.isIdleTimerDisabled = true
        // 如果 recentURLs 中已经有这个 URL，则先移除它
        if let index = recentURLs.firstIndex(of: urlString) {
            recentURLs.remove(at: index)
        }
        
        // 将新 URL 插入到数组的最前面
        recentURLs.insert(urlString, at: 0)
        
        // 保持最多保存 5 个 URL
        if recentURLs.count > 5 {
            recentURLs.removeLast()
        }
        
        saveRecentURLs()
    }
    
    private func stopPlayback() {
        // 返回到 URL 输入界面
        isPlaying = false
        UIApplication.shared.isIdleTimerDisabled = false
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
        NavigationView {
            VStack {
                TextField("Enter video URL", text: $inputURL)
                    .padding()
                    .foregroundColor(.white) // 设置文本颜色为白色
                    .background(Color.clear)  // 设置背景为透明，确保与界面一致
                    .cornerRadius(10)
                    .padding()
                
                Button("Play URL") {
                    // 手动隐藏键盘，确保UI更新
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    onURLSelected(inputURL)
                }
                .padding()
                List {
                    Section(header: Text("Recent URLs")) {
                        ForEach(recentURLs, id: \.self) { url in
                            Button(url) {
                                // 手动隐藏键盘，确保UI更新
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
}
