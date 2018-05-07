//
//  ViewController.swift
//  audible
//
//  Created by Patnayak, Nilikh on 9/22/17.
//  Copyright © 2017 Patnayak, Nilikh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LoginDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var pageControlBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var skipButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!

    let pages: [Page] = {
        
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageControl.numberOfPages = pages.count + 1
        registerKeyboardNotifications()
        
    }
    
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardDidShow() {
        print("keyboard did show")
        collectionViewTopConstraint.constant = -90
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    
    func keyboardDidHide() {
        collectionViewTopConstraint.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    

    // MARK: - Collection view data source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == pages.count {
            let loginCellId = "loginCell"
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath) as! LoginCell
            loginCell.delegate = self
            
            return loginCell
        }
        
        let cellId = "cellId"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // MARK: Private actions
    
    func finishLoggingIn() {
        print("Log in has been done")
        let userDefaults = UserDefaults.standard
        userDefaults.setUserLoggedInStatus(status: true)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = storyBoard.instantiateViewController(withIdentifier: "HomeController")
//        let mainNavigationController = self.presentingViewController as! MainNavigationController
//        mainNavigationController.viewControllers = [homeController]
        
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigationController = rootViewController as?MainNavigationController else {return}
        mainNavigationController.viewControllers = [homeController]
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func skipButtonHandler() {
        print("skip tapped")
        pageControl.currentPage = pages.count - 1
        nextButtonHandler()
    }
    
    @IBAction func nextButtonHandler() {
        print("Next tapped")
        guard pageControl.currentPage < pages.count else {return}
        let nextPage = pageControl.currentPage + 1
        let nextIndexPath = IndexPath(item: nextPage, section: 0)
        collectionView?.scrollToItem(at: nextIndexPath, at:.centeredHorizontally , animated: true)
        
        if nextPage == pages.count {
            pageControlBottomConstraint.constant = -40
            skipButtonTopConstraint.constant = -50
            nextButtonTopConstraint.constant = -50
        } else {
            pageControlBottomConstraint.constant = 8
            skipButtonTopConstraint.constant = 0
            nextButtonTopConstraint.constant = 0
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        pageControl.currentPage = nextPage
    }
    
    // MARK: Scroll view delegates
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let finalOffset = targetContentOffset.pointee
        let pageNumber = Int(finalOffset.x/view.frame.size.width)
        
        if pageNumber == pages.count {
            pageControlBottomConstraint.constant = -40
            skipButtonTopConstraint.constant = -50
            nextButtonTopConstraint.constant = -50
        } else {
            pageControlBottomConstraint.constant = 8
            skipButtonTopConstraint.constant = 0
            nextButtonTopConstraint.constant = 0
        }
        
    
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:.curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
        pageControl.currentPage = pageNumber
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        
        DispatchQueue.main.async {
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView?.reloadData()
        }
    }
    

}







