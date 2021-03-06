//
//  CreateOrderPresenter.swift
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

protocol CreateOrderPresentationLogic
{
  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
}

class CreateOrderPresenter: CreateOrderPresentationLogic
{
  weak var viewController: CreateOrderDisplayLogic?
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    return dateFormatter
  }()

  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
    let date = dateFormatter.string(from: response.date)
    let viewModel = CreateOrder.FormatExpirationDate.ViewModel(date: date)
    viewController?.displayExpirationDate(viewModel: viewModel)
  }
}
