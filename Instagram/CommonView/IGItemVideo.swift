//
//  IGItemVideo.swift
//  Instagram
//
//  Created by Quang Huy on 28/12/2021.
//

import SwiftUI
import AVKit

struct PlayerView : View {
    @Binding var data : [Video]
    
    var body: some View{
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<self.data.count) {i in
                ZStack{
                    // full screensize
                    Player(player: self.data[i].player)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -6)
                    
                    VStack {
                        TopReels()
                        Spacer()
                        RightTabBar(
                            liked: self.data[i].liked,
                            comment: self.data[i].comment,
                            content: self.data[i].content,
                            avatar: self.data[i].userAvatar,
                            name: self.data[i].userName
                        )
                    }
                }
            }
        }
        .onAppear {
            
            // doing it for first video because scrollview didnt dragged yet...
            
            self.data[0].player.play()
            
            self.data[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
                
                // notification to identify at the end of the video...
                
                // enabling replay button....
                self.data[0].replay = true
            }
        }
    }
}

struct TopReels: View {
    var body: some View {
        HStack {
            Text(AppStrings.reelsHeader)
                .fontWeight(.bold)
                .font(.system(size: 28))
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 18, height: 12)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .padding(.top, 18)
    }
}

struct RightTabBar: View {
    var liked: Int
    var comment: Int
    var content: String
    var avatar: String
    var name: String

    var body: some View{
        HStack(alignment: .bottom){
            VStack {
                HStack(spacing: 8) {
                    Image(avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                    
                    Text(name)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                
                Text(content)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .padding(.bottom, 100)
            .padding(.leading, 10)
            
            Spacer()
            
            VStack(spacing: 35) {
                buildActionVideo(image: "suit.heart.fill", valueLabel: "\(liked)K")
                buildActionVideo(image: "message.fill", valueLabel: "\(comment)K")
                buildActionVideo(image: "arrowshape.turn.up.right.fill", valueLabel: "15K")
            }
            .padding(.bottom, 100)
            .padding(.trailing)
        }
    }
}

func buildActionVideo(image: String, valueLabel: String) -> some View {
    return Button(action:{}){
        VStack(spacing: 8){
            Image(systemName: image)
            .font(.title)
            .foregroundColor(.white)
            
            Text(valueLabel)
                .foregroundColor(.white)
        }
        
    }
}

struct Player : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController{
        
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Code UIViewControllerRepresentable
    }
}

struct PlayerScrollView : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @Binding var data : [Video]
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        // each children occupies one full screen so height = count * height of screen...
        
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        // same here...
        
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // to ignore safe area...
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // to dynamically update height based on data...
        
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate {
        
        var parent : PlayerScrollView
        var index = 0
        
        init(parent1 : PlayerScrollView) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currenrindex{
                
                index = currenrindex
                
                for i in 0..<parent.data.count{
                    
                    // pausing all other videos...
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                }
                
                // playing next video...
                
                parent.data[index].player.play()
                
                parent.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
                    
                    // notification to identify at the end of the video...
                    
                    // enabling replay button....
                    self.parent.data[self.index].replay = true
                }
            }
        }
    }
}
