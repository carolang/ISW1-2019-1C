'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:16 am'!
!classDefinition: #EnteroNoNeutro category: #'Numero-Exercise'!
Entero subclass: #EnteroNoNeutro
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNoNeutro methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:36:33'!
divideFromEntero: numerador
	
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := numerador greatestCommonDivisorWith: self. 
	numerator := numerador // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator dividiendoCoprimo: numerator! !

!EnteroNoNeutro methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:08:50'!
dividiendoCoprimo: numerador
	self subclassResponsibility ! !

!EnteroNoNeutro methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:30:34'!
greatestCommonDivisorWith: anInteger
	^ Entero with: (value gcd: anInteger integerValue).! !


!EnteroNoNeutro methodsFor: 'initialization' stamp: 'FA 4/15/2019 06:23:03'!
initializeWith: aValue
	value := aValue.! !


!EnteroNoNeutro methodsFor: 'testing' stamp: 'FA 4/15/2019 06:09:12'!
isNegative
	self subclassResponsibility ! !

!EnteroNoNeutro methodsFor: 'testing' stamp: 'FA 4/15/2019 06:09:17'!
isOne
	^false ! !

!EnteroNoNeutro methodsFor: 'testing' stamp: 'FA 4/15/2019 06:09:19'!
isZero
	^false ! !


!EnteroNoNeutro methodsFor: 'value' stamp: 'FA 4/15/2019 06:09:06'!
integerValue
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNoNeutro class' category: #'Numero-Exercise'!
EnteroNoNeutro class
	instanceVariableNames: ''!

!EnteroNoNeutro class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:22:53'!
with: aValue
	aValue < 0 ifTrue: [ ^EnteroNegativo with: aValue ].
	^EnteroPositivoNoNeutro with: aValue.! !
