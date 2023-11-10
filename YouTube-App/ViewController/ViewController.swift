//
//  ViewController.swift
//  YouTube-App
//
//  Created by Sihan on 2/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as the datasource and the delegate
        tableView.dataSource = self
        //tableView.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
        view.backgroundColor = .darkGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check if the video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        //get a reference to the video that was tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        //get the video property of the detailViewController
        let detailVC = segue.destination as! DetailViewController
        //set the video property of the detailViewController
        detailVC.video = selectedVideo
    }


 
}

//MARK: - TableView Methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL, for: indexPath) as! TableViewCell
        
        //Configure the cell with data
//        let title = self.videos[indexPath.row].title
//        cell.textLabel?.text = title
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}

////MARK: - Model Delegate Methods
extension ViewController: ModelDelegate {
    
    func videosFetched(_ videos: [Video]) {
        //set the returned videos to our video property
        self.videos = videos

        //refresh the table
        tableView.reloadData()
    }


}
 
