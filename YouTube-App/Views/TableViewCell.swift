//
//  TableViewCell.swift
//  YouTube-App
//
//  Created by Sihan on 8/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //thumbnail
    @IBOutlet weak var thumbnailImageView: UIImageView!
    //Label
    @IBOutlet weak var dateLabel: UILabel!
    //Title
    @IBOutlet weak var title: UILabel!
    
    var video: Video?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        //set the title
        self.title.text = video?.title
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy" //NSDateFormatter.com
        self.dateLabel.text = df.string(from: video!.published)
        
        //set thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //check cache data before download
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        //download the thumbnail date
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session
        let session = URLSession.shared
        
        //create datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //save the data in cache manager
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //check the downloaded url matches the vidoe thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                //Create image object
                let image = UIImage(data: data!)
                //Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        //start datatask
        dataTask.resume()
    }

}
