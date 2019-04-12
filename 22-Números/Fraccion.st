'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 11 April 2019 at 9:51:09 pm'!
!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

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

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:03:09'!
addEntero: anAdder 
	^Fraccion with: (denominator * anAdder + numerator) over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:07:27'!
addFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:44:46'!
divideFromEntero: aDividend 
	^Fraccion with: (aDividend * denominator) over: numerator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:45:43'!
divideFromFraccion: aDividend 
	^Fraccion with: (aDividend numerator * denominator) over: (numerator * aDividend denominator).! !

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


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
