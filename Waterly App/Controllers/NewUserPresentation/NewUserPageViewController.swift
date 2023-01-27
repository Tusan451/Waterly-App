//
//  NewUserPageViewController.swift
//  Waterly App
//
//  Created by Olegio on 25.01.2023.
//

import UIKit

final class NewUserPageViewController: UIPageViewController {

    var arrayOfViewControllers: [UIViewController]!
    
    let targetPageIndex: Int!
    
    init(array: [UIViewController], targetPageIndex: Int) {
        self.targetPageIndex = targetPageIndex
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
        self.arrayOfViewControllers = array
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayOfViewControllers[targetPageIndex]], direction: .forward, animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewUserPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = arrayOfViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return arrayOfViewControllers[index - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = arrayOfViewControllers.firstIndex(of: viewController) {
            if index < arrayOfViewControllers.count - 1 {
                return arrayOfViewControllers[index + 1]
            }
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayOfViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return targetPageIndex
    }
}
