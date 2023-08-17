//
//  WalletViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 25/07/2023.
//

import UIKit

class WalletViewController: UIViewController {
        
    
    
    @IBOutlet weak var menuTabsView: MenuTabsView!
    @IBOutlet weak var container: UIView!
    
    var currentIndex: Int = 0
    var tabs = ["Coins","NFT","DeFi"]
    var tabsPage: [PagerViewController] = []
    var pageController = UIPageViewController()
    
    
    @IBAction func manageClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWalletManage", sender: self)
    }
    
    
    @IBAction func connectWalletClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWalletManage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTabsView.dataArray = tabs
        menuTabsView.isSizeToFitCellsNeeded = false
        menuTabsView.collectionView.backgroundColor = UIColor.white
        
        presentPageVCOnView()
        setupSlides()
        
        menuTabsView.menuDelegate = self
        pageController.delegate = self
        pageController.dataSource = self
        
       
        
        //For initial display
        menuTabsView.collectionView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true)
        
        
    }
    

}

//MARK: - HELPERS
extension WalletViewController {
    
    func presentPageVCOnView() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageController.view.backgroundColor = .clear
        pageController.view.frame = CGRect(
            x: 0,
            y: 0,
            width: Int(container.frame.width),
            height: Int(container.frame.height)
        )
        
        container.addSubview(pageController.view)
    }
    
    
    private func setupSlides() {
        let slide0 = storyboard?.instantiateViewController(withIdentifier: "contentVC") as! AssetsViewController
//        slide0.pageIndex = 0
        
        let slide1 = storyboard?.instantiateViewController(withIdentifier: "NftVC") as! NFTViewController
//        slide1.pageIndex = 1
        
        let slide2 = storyboard?.instantiateViewController(withIdentifier: "DefiVC") as! DeFiViewController
//        slide2.pageIndex = 2
        tabsPage.append(contentsOf: [slide0,slide1,slide2])
        
    }
    
    //present view controller at the given index
    func viewController(At index: Int) -> UIViewController? {
        if((self.menuTabsView.dataArray.count == 0) || (index >= menuTabsView.dataArray.count)) {
            return nil
        }
        
        let contentVC = tabsPage[index]
        contentVC.pageIndex = index
        currentIndex = index
        return contentVC
    }
}


//MARK: - Menubar delegate
extension WalletViewController: MenuBarDelegate {
    func menubarDidSelectItemAt(menu: MenuTabsView, index: Int) {
        
        //if selected index is other than selected one, by comparing with current index, page controller goes either forward or backward.
        
        if index != currentIndex {
            if index > currentIndex {
                pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true)
            } else {
                pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: true)
            }
            
            menuTabsView.collectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    
}

//MARK: - PageController delegate and datasource

extension WalletViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PagerViewController).pageIndex
        
        if index == 0 || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PagerViewController).pageIndex
        
        if index == tabs.count || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                let contentVC = pageViewController.viewControllers!.first as! PagerViewController
                let newIndex = contentVC.pageIndex
                menuTabsView.collectionView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                
                menuTabsView.collectionView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
                
                
            }
        }
    }
    
    
}

