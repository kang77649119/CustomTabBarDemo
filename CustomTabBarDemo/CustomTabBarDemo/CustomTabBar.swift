//
//  CustomTabBar.swift
//  CustomTabBarDemo
//
//  Created by 也许、 on 16/8/25.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {

    lazy var centerBtn:UIButton = {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        btn.addTarget(self, action: #selector(self.centerBtnClickHelper), for: .touchUpInside)
        return btn
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tintColor = UIColor.orange
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        var itemX:CGFloat = 0
        let itemW = self.bounds.size.width / CGFloat(self.items!.count + 1)
        let itemH = self.bounds.size.height
        let index = (self.items!.count + 1) / 2
        var i = 0
        
        for item in self.subviews {
        
            // 在UITabBar的子控件 有 "_UIBarBackground" 这个控件,不单单只有UITabBarButton，所以需要做判断
            if item.isKind(of: NSClassFromString("UITabBarButton")!) {
                if i == index {
                    i += 1
                }
                itemX = itemW * CGFloat(i)
                i += 1
                item.frame.origin = CGPoint(x: itemX, y: 0)
            }
            
        }
        
        // 添加自定义按钮
        self.addSubview(self.centerBtn)
        self.centerBtn.frame = CGRect(x: 0, y: 0, width: itemW, height: itemH)
        self.centerBtn.center.x = self.bounds.width * 0.5
        
    }
    
    func centerBtnClickHelper() {
        print(#function,"第二种方式~~~~~")
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
