//
//  ViewController.swift
//  StretchingImage
//
//  Created by Mikhail Andreev on 21.07.2023.
//

import UIKit

class ViewController: UIViewController
{
	private let imageHeight: CGFloat = 270

	private lazy var imageView: UIImageView = {
		let image = UIImage(named: "billy")
		let imageView = UIImageView(image: image)
		imageView.frame.size = .init(width: view.frame.width, height: imageHeight)
		imageView.frame.origin = .zero
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView(frame: view.frame)
		scrollView.contentSize.height = view.frame.height + imageHeight
		scrollView.delegate = self
		return scrollView
	}()

	override func viewDidLoad()
	{
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
	}
}

extension ViewController: UIScrollViewDelegate
{
	public func scrollViewDidScroll(_ scrollView: UIScrollView)
	{
		let offset = scrollView.contentOffset.y
		if offset <= .zero
		{
			imageView.frame.origin.y = offset
			imageView.frame.size.height = imageHeight - offset
		}
		scrollView.verticalScrollIndicatorInsets.top = imageHeight - offset - view.layoutMargins.top
	}
}
