//
//  ViewController.swift
//  ThreadsHomeWork
//
//  Created by Виктор Красильников on 22.08.2018.
//  Copyright © 2018 Viktor_Original. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityOfImageView: UIActivityIndicatorView!
    
    enum ImagesPath: String {
        case mountain = "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg"
        case panda = "https://besthqwallpapers.com/Uploads/15-2-2018/40829/panda-bamboo-cute-bear-cub-big-panda-forest-animals.jpg"
        case car = "https://wallpapersite.com/images/pages/pic_w/2135.jpg"
    }
    
    func loadImage(from path: ImagesPath, sender: UIButton) {
        let activityOfLoading: UIActivityIndicatorView? = self.activityOfImageView
        guard let activity = activityOfLoading
            else { return }
        guard let imagesURL = URL(string: path.rawValue)
            else { return }
        
        activity.isHidden = false
        activity.startAnimating()
        
        let loadingURL = URLSession.shared.dataTask(with: imagesURL,
                                                    completionHandler: {
            (data, response, error) in
            if  let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    activity.stopAnimating()
                }
            }
        })
        loadingURL.resume()
    }
    
    @IBAction func loadMountains(_ sender: UIButton) {
        self.loadImage(from: .mountain, sender: sender)
    }
    @IBAction func loadPanda(_ sender: UIButton) {
        self.loadImage(from: .panda, sender: sender)
    }
    @IBAction func loadCar(_ sender: UIButton) {
        self.loadImage(from: .car, sender: sender)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityOfImageView.isHidden = true
        self.activityOfImageView.hidesWhenStopped = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

