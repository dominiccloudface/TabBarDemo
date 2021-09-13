//
//  TabBarDemoTests.swift
//  TabBarDemoTests
//
//  Created by Dominic Wood on 10/09/2021.
//

import XCTest
@testable import TabBarDemo

class TabBarDemoTests: XCTestCase {

    func testArticle() throws {
        let mockArticle = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
       
        XCTAssertNotNil(mockArticle)
    }
    
    func testMVVMArticlesModel() throws {
        let mockArticle = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        let mockArticle2 = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        
        var testModel = MVVMArticlesModel()
        testModel.articles = [mockArticle, mockArticle2]
        
        XCTAssertTrue(testModel.articles.count == 2)
    }
    
    func testMVVMArticleCellViewModel() throws {
        let mockArticle = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        
        let testViewModel = MVVMArticleCellViewModel()
        testViewModel.article = mockArticle
        
        XCTAssertEqual(testViewModel.getTitleText(), "The title")
        XCTAssertEqual(testViewModel.getDescriptionText(), "The Description")
    }
    
    func testMVVMDetailArticleViewModel() throws {
        let mockArticle = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        
        let testViewModel = MVVMDetailArticleViewModel()
        testViewModel.article = mockArticle
        
        XCTAssertEqual(testViewModel.getTitleText(), "The title")
        XCTAssertEqual(testViewModel.getDescriptionText(), "The Description")
        XCTAssertEqual(testViewModel.getCategoriesText(), "GBP,FXB")
        XCTAssertEqual(testViewModel.getInstrumentsText(), "GBP,FXB")
        XCTAssertEqual(testViewModel.getTagsText(), "GBP,FXB")
        XCTAssertEqual(testViewModel.getNewsKeywordsText(), "GBP, EURGBP, UK GDP, UK industrial production, UK inflation")
        XCTAssertEqual(testViewModel.getMainImageUrl(), URL(string: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg"))
    }
    
    func testMVVMArticlesViewModel() throws {
        let mockArticle = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        let mockArticle2 = Article(title: "The title", description: "The Description", url: "https://google.com", firstImageUrl: nil, headlineImageUrl: "https://a.c-dn.net/b/3GfDvh/headline_ukretail.jpg", backgroundImageUrl: nil, newsKeywords: "GBP, EURGBP, UK GDP, UK industrial production, UK inflation", instruments: ["GBP,FXB"], tags: ["GBP,FXB"], categories: ["GBP,FXB"])
        
        let testViewModel = MVVMArticlesViewModel()
        var model = MVVMArticlesModel()
        model.articles = [mockArticle, mockArticle2]
        testViewModel.model = model
        
        XCTAssertEqual(testViewModel.getCellHeight(), 148.0)
        XCTAssertEqual(testViewModel.getArticleFor(indexPath: IndexPath(row: 0, section: 0)), mockArticle)
    }
    
    func testCurrency() throws {
        let mockCurrency = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        
        XCTAssertNotNil(mockCurrency)
    }
    
    func testMVVMMarketsModel() throws {
        let mockCurrency = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        let mockCurrency2 = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        
        var testModel = MVVMMarketsModel()
        testModel.markets = [mockCurrency, mockCurrency2]
       
        XCTAssertTrue(testModel.markets.count == 2)
    }
    
    func testMVVMMarketCellViewModel() throws {
        let mockCurrency = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        
        let viewModel = MVVMMarketCellViewModel()
        viewModel.market = mockCurrency
        
        XCTAssertEqual(viewModel.getNameText(), "EUR/AUD")
    }
    
    func testMVVMMarketsViewModel() throws {
        let mockCurrency = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        let mockCurrency2 = Currency(displayName: "EUR/AUD", marketId: "EURAUD", epic: "CS.D.EURAUD.CFD.IP", rateDetailURL: "https://www.dailyfx.com/eur-aud", calendarMappping: ["EUR","AUD"])
        
        var mockModel = MVVMMarketsModel()
        mockModel.markets = [mockCurrency, mockCurrency2]
        
        let viewModel = MVVMMarketsViewModel()
        viewModel.model = mockModel
        
        XCTAssertEqual(viewModel.getCellHeight(), 64.0)
        XCTAssertEqual(viewModel.getMarketFor(indexPath: IndexPath(row: 0, section: 0)), mockCurrency)
    }
}
