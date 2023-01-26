//
//  NewUserPageViewController.swift
//  Waterly App
//
//  Created by Olegio on 25.01.2023.
//

import UIKit

final class NewUserPageViewController: UIPageViewController {
    
//    var arrayOfViewControllers: [UIViewController] = {
//        var arrayVc = [UIViewController]()
//        let firstPageVc = ModuleBuilder.configureNewUserFirstPageModule()
//        arrayVc.append(firstPageVc)
//        return arrayVc
//    }()
    
    var arrayOfViewControllers: [UIViewController]!
    
//    init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil, arrayOfVc: [UIViewController]) {
//        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
//        self.arrayOfViewControllers = arrayOfVc
//        setViewControllers([arrayOfViewControllers[0]], direction: .forward, animated: true)
//    }
    
    init(array: [UIViewController]) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
        self.arrayOfViewControllers = array
        setViewControllers([arrayOfViewControllers[0]], direction: .forward, animated: true)
    }
    
//    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
//        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
//
//        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
//        setViewControllers([arrayOfViewControllers[0]], direction: .forward, animated: true)
//    }

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
        return 0
    }
}
