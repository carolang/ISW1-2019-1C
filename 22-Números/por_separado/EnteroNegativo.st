'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:13 am'!
!classDefinition: #EnteroNegativo category: #'Numero-Exercise'!
EnteroNoNeutro subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:51:17'!
dividiendoCoprimo: numerador
	^self negated dividiendoCoprimo: (numerador negated).! !

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:54:06'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription! !


!EnteroNegativo methodsFor: 'testing' stamp: 'FA 4/15/2019 06:09:52'!
isNegative
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: #'Numero-Exercise'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:23:22'!
with: aValue
	^self new initializeWith: aValue! !


!EnteroNegativo class methodsFor: 'error descriptions' stamp: 'FA 4/15/2019 07:11:05'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !
