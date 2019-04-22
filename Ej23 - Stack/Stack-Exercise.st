!classDefinition: #InvalidPrefix category: #'Stack-Exercise'!
Error subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: #'Stack-Exercise'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'as yet unclassified' stamp: 'C. L. 4/22/2019 13:50:32'!
signal
	^self signal: SentenceFinderByPrefix invalidPrefixErrorDescription .! !


!classDefinition: #PopFromEmptyStack category: #'Stack-Exercise'!
Error subclass: #PopFromEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PopFromEmptyStack class' category: #'Stack-Exercise'!
PopFromEmptyStack class
	instanceVariableNames: ''!

!PopFromEmptyStack class methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:18:40'!
signal
	"Overrides signaling message"
	^self new signal: (OOStack stackEmptyErrorDescription ).! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'C. L. 4/21/2019 18:35:30'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement _size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 20:35:42'!
isEmpty
	^(_size = 0).! !

!OOStack methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 20:32:17'!
size
	^_size.! !

!OOStack methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:37:34'!
top
	^topElement value.! !


!OOStack methodsFor: 'initialization' stamp: 'C. L. 4/21/2019 20:32:26'!
initialize
	topElement := OOEmptyStackElement  new.
	_size := 0.! !


!OOStack methodsFor: 'modifying' stamp: 'C. L. 4/21/2019 20:38:18'!
pop
	| previousTopElement |
	_size := ((_size - 1) max: 0).
	previousTopElement  := topElement.
	topElement := (topElement previousElement).
	^previousTopElement value.! !

!OOStack methodsFor: 'modifying' stamp: 'C. L. 4/21/2019 20:39:49'!
push: anElement
	| newTop |
	newTop := OOFullStackElement  newWithValue: anElement withPrevious: topElement.
	topElement  := newTop.
	_size := (_size + 1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'instance creation' stamp: 'C. L. 4/21/2019 18:19:25'!
newInitialized
	^(self new) initialize.! !


!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:06:13'!
previousElement
	^self subclassResponsibility.! !

!OOStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:07:41'!
value
	^self subclassResponsibility.! !


!classDefinition: #OOEmptyStackElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOEmptyStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:01:11'!
previousElement
	^self.! !

!OOEmptyStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 20:21:14'!
value
	^PopFromEmptyStack signal.! !


!classDefinition: #OOFullStackElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOFullStackElement
	instanceVariableNames: '_value _previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOFullStackElement methodsFor: 'initialization' stamp: 'C. L. 4/21/2019 18:26:05'!
initializeWithValue: aValue withPrevious: aPreviousElement
	_value := aValue.
	_previousElement := aPreviousElement.! !


!OOFullStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:06:39'!
previousElement
	^_previousElement .! !

!OOFullStackElement methodsFor: 'accessing' stamp: 'C. L. 4/21/2019 18:26:38'!
value
	^_value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOFullStackElement class' category: #'Stack-Exercise'!
OOFullStackElement class
	instanceVariableNames: ''!

!OOFullStackElement class methodsFor: 'instance creation' stamp: 'C. L. 4/21/2019 18:21:18'!
newWithValue: aValue withPrevious: aPreviousElement
	^(self new) initializeWithValue: aValue withPrevious: aPreviousElement.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'C. L. 4/22/2019 14:02:18'!
find: aPrefix in: aStack
	| res currentElement |
	
	(aPrefix includesSubString: ' ') ifTrue: [^InvalidPrefix signal].
	(aPrefix isEmpty) ifTrue: [^InvalidPrefix signal].
	
	res := OrderedCollection new.
	[aStack isEmpty] whileFalse: [
		currentElement  := aStack pop.
		(currentElement beginsWith: aPrefix) ifTrue: [res add: currentElement.].
	].
	^res.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'C. L. 4/22/2019 13:49:47'!
invalidPrefixErrorDescription
	^ 'The given prefix is invalid'.! !
