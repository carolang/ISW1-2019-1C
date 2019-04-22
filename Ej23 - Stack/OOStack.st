'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 21 April 2019 at 8:40:04 pm'!
!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement _size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:32:26'!
initialize
	topElement := OOEmptyStackElement  new.
	_size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:35:42'!
isEmpty
	^(_size = 0).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:38:18'!
pop
	| previousTopElement |
	_size := ((_size - 1) max: 0).
	previousTopElement  := topElement.
	topElement := (topElement previousElement).
	^previousTopElement value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:39:49'!
push: anElement
	| newTop |
	newTop := OOFullStackElement  newWithValue: anElement withPrevious: topElement.
	topElement  := newTop.
	_size := (_size + 1).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 20:32:17'!
size
	^_size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C. L. 4/21/2019 18:37:34'!
top
	^topElement value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'C. L. 4/21/2019 18:19:25'!
newInitialized
	^(self new) initialize.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
