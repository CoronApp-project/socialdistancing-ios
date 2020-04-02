//
//  OnboardingViewController.swift
//  SocialDistancing
//
//  Created by andrea roveres on 01/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit
import Combine

final class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var closeButton: CrossButton!
    @IBOutlet weak var carousel: UICollectionView!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var skipButton: BlueButton!
    @IBOutlet weak var nextButton: BlueButton!
    @IBOutlet weak var startButton: BlueButton!
    
    let defaults = UserDefaults.standard
    
    private var pageNumber: Int = 0
//    @Published var currentPage: String
//    
    private var arrData = [TutorialViewData(imageName: "iconDistance", headline: "Keep distance", description: "Coronavirus is thought to spread from person to person. A person can become infected through close contact and respiratory droplets that come out of our mouth or nose (i.e. when we cough, sneeze, spit or talk). We are all responsible for preventing this!"),
                           TutorialViewData(imageName: "iconScan", headline: "Scan your surroundings", description: "Hold your phone in front of you while you move around. It will show you your ‘spreading area’. Within that area, the risk of getting infected or infecting others is higher."),
                           TutorialViewData(imageName: "iconVirus", headline: "Don't let others inside", description: "When a person gets inside your ‘spreading area’, you are too close. Your phone will notify you of that so you can move away.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "TutorialCell", bundle: nil)
        carousel.register(nib, forCellWithReuseIdentifier: TutorialCell.identifier)
        carousel.delegate = self
        carousel.dataSource = self
        carousel.allowsSelection = false
        carousel.isPagingEnabled = true
        carousel.showsHorizontalScrollIndicator = false
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: carousel.frame.width, height: carousel.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        carousel!.collectionViewLayout = layout
        
        page.numberOfPages = 3
        page.currentPageIndicatorTintColor = Color.blue
        page.pageIndicatorTintColor = Color.grey
        
        buttonsView.isHidden = false
        skipButton.style = .white
        nextButton.style = .blue
        startButton.style = .blue
        startButton.isHidden = true
        setComponentsDataToNil()
    }
    
    private func setComponentsDataToNil() {
        skipButton.setTitle("Skip Tutorial", for: .normal)
        nextButton.setTitle("Next", for: .normal)
        startButton.setTitle("Start", for: .normal)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCell.identifier, for: indexPath) as? TutorialCell else {
            fatalError("You've forgotten to register the cell: TutorialCell")
        }
        cell.set(arrData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageNumber = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        page.currentPage = pageNumber
        
        if pageNumber == 2 {
            buttonsView.isHidden = true
            startButton.isHidden = false
        } else {
            buttonsView.isHidden = false
            startButton.isHidden = true
        }
    }
    
    
    @IBAction func didPressCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressSkipButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressNextButton(_ sender: Any) {
        carousel.reloadData()
        carousel.layoutIfNeeded()
        carousel.scrollToItem(at: IndexPath(item: pageNumber+1, section: 0), at: .right, animated: true)

    }
    
    @IBAction func didPressStartButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
