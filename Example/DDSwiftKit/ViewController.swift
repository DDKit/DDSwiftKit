//
//  ViewController.swift
//  DDSwiftKit
//
//  Created by duanchanghe on 08/31/2018.
//  Copyright (c) 2018 duanchanghe. All rights reserved.
//

import UIKit
import DDSwiftKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var data:[String] = ["#f00","#0f0","#00f","#ff0","#0ff","#f0f","#fff",
                         "#f009","#0f09","#00f9","#ff09","#0ff9","#f0f9","#fff9",
                         "#ff0000","#00ff00","#0000ff","#ffff00","#00ffff","#ff00ff","#ffffff",
                         "#ff000099","#00ff0099","#0000ff99","#ffff0099","#00ffff99","#ff00ff99","#ffffff99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.dd_color(data[indexPath.row])
        return cell
    }
    
    
    
    
    
    
    
    
}


