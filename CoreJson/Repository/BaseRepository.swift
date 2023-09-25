//
//  BaseRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation

protocol BaseRepository {

    associatedtype T
    associatedtype P

    func create(record: T) -> P?
    func getAll() -> [T]?
//    func get(byIdentifier id: UUID) -> T?
//    func update(record: T) -> Bool
//    func delete(byIdentifier id: UUID) -> Bool
}
