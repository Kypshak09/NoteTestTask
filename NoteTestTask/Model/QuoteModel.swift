//
//  QuoteModel.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 10.04.2023.
//

struct ResultElement: Codable {
    let q, a: String
}

typealias Result = [ResultElement]
