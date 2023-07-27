//
//  OnBoardingViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 22/07/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: RectanglePageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var container: UIView!
    
    
    var tabsPage: [PagerPageViewController] = []
    var pageController = UIPageViewController()
    var currentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        presentPageVCOnView()
        setupSlides()
        setupPageControl()
        
        // Do any additional setup after loading the view.
        pageController.delegate = self
        pageController.dataSource = self
        
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true)
    }
    

    
    private func getSlides() -> [SlideData] {
       return [
       SlideData(imageName: "slide1", title: "Create Collects, Timeless Artworks", subtitle: "The world’s largest digital marketplace for crypto collectibles and non-fungible tokens. Buy, sell, and discover exclusive digital items."),
       SlideData(imageName: "slide2", title: "Scure Your Assets with the good one ", subtitle: "OKNFT has partnered with some notable companies and recently partnered with we to help secure  non-fungible tokens artists' and creators' work."),
       
    
       SlideData(imageName: "slide3", title: " Variety of cryptocurrency wallet", subtitle: "Supports more than 150 cryptocurrency wallet. For an introduction to the non-fungible tokens world, OKNFT is a great place to start.")
       
       ]
        
    }
    
    
   
    
    @IBAction func onButtonClicked(_ sender: UIButton) {
        if currentIndex < tabsPage.count - 1 {
            let label = currentIndex + 1 == tabsPage.count - 1 ? "Get Started" : "Next"
            nextButton.setTitle(label, for: .normal)
            currentIndex += 1
            pageControl.currentPage = currentIndex
            pageController.setViewControllers([viewController(At: currentIndex)!], direction: .forward, animated: true)
            
        } else {
            performSegue(withIdentifier: "goToLogin", sender: self)
        }
               
    }
    
    @IBAction func onSkipped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    

}





//MARK: - HELPERS
extension OnBoardingViewController {
    
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
        let slidesData = getSlides()
        let slide0 = storyboard?.instantiateViewController(withIdentifier: "slideVC") as! SlideViewController
        slide0.slide = slidesData[0]
        
        let slide1 = storyboard?.instantiateViewController(withIdentifier: "slideVC") as! SlideViewController
        slide1.slide = slidesData[1]
        
        let slide2 = storyboard?.instantiateViewController(withIdentifier: "slideVC") as! SlideViewController
        slide2.slide = slidesData[2]
        tabsPage.append(contentsOf: [slide0,slide1,slide2])
        
    }
    
    //present view controller at the given index
    func viewController(At index: Int) -> UIViewController? {
        let contentVC = tabsPage[index]
        contentVC.pageIndex = index
        contentVC.slide = getSlides()[index]
        currentIndex = index
        return contentVC
    }
}


//MARK: - Setups
extension OnBoardingViewController {
    
    private func setupPageControl() {
        pageControl.numberOfPages = tabsPage.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        
    }
    
    @objc private func pageControlValueChanged() {
        let currentPage = pageControl.currentPage
        
        if(currentPage > currentIndex) {
           
            pageController.setViewControllers([viewController(At: currentPage)!], direction: .forward, animated: true)
        } else {
            pageController.setViewControllers([viewController(At: currentPage)!], direction: .reverse, animated: true)
        }
        currentIndex  = currentPage
       
        
    }
}



//MARK: - PageController delegate and datasource

extension OnBoardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PagerPageViewController).pageIndex
        
        if index == 0 || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PagerPageViewController).pageIndex
        
        if index == tabsPage.count - 1 || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
    }
    
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
        if finished {
            if completed {
                let contentVC = pageViewController.viewControllers!.first as! PagerPageViewController
                let newIndex = contentVC.pageIndex
                let label = newIndex == tabsPage.count - 1 ? "Get Started" : "Next"
                nextButton.setTitle(label, for: .normal)
                pageControl.currentPage = newIndex
                
            }
        }
    }
    
    
}








