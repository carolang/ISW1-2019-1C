'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:07 am'!
!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:17:13'!
* aMultiplier 
	^aMultiplier multiplyFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:12:06'!
+ anAdder 
	^anAdder addFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:27:53'!
- aSubtrahend 
	^aSubtrahend subtractFromFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:46:45'!
/ aDivisor 
	^aDivisor divideFromFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:39:49'!
addEntero: anAdder 
	^(denominator * anAdder + numerator) / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:07:27'!
addFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:44:53'!
divideFromEntero: aDividend 
	^(aDividend * denominator) / numerator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:39:07'!
divideFromFraccion: aDividend 
	^(aDividend numerator * denominator) / (numerator * aDividend denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:16:27'!
multiplyEntero: aMultiplier 
	^(numerator * aMultiplier) / denominator.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:16:06'!
multiplyFraccion: aMultiplier 
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:26:29'!
subtractFromEntero: aMinuend
	^((aMinuend * denominator) - numerator) / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:27:37'!
subtractFromFraccion: aMinuend
	
	| newNumerator newDenominator |
	
	newNumerator := (denominator * aMinuend numerator) - (numerator * aMinuend denominator).
	newDenominator := denominator * aMinuend denominator.
	
	^newNumerator / newDenominator 
! !


!Fraccion methodsFor: 'comparing' stamp: 'FA 4/15/2019 06:48:50'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator = anObject numerator) and: [denominator = anObject denominator]].! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:28:51'!
with: numerator over: denominator

	^self new initializeWith: numerator over: denominator
	! !
