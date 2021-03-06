"Filed out from Dolphin Smalltalk 7"!

AbstractDictionaryTest subclass: #DictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DictionaryTest guid: (GUID fromString: '{733B8918-1913-46DF-995E-67541BD596AA}')!
DictionaryTest comment: ''!
!DictionaryTest categoriesForClass!Unclassified! !
!DictionaryTest methodsFor!

collectionClass
	^Dictionary!

testAtIfAbsentPutValue
	| dictionary initialSize f |
	super testAtIfAbsentPutValue.
	dictionary := self newEmpty.
	initialSize := dictionary size.
	"Verify equal but not identical keys"
	f := 2.0.
	self assert: 2 hash equals: f hash.
	self assert: 2 equals: f.
	self assert: (dictionary at: 2 ifAbsentPutValue: f) == f.
	self assert: dictionary size == (initialSize + 1).
	self assert: (dictionary at: f ifAbsentPutValue: 2) == f.
	self assert: dictionary size == (initialSize + 1)! !
!DictionaryTest categoriesFor: #collectionClass!helpers!private! !
!DictionaryTest categoriesFor: #testAtIfAbsentPutValue!public!unit tests! !

