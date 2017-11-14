//
//  ViewController.swift
//  playAudioFromUrl
//
//  Created by Pavlo Kharambura on 11/14/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let urlstring = URL(string: "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadFileFromURL(url: urlstring!)
    }

    func downloadFileFromURL(url:URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (url, response, error) in
            self.play(url: url!)
        })
        downloadTask.resume()
    }
    
    func play(url:URL) {
        print("playing \(url)")
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.volume = 1.0
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }

    @IBAction func playBUtton(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func replayButton(_ sender: Any) {
        player.stop()
    }
    
}

