'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 22 April 2019 at 2:05:17 pm'!
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
