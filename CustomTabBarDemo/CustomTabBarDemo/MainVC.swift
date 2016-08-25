//
//  MainVC.swift
//  CustomTabBarDemo
//
//  Created by 也许、 on 16/8/25.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    var change:Bool?
    
    lazy var centerBtn:UIButton = {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        btn.addTarget(self, action: #selector(self.centerBtnClick), for: .touchUpInside)
        return btn
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let isChange = UserDefaults.standard.bool(forKey: "isChange")
        self.change = isChange
        if !isChange {
            // 第一种方式自定义tabBar
            setupAllChildrens()
            print("使用第一种方式自定义tabBar")
        } else {
            // 第二种方式自定义tabBar
            setupAllChildrensHelper()
            print("使用第二种方式自定义tabBar")
        }
        UserDefaults.standard.set(!isChange, forKey: "isChange")
        
    }
    
    // 添加所有的子控制器(第一种方式)
    func setupAllChildrens() {
        
        self.tabBar.tintColor = UIColor.orange
        self.setupChildren(childrenVC: FirstVC(), title: "首页", icon: "tabbar_home")
        self.setupChildren(childrenVC: SecondVC(), title: "消息", icon: "tabbar_message_center")
        // 添加一个空的控制器用来占位
        self.setupChildren(childrenVC: ThirdVC(), title: "", icon: "")
        self.setupChildren(childrenVC: FourthVC(), title: "发现", icon: "tabbar_discover")
        self.setupChildren(childrenVC: FifthVC(), title: "我", icon: "tabbar_profile")
        
    }
    
    // 添加所有子控制器(第二种方式)
    func setupAllChildrensHelper() {
        
        self.tabBar.tintColor = UIColor.orange
        self.setupChildren(childrenVC: FirstVC(), title: "首页", icon: "tabbar_home")
        self.setupChildren(childrenVC: SecondVC(), title: "消息", icon: "tabbar_message_center")
        self.setupChildren(childrenVC: FourthVC(), title: "发现", icon: "tabbar_discover")
        self.setupChildren(childrenVC: FifthVC(), title: "我", icon: "tabbar_profile")
        // 利用kvc，修改tabBar
        self.setValue(CustomTabBar(frame: self.tabBar.frame), forKey: "tabBar")
        
    }
    
    // 添加子控制器
    func setupChildren(childrenVC:UIViewController, title:String, icon:String) {
        
        childrenVC.title = title
        childrenVC.tabBarItem.title = title
        childrenVC.tabBarItem.image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
        childrenVC.tabBarItem.selectedImage = UIImage(named: String(format: "%@_highlighted", icon))?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(UINavigationController(rootViewController: childrenVC))
        
    }
    
    // 自定义中间按钮
    func centerBtnClick() {
        print(#function,"第一种方式.........")
    }
    
    // 调整中间的自定义按钮
    override func viewWillAppear(_ animated: Bool) {
        
        if !self.change! {
            let centerBtnW = self.tabBar.frame.width / CGFloat(self.childViewControllers.count)
            self.view.addSubview(self.centerBtn)
            self.centerBtn.frame = CGRect(x: 0, y: 0, width: centerBtnW, height: 43)
            self.centerBtn.center = self.tabBar.center
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
