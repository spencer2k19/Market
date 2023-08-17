//
//  NFTViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit






class NftHomeViewController: UIViewController {
   
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var menuTabView: MenuTitleTabView!
    var currentIndex: Int = 0
    var tabs = ["Popular","Market","Primary"]
    var tabsPage: [PagerViewController] = []
    var pageController = UIPageViewController()
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTabView.dataArray = tabs
        menuTabView.isSizeToFitCellsNeeded = false
        menuTabView.collectionView.backgroundColor = UIColor.white
        
        presentPageVCOnView()
        setupPageContents()
        menuTabView.menuDelegate = self
        
        pageController.delegate = self
        pageController.dataSource = self
        
        //For initial display
        
        menuTabView.collectionView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true)
        
        

    }
    

}


extension NftHomeViewController: PagerNftAssetDelegate {
    func onViewAssetDetails() {
        self.performSegue(withIdentifier: "goToAssetDetails", sender: self)
    }
}



//MARK: - HELPERS
extension NftHomeViewController {
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
    
    
    func setupPageContents() {
        let page0 = storyboard?.instantiateViewController(withIdentifier: "popularVC") as! PopularNftViewController
        page0.pagerDelegate = self
        
        let page1 = storyboard?.instantiateViewController(withIdentifier: "marketVC") as! MarketNftViewController
        page1.pagerDelegate = self
        
        
        let page2 = storyboard?.instantiateViewController(withIdentifier: "primaryVC") as! PrimaryNftViewController
        page2.pagerDelegate = self
        
        tabsPage.append(contentsOf: [page0,page1,page2])
    }
    
    
    //present view controller at the given index
    func viewController(At index: Int) -> UIViewController? {
        if((self.menuTabView.dataArray.count == 0) || (index >= menuTabView.dataArray.count)) {
            return nil
        }
        
        let contentVC = tabsPage[index]
        contentVC.pageIndex = index
        currentIndex = index
        return contentVC
    }
}




//MARK: - Menubar delegate
extension NftHomeViewController: MenuTitleBarDelegate {
    func menubarDidSelectItemAt(menu: MenuTitleTabView, index: Int) {
        
        //if selected index is other than selected one, by comparing with current index, page controller goes either forward or backward.
        
        if index != currentIndex {
            if index > currentIndex {
                pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true)
            } else {
                pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: true)
            }
            
            menuTabView.collectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    
}



//MARK: - PageController delegate and datasource

extension NftHomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
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
                menuTabView.collectionView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                
                menuTabView.collectionView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
                
                
            }
        }
    }
    
    
}


