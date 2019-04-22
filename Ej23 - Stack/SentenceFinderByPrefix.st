'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 22 April 2019 at 2:05:25 pm'!
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
