//
//  MainTitleTableViewCell.swift
//  MovieApp
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class MainTitleTableViewCell: UITableViewCell {
    
    var begin = false
    var latestMovies=["Raees","Dabang3","Dangal","2","Baaghi2","TigerZindaHai","Raees","Dabang3","Dangal","2"]
    
    @IBOutlet weak var bigCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.bigCollectionView.delegate=self
        self.bigCollectionView.dataSource=self
        
        Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(scrollTimer), userInfo: nil, repeats: true)
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @objc func scrollTimer(_ timer1: Timer) {
        
        if let bigCollection  = bigCollectionView {
            for cell in bigCollection.visibleCells{
                
                let indexPath: IndexPath? = bigCollection.indexPath(for: cell)
                
                if ((indexPath?.item)!  < latestMovies.count - 1){
                    
                    let indexPath1: IndexPath?
                    
                    indexPath1 = IndexPath.init(row: (indexPath?.item)! + 1, section: (indexPath?.section)!)// find out next index to move to other image
                    
                    bigCollection.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    
                    let indexPath1: IndexPath?
                    
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    
                    bigCollection.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
            }
        }
    }
    
    @objc func clickToChange() {
        let initialPage = pageControl.currentPage
        var frameSize = bigCollectionView.frame
        frameSize.origin.x = frameSize.size.width * CGFloat(initialPage)
        frameSize.origin.y = 0
        bigCollectionView.scrollRectToVisible(frameSize, animated: true)
    }
    
    
    
}

extension MainTitleTableViewCell:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestMovies.count
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.layer.borderColor=UIColor.white.cgColor
    //        cell?.layer.borderWidth=2
    //    }
    //    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.layer.borderColor=#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    //        cell?.layer.borderWidth=2
    //    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage=indexPath.row
        self.pageControl.numberOfPages=latestMovies.count
        self.pageControl.addTarget(self, action: #selector(clickToChange), for: .valueChanged)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "BigImageCell", for: indexPath) as! BigImageCollectionViewCell
        cell.bigImage.image=UIImage(named:latestMovies[indexPath.row])
        //            cell.layer.borderColor=#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        //            cell.layer.borderWidth=0.5
        return cell
        
    }
    
}
