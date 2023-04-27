//
//  SetupTableViewCell.swift
//  Task
//
//  Created by Mohan K on 18/11/22.
//

import UIKit

class SetupTableViewCell: UITableViewCell {

    static let identifier = "SetupTableViewCell"
     
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()

//    private let iconImage: UILabel = {
//        let image = UILabel()
////        imageView.tintColor = .white
//       image.contentMode = .scaleAspectFit
//        return image
//
//    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
//       label.backgroundColor = .gray
        return label
    }()
    
    private let label1: UILabel = {
        let label1 = UILabel()
        label1.numberOfLines = 2
       label1.backgroundColor = .blue

        return label1
    }()
    
    private let label2: UILabel = {
        let label2 = UILabel()
        label2.numberOfLines = 2
       label2.backgroundColor = .yellow

        return label2
    }()
    
    private let label3: UILabel = {
        let label3 = UILabel()
        label3.numberOfLines = 1
       label3.backgroundColor = .systemBlue
        
        return label3
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
//       contentView.addSubview(iconContainer)
//        iconContainer.addSubview(iconImage)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
       fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        label2.frame = CGRect(x: 5, y: 6, width: size, height: size)
        
        let image: CGFloat = size/1.5
//        iconImage.frame = CGRect(x: (size-image)/2, y: (size-image)/2, width: image, height: image)
//
//        iconImage.center = label2.center
     
        
        label.frame = CGRect(x: 10 + label2.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 15 - label2.frame.size.width - 10,
                             height: 50 )
        
        
        
        label1.frame = CGRect(x: 10 + label2.frame.size.width,
                              y: 50,
                             width: contentView.frame.size.width - 15 - label2.frame.size.width - 10,
                             height: 50 )
        
        label3.frame = CGRect(x: 10 + label.frame.size.width,
                              y: 0,
                             width: contentView.frame.size.width - 10 - label2.frame.size.width - 10,
                             height: 20 )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        iconImageView.image = nil
        label.text = nil
        label1.text = nil
        label2.text = nil
        label3.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with model: SettingsOption) {
        label.text = model.title
        label1.text = model.mode
        label2.text = model.icon
        label3.text = model.tracker
//        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
