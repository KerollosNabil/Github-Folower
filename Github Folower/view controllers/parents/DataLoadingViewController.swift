import UIKit

class DataLoadingViewController: UIViewController {

    private var containerView: UIView!
    
    func showLoadingView() {
        setupContainerView()
        addActivityIndicator()
        
    }
    private func setupContainerView() {
        containerView = UIView(frame: view.bounds )
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.4) {self.containerView.alpha = 0.8}
    }
    private func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String) {
        let emptyStateView = EmptyStateView(message: message)
        view.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        emptyStateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        emptyStateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        emptyStateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}
