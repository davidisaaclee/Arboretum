//
//  Tree.swift
//  Pods
//
//  Created by David Lee on 2/6/16.
//
//

import Foundation

public protocol Tree {
	typealias ParentType
	typealias ChildSequence: SequenceType
	typealias ValueType

	var parent: ParentType? { get }
	var children: ChildSequence { get }
	var value: ValueType { get }
}


public protocol TreeWithFiniteChildren: Tree {
	typealias ChildSequence: CollectionType

	var children: ChildSequence { get }
}