'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 22 April 2019 at 4:05:26 pm'!
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
