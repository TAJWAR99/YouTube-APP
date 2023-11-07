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

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
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
        guard self.video?.thumbnail != nil else {
            return
        }
        //download the thumbnail date
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session
        let session = URLSession.shared
        
        //create datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                //check the downloaded url matches the vidoe thumbnail url that this cell is currently set to display
                
                //Create image object
                
                //Set the image view
            }
        }
    }

}
