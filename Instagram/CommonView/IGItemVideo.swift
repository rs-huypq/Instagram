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
                        Spacer()
                        RightTabBar()
                    }
                    
                    if self.data[i].replay {
                        
                        Button(action: {
                            
                            // playing the video again...
                            self.data[i].replay = false
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                            
                        }) {
                            
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 55, height: 60)
                                .foregroundColor(.white)
                        }
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

struct RightTabBar: View {

    var body: some View{
        
        HStack{
            Spacer()
            
            VStack(spacing: 35){
                
                Button(action:{
                    
                }) {
                    Image("pic")
                        .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "suit.heart.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "message.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "arrowshape.turn.up.right.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            .padding(.bottom, 100)
            .padding(.trailing)
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
