//
//  OnboardingViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 01/04/2020.
//

import UIKit
import Combine

final class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak private var closeButton: CrossButton!
    @IBOutlet weak private var carousel: UICollectionView!
    @IBOutlet weak private var page: UIPageControl!
    @IBOutlet weak private var buttonsView: UIView!
    @IBOutlet weak private var skipButton: BlueButton!
    @IBOutlet weak private var nextButton: BlueButton!
    @IBOutlet weak private var startButton: BlueButton!
    
    private var currentPageNumber: Int = 0
    private var arrViewData: [TutorialViewData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPageControl()
        setupButtons()
        setComponentsDataToNil()
        setupArrViewData()
    }
    
    //MARK: - IBAction
    
    @IBAction func didPressCloseButton(_ sender: Any) {
        
        guard firstTimeAppLaunches else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.navigateToMenu(modalPresentationStyle: .fullScreen)
    }
    
    @IBAction func didPressSkipButton(_ sender: Any) {
        
        guard firstTimeAppLaunches else {
            self.dismiss(animated: true, completion: nil)
            return
         }
        self.navigateToMenu(modalPresentationStyle: .fullScreen)
         
    }
    
    @IBAction func didPressNextButton(_ sender: Any) {
        carousel.reloadData()
        carousel.layoutIfNeeded()
        carousel.scrollToItem(at: IndexPath(item: currentPageNumber+1, section: 0), at: .right, animated: true)
    }
    
    @IBAction func didPressStartButton(_ sender: Any) {
        
        guard firstTimeAppLaunches else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.navigateToMenu(modalPresentationStyle: .fullScreen)
    }
    
    //MARK: - Setup View
    
    private func setComponentsDataToNil() {
        skipButton.setTitle("Skip Tutorial", for: .normal)
        nextButton.setTitle("Next", for: .normal)
        startButton.setTitle("Start", for: .normal)
    }
    
    private func setupCollectionView() {
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
    }
    
    private func setupPageControl() {
        page.numberOfPages = 3
        page.currentPageIndicatorTintColor = Color.blue
        page.pageIndicatorTintColor = Color.grey
    }
    
    private func setupButtons() {
        buttonsView.isHidden = false
        skipButton.style = .white
        nextButton.style = .blue
        startButton.style = .blue
        startButton.isHidden = true
        closeButton.isHidden = firstTimeAppLaunches
    }
    
    private func setupArrViewData() {
        let firstPage = TutorialViewData(imageName: "iconDistance",
                                         headline: "Keep distance",
                                         description: "Coronavirus is thought to spread from person to person. A person can become infected through close contact and respiratory droplets that come out of our mouth or nose (i.e. when we cough, sneeze, spit or talk). We are all responsible for preventing this!")
        let secondPage = TutorialViewData(imageName: "iconScan",
                                          headline: "Scan your surroundings",
                                          description: "Hold your phone in front of you while you move around. It will show you your ‘spreading area’. Within that area, the risk of getting infected or infecting others is higher.")
        let thirdPage = TutorialViewData(imageName: "iconVirus",
                                         headline: "Don't let others inside",
                                         description: "When a person gets inside your ‘spreading area’, you are too close. Your phone will notify you of that so you can move away.")

        arrViewData = [firstPage, secondPage, thirdPage]
    }
    
    //MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCell.identifier, for: indexPath) as? TutorialCell else {
            fatalError("You've forgotten to register the cell: TutorialCell")
        }
        cell.set(arrViewData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentPageNumber = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        page.currentPage = currentPageNumber
        
        if currentPageNumber == 2 {
            buttonsView.isHidden = true
            startButton.isHidden = false
        } else {
            buttonsView.isHidden = false
            startButton.isHidden = true
        }
    }
    
}
