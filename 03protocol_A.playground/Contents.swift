import UIKit

//------------------------------------------------------------------------------
//         Designing with inheritance
//------------------------------------------------------------------------------

//class BaseTableViewController: UITableViewController {
//    func showLoader() {
//        print("Loading ...")
//    }
//    func showError() {
//        print("Oops, an error occurred")
//    }
//}
//
//class BaseSearchController: UISearchController {
//    func showLoader() {
//        print("Loading ...")
//    }
//    func showError() {
//        print("Oops, an error occurred")
//    }
//}
//
//class PeopleListViewControler: BaseTableViewController {
//    override func showError() {
//        print("Failed fetching nearby members")
//    }
//}
//
//class NewsViewController: BaseSearchController {
//}


//------------------------------------------------------------------------------
//         Designing with protocols
//------------------------------------------------------------------------------

protocol Loadable {
    func showLoader()
}

extension Loadable {
    func showLoader() {
        print("Loading ...")
    }
}

protocol Failable {
    func showError()
}

extension Failable {
    func showError() {
        print("Oops, an error occurred")
    }
}


class NewsViewController: UISearchController, Loadable, Failable {
}

class PeopleListViewControler: UITableViewController, Loadable, Failable {
    func showError() {
        print("Failed fetching nearby members")
    }
}


//------------------------------------------------------------------------------
//         Compute
//------------------------------------------------------------------------------
let peopleListVC = PeopleListViewControler()
peopleListVC.showLoader()
peopleListVC.showError()
let newsVC = NewsViewController()
newsVC.showLoader()
newsVC.showError()


