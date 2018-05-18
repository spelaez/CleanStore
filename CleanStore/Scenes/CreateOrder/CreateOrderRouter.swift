//
//  CreateOrderRouter.swift
//  CleanStore
//
//  Created by Santiago Peláez on 5/12/18.
//  Copyright (c) 2018 Santiago Peláez. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol CreateOrderRoutingLogic {
    func routeToListOrders(segue: UIStoryboardSegue?)
    func routeToShowOrder(segue: UIStoryboardSegue?)
}

protocol CreateOrderDataPassing
{
  var dataStore: CreateOrderDataStore? { get }
}

class CreateOrderRouter: NSObject, CreateOrderRoutingLogic, CreateOrderDataPassing {
  weak var viewController: CreateOrderViewController?
  var dataStore: CreateOrderDataStore?
  
  // MARK: Routing
    func routeToListOrders(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! ListOrdersViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToListOrders(source: dataStore!, destination: &destinationDS)
        } else {
            let index = viewController!.navigationController!.viewControllers.count - 2
            let destinationVC = viewController?.navigationController?.viewControllers[index] as! ListOrdersViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToListOrders(source: dataStore!, destination: &destinationDS)
            navigateToListOrders(source: viewController!, destination: destinationVC)
        }
    }
    
    //TODO: Show Order Routing
    func routeToShowOrder(segue: UIStoryboardSegue?) {
        
    }
    
    // MARK: Navigation
    func navigateToListOrders(source: CreateOrderViewController, destination: ListOrdersViewController) {
        source.navigationController?.popViewController(animated: true)
    }
    
//    func navigateToShowOrder(source: CreateOrderViewController, destination: ShowOrderViewController) {
//        source.navigationController?.popViewController(animated: true)
//    }
    
    // MARK: Passing data
    func passDataToListOrders(source: CreateOrderDataStore, destination: inout ListOrdersDataStore) {
    }
    
//    func passDataToShowOrder(source: CreateOrderDataStore, destination: inout ShowOrderDataStore) {
//        destination.order = source.orderToEdit
//    }
}
