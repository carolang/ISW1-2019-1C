'From Cuis 5.0 of 7 November 2016 [latest update: #3671] on 15 April 2019 at 7:17:30 am'!
!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:17:36'!
* aMultiplier 
	^aMultiplier multiplyEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:03:58'!
+ anAdder 
	^anAdder addEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:27:59'!
- aSubtrahend 
	^aSubtrahend subtractFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:46:30'!
/ aDivisor 
	^aDivisor divideFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:38:32'!
// aDivisor 
	
	^Entero with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:52:57'!
addEntero: anAdder 
	^Entero with: self integerValue + anAdder integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:11:06'!
addFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := self * (anAdder denominator) + (anAdder numerator).
	newDenominator := anAdder denominator.
	^(newNumerator / newDenominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:11:49'!
divideFromEntero: aDividend
	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:20:32'!
divideFromFraccion: aDividend
	^(aDividend numerator) / (self * aDividend denominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:07:16'!
dividiendoCoprimo: numerador
	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:01:57'!
greatestCommonDivisorWith: anInteger
	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:52:49'!
multiplyEntero: aMultiplier 
	^Entero with: self integerValue * aMultiplier integerValue
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:15:46'!
multiplyFraccion: aMultiplier 
	^(aMultiplier numerator * self) / (aMultiplier denominator).
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FA 4/15/2019 06:53:10'!
subtractFromEntero: aMinuend
	^Entero with: ((aMinuend integerValue) - (self integerValue)).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:31:20'!
subtractFromFraccion: aMinuend
	^(aMinuend numerator - (self * aMinuend denominator)) / (aMinuend denominator).! !


!Entero methodsFor: 'comparing' stamp: 'FA 4/15/2019 06:06:05'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'FA 4/15/2019 06:06:15'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'printing' stamp: 'FA 4/15/2019 06:05:05'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'value' stamp: 'FA 4/15/2019 06:02:06'!
integerValue
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'FA 4/15/2019 06:22:01'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [ ^EnteroNeutroAditivo new ].
	aValue = 1 ifTrue: [ ^EnteroNeutroMultiplicativo new ].
	
	^EnteroNoNeutro with: aValue! !
