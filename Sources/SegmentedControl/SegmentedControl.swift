#if canImport(UIKit)

import UIKit
import OpenColorKit
import Pretendard
import ErrorKit

public final class SegmentedControl: UIControl {
    
    public class var noSegment: Int {
        -1
    }
    
    public var selectedSegmentIndex: Int {
        willSet {
            guard self.selectedSegmentIndex != Self.noSegment else {
                return
            }
            guard let segment = self.stackView.arrangedSubviews[self.selectedSegmentIndex] as? Segment else {
                fatalError(String(describing: TypeCastingError()))
            }
            segment.isSelected = false
        }
        didSet {
            assert(self.selectedSegmentIndex <= self.numberOfSegments)
            guard self.selectedSegmentIndex != Self.noSegment else {
                return
            }
            guard let segment = self.stackView.arrangedSubviews[self.selectedSegmentIndex] as? Segment else {
                fatalError(String(describing: TypeCastingError()))
            }
            segment.isSelected = true
            self.sendActions(for: .valueChanged)
        }
    }
    
    public var numberOfSegments: Int {
        self.stackView.arrangedSubviews.count
    }
    
    private let stackView: UIStackView
    
    public override init(frame: CGRect) {
        self.selectedSegmentIndex = Self.noSegment
        self.stackView = UIStackView()
        
        super.init(frame: frame)
        
        self.configureView()
        self.configureStackView()
        self.configureViewHierarchy()
        self.configureLayoutConstraints()
    }
    
    public convenience init(items: String...) {
        self.init(frame: .zero)
        
        items.enumerated().forEach { index, element in
            self.insertSegment(title: element, at: index)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 44.0)
    }
    
    public func insertSegment(title: String, at segmentIndex: Int) {
        assert(segmentIndex <= self.numberOfSegments)
        let segment = Segment(title: title)
        segment.addTarget(self, action: #selector(Self.segmentTapped(_:)), for: .touchUpInside)
        
        self.stackView.insertArrangedSubview(segment, at: segmentIndex)
    }
    
    public func removeSegment(at segmentIndex: Int) {
        let segment = self.stackView.arrangedSubviews[segmentIndex]
        defer {
            segment.removeFromSuperview()
        }
        self.stackView.removeArrangedSubview(segment)
    }
    
    public func removeAllSegments() {
        self.stackView.arrangedSubviews.forEach { element in
            self.stackView.removeArrangedSubview(element)
            element.removeFromSuperview()
        }
    }
}

extension SegmentedControl {
    
    @objc
    private func segmentTapped(_ sender: Segment) {
        guard let index = self.stackView.arrangedSubviews.firstIndex(of: sender) else {
            fatalError(String(describing: NotFoundError()))
        }
        
        guard index != self.selectedSegmentIndex else {
            return
        }
        
        self.selectedSegmentIndex = index
    }
}

extension SegmentedControl {
    
    private func configureView() {
        self.backgroundColor = .openColor.gray.gray1.color
    }
    
    private func configureStackView() {
        let stackView = self.stackView
        stackView.distribution = .fillEqually
        stackView.alignment = .center
    }
    
    private func configureViewHierarchy() {
        self.addSubview(self.stackView)
    }
    
    private func configureLayoutConstraints() {
        let stackView = self.stackView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
}

#endif
