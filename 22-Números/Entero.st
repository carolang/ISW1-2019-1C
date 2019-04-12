'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 11 April 2019 at 9:51:03 pm'!
!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
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

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:01:42'!
addEntero: anAdder 
	^self class with: value + anAdder integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:11:06'!
addFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := self * (anAdder denominator) + (anAdder numerator).
	newDenominator := anAdder denominator.
	^(newNumerator / newDenominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:42:28'!
divideFromEntero: aDividend
	^Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:43:17'!
divideFromFraccion: aDividend
	^Fraccion with: (aDividend numerator) over: (self * aDividend denominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:13:59'!
multiplyEntero: aMultiplier 
	^self class with: value * aMultiplier integerValue
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:15:46'!
multiplyFraccion: aMultiplier 
	^(aMultiplier numerator * self) / (aMultiplier denominator).
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:39:36'!
subtractFromEntero: aMinuend
	^self class with: ((aMinuend integerValue) - (self integerValue)).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'C. L. 4/11/2019 21:31:20'!
subtractFromFraccion: aMinuend
	^(aMinuend numerator - (self * aMinuend denominator)) / (aMinuend denominator).! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !
