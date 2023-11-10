//
//  DetailViewController.swift
//  YouTube-App
//
//  Created by Sihan on 10/11/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
   
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear all the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //check if the video is not nil
        guard video != nil else { return }
        
        //create the embedded URL
        var embededUrl = Constants.YT_EMBED_URL + video!.videoId
        
        //load the webview
        var url = URL(string: embededUrl)
        var request = URLRequest(url: url!)
        webView.load(request)
        
        //set title
        titleLabel.text = video?.title
        //set date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy" //NSDateFormatter.com
        dateLabel.text = df.string(from: video!.published)
        //set text
        textView.text = video?.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
