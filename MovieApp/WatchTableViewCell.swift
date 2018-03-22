//
//  WatchTableViewCell.swift
//  MovieApp
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class WatchTableViewCell: UITableViewCell {
    
    var rows:Int?
    
    var watchNext=["2","Baaghi2","BaarBaarDekho","Baazaar","Dabang3","Dangal","Fukrey","Haseena","Judwaa 2","Kaabil","KaalaKandi","karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","StudentOfTheYear2","Tezz","TigerZindaHai"]
    
    var watchNext1=["karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","StudentOfTheYear2","Tezz","TigerZindaHai","2","Baaghi2","BaarBaarDekho","Baazaar","Dabang3","Dangal","Fukrey","Haseena","Judwaa 2","Kaabil","KaalaKandi"]
    var watchNext2=["Kaabil","KaalaKandi","StudentOfTheYear2","karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","Baazaar","Dabang3","Dangal","Fukrey","Haseena","Judwaa 2","Tezz","TigerZindaHai","2","Baaghi2","BaarBaarDekho"]
    
    var watchNext3=["Fukrey","Haseena","Judwaa 2","Tezz","Kaabil","KaalaKandi","StudentOfTheYear2","karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","Baazaar","Dabang3","Dangal","TigerZindaHai","2","Baaghi2","BaarBaarDekho"]
    
    var watchNext4=["Baazaar","Dabang3","Dangal","Fukrey","Haseena","Judwaa 2","Tezz","Kaabil","KaalaKandi","StudentOfTheYear2","karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","TigerZindaHai","2","Baaghi2","BaarBaarDekho"]
    
    var watchNext5=["Dangal","TigerZindaHai","2","Baaghi2","Fukrey","Haseena","Judwaa 2","Tezz","Kaabil","KaalaKandi","StudentOfTheYear2","karanArjun","Krrish4","Raees","Rangoon","Secret SuperStar","Baazaar","Dabang3","BaarBaarDekho"]
    
    var watchNext6=["Rangoon","Secret SuperStar","Baazaar","Fukrey","Haseena","Judwaa 2","Tezz","Kaabil","KaalaKandi","StudentOfTheYear2","karanArjun","Krrish4","Raees","Dabang3","Dangal","TigerZindaHai","2","Baaghi2","BaarBaarDekho"]
    
    @IBOutlet weak var smallCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.smallCollectionView.delegate=self
        self.smallCollectionView.dataSource=self
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
    
    
    
    
}
extension WatchTableViewCell:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 2
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        <#code#>
    //    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if rows == 0 {
            return watchNext.count
        }
        else if rows==2{
            return watchNext1.count
        }
        else if rows==4{
            return watchNext2.count
        }
        else if rows==6{
            return watchNext4.count
        }
        else if rows==8{
            return watchNext5.count
        }
        else if rows==10{
            return watchNext6.count
        }
        else if rows==12{
            return watchNext3.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.row % 2 == 0
        {
        let width = collectionView.frame.width/2
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
        }
        else
        {
            let width = collectionView.frame.width/3
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if rows==1{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext[indexPath.row])
            return cell
        }
        else if rows==2{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext1[indexPath.row])
            return cell
        }
        else if rows == 4{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext2[indexPath.row])
            return cell
        }
        else if rows==6{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext4[indexPath.row])
            return cell
        }
        else if rows == 8{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext5[indexPath.row])
            return cell
        }
        else if rows == 10{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext6[indexPath.row])
            return cell
        }
        else{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! WatchCollectionViewCell
            cell.movieImage.image=UIImage(named:watchNext3[indexPath.row])
            return cell
        }
        
    }
}
