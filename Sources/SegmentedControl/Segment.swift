#if canImport(UIKit)

import UIKit
import Pretendard
import OpenColorKit
import ErrorKit

public final class Segment: UIControl {
    
    public var title: String {
        get {
            self.titleLabel.text ?? ""
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    private let titleLabel: UILabel
    
    public override init(frame: CGRect) {
        self.titleLabel = UILabel()
        
        super.init(frame: frame)
        
        self.configureView()
        self.configureTitleLable()
        self.configureViewHierarchy()
        self.configureLayoutConstraints()
    }
    
    public convenience init(title: String) {
        self.init(frame: .zero)
        
        self.title = title
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override var isSelected: Bool {
        didSet {
            self.titleLabel.font = self.isSelected
            ? .pretendardFont(ofSize: 16.0, weight: .medium) as UIFont
            : .pretendardFont(ofSize: 14.0, weight: .regular) as UIFont
            self.titleLabel.textColor = self.isSelected
            ? .openColor.gray.gray7.color
            : .openColor.gray.gray5.color
        }
    }
}

extension Segment {
    
    private func configureView() {
        self.backgroundColor = .openColor.gray.gray0.color
    }
    
    private func configureTitleLable() {
        let titleLabel = self.titleLabel
        titleLabel.font = .pretendardFont(ofSize: 14.0, weight: .regular) as UIFont
        titleLabel.textColor = .openColor.gray.gray5.color
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .openColor.gray.gray1.color
    }
    
    private func configureViewHierarchy() {
        self.addSubview(self.titleLabel)
    }
    
    private func configureLayoutConstraints() {
        let titleLabel = self.titleLabel
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        ])
    }
}

#endif
