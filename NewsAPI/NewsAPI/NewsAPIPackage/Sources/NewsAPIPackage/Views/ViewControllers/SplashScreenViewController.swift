//
//  File.swift
//  
//
//  Created by Марк Киричко on 03.12.2022.
//

import Foundation
import UIKit
import SnapKit

@available(iOS 13.0, *)
public class SplashScreenViewController: UIViewController {
    
    var Image = UIImageView()
    var Text = UILabel()
    var animation = AnimationClass()
    var player = SoundClass()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        SetupConstraints()
        SplashScreen()
    }
    
    func setupView() {
        Image.image = SCImage(named: "news")
        Image.tintColor = .black
        self.view.addSubview(Image)
        Text.textAlignment = .center
        Text.font = UIFont(name: "Avenir-medium", size: 23)
        self.view.addSubview(Text)
    }
    
    func SetupConstraints() {
        
        Image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(250)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        Text.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(Image.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.leading.equalTo(Image)
            make.trailing.equalTo(Image)
        }
    }
    
    func SplashScreen() {
        
        animation.springImage(image: Image)
               
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player.PlaySound(resource: "newspaper.mp3")
            self.Text.text = "Новости 2022"
            self.animation.springLabel(label: self.Text)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let vc = HomeModule().buildDefault()
            guard let window = self.view.window else {return}
            window.rootViewController = vc
        }
    }
    
}
