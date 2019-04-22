'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 22 April 2019 at 2:05:28 pm'!
!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/21/2019 21:19:53'!
test01EmptyStackReturnsEmpty
	| stack finder aPrefix |
	aPrefix := 'hi'.
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	
	self assert: ((finder find: aPrefix in: stack) size == 0) .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 13:30:34'!
test02IfFalseForAllStringsThenAnswerIsEmpty
	| stack finder aPrefix |
	aPrefix := 'hi'.
	stack := OOStack new.
	stack push: 'palabra'.
	stack push: 'h i'.
	
	finder := SentenceFinderByPrefix new.
	
	self assert: ((finder find: aPrefix in: stack) size == 0).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 14:04:22'!
test03BothTrueAndFalseSentences
	| stack finder aPrefix filteredWords |
	aPrefix := 'hi'.
	stack := OOStack new.
	stack push: 'historia antigua'.
	stack push: 'palabra'.
	stack push: 'hielo seco'.
	
	finder := SentenceFinderByPrefix new.
	filteredWords := finder find: aPrefix in: stack.
	
	self assert: (filteredWords size == 2).
	self assert: ((filteredWords at: 1) == 'hielo seco').
	self assert: ((filteredWords at: 2) == 'historia antigua').! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 13:42:40'!
test04ThePrefixCanBeTheWholeWord
	| stack finder aPrefix filteredWords |
	aPrefix := 'hi'.
	stack := OOStack new.
	stack push: 'hi'.
	
	finder := SentenceFinderByPrefix new.
	filteredWords := finder find: aPrefix in: stack.
	
	self assert: (filteredWords size == 1).
	self assert: ((filteredWords at: 1) == 'hi').! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 13:59:31'!
test05APrefixWithSpacesRaisesAnException
	| stack finder aPrefix|
	aPrefix := 'h i'.
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	
	self
		should: [finder find: aPrefix in: stack.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 14:00:00'!
test06APrefixStartingWithSpacesRaisesAnException
	| stack finder aPrefix|
	aPrefix := ' hi'.
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	
	self
		should: [finder find: aPrefix in: stack.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'C. L. 4/22/2019 14:01:35'!
test07EmptyPrefixRaisesAnException
	| stack finder aPrefix|
	aPrefix := ''.
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	
	self
		should: [finder find: aPrefix in: stack.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !
