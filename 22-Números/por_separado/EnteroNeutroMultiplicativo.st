'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:19 am'!
!classDefinition: #EnteroNeutroMultiplicativo category: #'Numero-Exercise'!
Entero subclass: #EnteroNeutroMultiplicativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNeutroMultiplicativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:15:23'!
divideFromEntero: numerador
	^numerador! !

!EnteroNeutroMultiplicativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:07:39'!
dividiendoCoprimo: numerador
	^numerador! !

!EnteroNeutroMultiplicativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 07:03:02'!
fibonacci
	^Entero with: 1.! !

!EnteroNeutroMultiplicativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 07:03:17'!
greatestCommonDivisorWith: anInteger
	^self.! !


!EnteroNeutroMultiplicativo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:08:01'!
isNegative
	^false! !

!EnteroNeutroMultiplicativo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:08:07'!
isOne
	^true! !

!EnteroNeutroMultiplicativo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:08:04'!
isZero
	^false! !


!EnteroNeutroMultiplicativo methodsFor: 'value' stamp: 'FA 4/15/2019 06:07:53'!
integerValue
	^1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNeutroMultiplicativo class' category: #'Numero-Exercise'!
EnteroNeutroMultiplicativo class
	instanceVariableNames: 'instance'!

!EnteroNeutroMultiplicativo class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 05:58:40'!
new
	^instance! !


!EnteroNeutroMultiplicativo class methodsFor: 'initialization' stamp: 'FA 4/15/2019 06:25:14'!
initialize
	instance := self basicNew.! !


EnteroNeutroMultiplicativo initialize!
