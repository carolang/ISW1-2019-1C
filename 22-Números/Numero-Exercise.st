!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


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

EnteroNeutroAditivo initialize!
EnteroNeutroMultiplicativo initialize!