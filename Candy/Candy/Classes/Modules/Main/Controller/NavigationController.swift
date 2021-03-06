//
//  NavigationController.swift
//  RxSwiftDemo
//
//  Created by 左聂荣 on 2019/12/31.
//  Copyright © 2019 左聂荣. All rights reserved.
//

import UIKit
import EachNavigationBar

class NavigationController: UINavigationController {

    // MARK: - View LifeCycle
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }

    override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigation.configuration.isEnabled = true
        navigation.configuration.barTintColor = UIColor.App.master
        navigation.configuration.tintColor = UIColor.App.text_FFFFFF
        navigation.configuration.isShadowHidden = true
        navigation.configuration.backItem = Configuration.BackItem(style: .image(R.image.nav_back_white()))
        navigation.configuration.titleTextAttributes = [
            .foregroundColor: UIColor.App.text_FFFFFF,
            .font: UIFont.fontOfDP(ofSize: 18, weight: .medium)
        ]
    }

    // MARK: - UINavigationControllerDelegate
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}

private extension NavigationController {
}
