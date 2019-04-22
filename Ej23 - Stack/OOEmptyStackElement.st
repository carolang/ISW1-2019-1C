'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 22 April 2019 at 4:05:22 pm'!
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
