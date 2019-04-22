'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 21 April 2019 at 8:40:17 pm'!
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
