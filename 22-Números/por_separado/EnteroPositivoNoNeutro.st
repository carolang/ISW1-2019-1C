'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:10 am'!
!classDefinition: #EnteroPositivoNoNeutro category: #'Numero-Exercise'!
EnteroNoNeutro subclass: #EnteroPositivoNoNeutro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroPositivoNoNeutro methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:10:48'!
dividiendoCoprimo: numerador
	^Fraccion with: numerador over: self! !

!EnteroPositivoNoNeutro methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:55:31'!
fibonacci
	|one two|
	one := Entero with: 1.
	two := Entero with: 2.
	^(self - one) fibonacci + (self - two) fibonacci.! !


!EnteroPositivoNoNeutro methodsFor: 'testing' stamp: 'FA 4/15/2019 06:10:54'!
isNegative
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivoNoNeutro class' category: #'Numero-Exercise'!
EnteroPositivoNoNeutro class
	instanceVariableNames: ''!

!EnteroPositivoNoNeutro class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:23:25'!
with: aValue
	^self new initializeWith: aValue! !
