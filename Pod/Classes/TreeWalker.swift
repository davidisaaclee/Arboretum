//
//  TreeWalker.swift
//  Pods
//
//  Created by David Lee on 2/6/16.
//
//

import Foundation

public protocol TreeWalker {
	typealias TreeType: Tree
	typealias ChildIndex

	init(tree: TreeType)

	var current: TreeType { get }

	func walkToChildAtIndex(childIndex: ChildIndex) -> Self?
	func walkToParent() -> Self?
}

public extension TreeWalker
	where TreeType: TreeWithFiniteChildren,
				TreeType.ChildSequence.Generator.Element == TreeType,
				TreeType.ChildSequence.Index == ChildIndex,
				TreeType.ParentType == TreeType {

	func walkToChildAtIndex(childIndex: ChildIndex) -> Self? {
		// TODO: Check if this child exists.
		let child = self.current.children[childIndex]
		return self.dynamicType.init(tree: child)
	}

	func walkToParent() -> Self? {
		guard let parent = self.current.parent else {
			return nil
		}

		return self.dynamicType.init(tree: parent)
	}

}
