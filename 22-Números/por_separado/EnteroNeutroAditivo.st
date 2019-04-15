'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:21 am'!
!classDefinition: #EnteroNeutroAditivo category: #'Numero-Exercise'!
Entero subclass: #EnteroNeutroAditivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNeutroAditivo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:14:32'!
divideFromEntero: numerador
	^self signalDivisionByZero! !

!EnteroNeutroAditivo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:02:45'!
dividiendoCoprimo: numerador
	^self signalDivisionByZero! !

!EnteroNeutroAditivo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 07:02:46'!
fibonacci
	^Entero with: 1.! !

!EnteroNeutroAditivo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:03:49'!
greatestCommonDivisorWith: aNumber
	^aNumber! !

!EnteroNeutroAditivo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:03:27'!
signalDivisionByZero
	^self error: self class canNotDivideByZeroErrorDescription ! !


!EnteroNeutroAditivo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:02:20'!
isNegativo
	^false! !

!EnteroNeutroAditivo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:02:17'!
isOne
	^false! !

!EnteroNeutroAditivo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:02:15'!
isZero
	^true! !


!EnteroNeutroAditivo methodsFor: 'value' stamp: 'FA 4/15/2019 06:04:04'!
integerValue
	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNeutroAditivo class' category: #'Numero-Exercise'!
EnteroNeutroAditivo class
	instanceVariableNames: 'instance'!

!EnteroNeutroAditivo class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:04:40'!
new
	^instance! !


!EnteroNeutroAditivo class methodsFor: 'error descriptions' stamp: 'FA 4/15/2019 07:11:52'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!EnteroNeutroAditivo class methodsFor: 'initialization' stamp: 'FA 4/15/2019 06:04:21'!
initialize
	instance := self basicNew.! !


EnteroNeutroAditivo initialize!
