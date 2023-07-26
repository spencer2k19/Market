//
//  OnBoardingViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 22/07/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: RectanglePageControl!
    @IBOutlet weak var nextButton: UIButton!
    
   
    
    var slides:[Slide] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupScrollView()
        setupPageControl()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func getSlides() -> [SlideData] {
       return [
       SlideData(imageName: "slide1", title: "Create Collects, Timeless Artworks", subtitle: "The world’s largest digital marketplace for crypto collectibles and non-fungible tokens. Buy, sell, and discover exclusive digital items."),
       SlideData(imageName: "slide2", title: "Scure Your Assets with the good one ", subtitle: "OKNFT has partnered with some notable companies and recently partnered with we to help secure  non-fungible tokens artists' and creators' work."),
       
    
       SlideData(imageName: "slide3", title: " Variety of cryptocurrency wallet", subtitle: "Supports more than 150 cryptocurrency wallet. For an introduction to the non-fungible tokens world, OKNFT is a great place to start.")
       
       ]
        
    }
    
    
    private func createSlides() -> [Slide] {
       
        let slides: [Slide] =  getSlides().map { slideData in
            let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self)?.first as! Slide
            slide.imageSlide.image = UIImage(named: slideData.imageName)
            slide.title.text = slideData.title
            slide.subtitle.text = slideData.subtitle
            return slide
        }
        
        return slides
    }
    
    
    @IBAction func onButtonClicked(_ sender: UIButton) {
        let pageWidth = scrollView.frame.width
        let currentPage = pageControl.currentPage
       
        if(currentPage < slides.count - 1) {
            print("Current page : \(currentPage + 1)")
            print("Slides count: \(slides.count - 1)")
            let offset = CGPoint(x: CGFloat(currentPage + 1) * pageWidth, y: 0)
            scrollView.setContentOffset(offset, animated: true)
            let label = currentPage + 1 == slides.count - 1 ? "Get Started" : "Next"
            sender.setTitle(label, for: .normal)
         
        } else {
            performSegue(withIdentifier: "goToLogin", sender: self)
        }
       
    }
    
    @IBAction func onSkipped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    

}


//MARK: - Setups
extension OnBoardingViewController {
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        let scrollViewWidth = scrollView.frame.width
        let scrollViewHeight = scrollView.frame.height
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: scrollViewWidth * CGFloat(slides.count), height: scrollViewHeight)
        
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: scrollViewWidth * CGFloat(i), y: 0, width: scrollViewWidth, height: scrollViewHeight)
            scrollView.addSubview(slides[i])
            
        }
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        
    }
    
    @objc private func pageControlValueChanged() {
        let pageWidth = scrollView.frame.width
        let currentPage = pageControl.currentPage
        let offset = CGPoint(x: CGFloat(currentPage) * pageWidth, y: 0)
        scrollView.setContentOffset(offset, animated: true)
        
    }
}

//MARK: - SCROLL VIEW DELEGATE
extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
        
    }
}






