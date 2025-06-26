import SwiftUI

struct HideTabBarModifier: ViewModifier {
	 func body(content: Content) -> some View {
			content
				 .background(HideTabBarView())
	 }
}

struct HideTabBarView: UIViewControllerRepresentable {
	 func makeUIViewController(context: Context) -> UIViewController {
			let controller = UIViewController()
			controller.view.backgroundColor = .clear
			controller.hidesBottomBarWhenPushed = true
			return controller
	 }

	 func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

extension View {
	 func hideTabBar() -> some View {
			self.modifier(HideTabBarModifier())
	 }
}
