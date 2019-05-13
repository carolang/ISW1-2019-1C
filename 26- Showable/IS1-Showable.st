!classDefinition: #TextFieldTest category: #'IS1-Showable'!
TestCase subclass: #TextFieldTest
	instanceVariableNames: 'drawn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!TextFieldTest methodsFor: 'tests' stamp: 'C. L. 5/13/2019 19:59:14'!
test01

	| juanPerez textField |
	
	juanPerez := Customer named: 'Juan' surnamed: 'Perez'.
	textField := TextField showing: (CustomerShowable new: juanPerez).
	
	textField showUsing: self.
	
	self assert: 'Perez, Juan' equals: drawn! !

!TextFieldTest methodsFor: 'tests' stamp: 'C. L. 5/13/2019 19:59:21'!
test02

	| paenza textField |
	
	paenza := Professor named: 'Paenza' teaches: 'Analisis I'.
	textField := TextField showing: (ProfessorShowable new: paenza).
	
	textField showUsing: self.
	
	self assert: 'Paenza -> Analisis I' equals: drawn! !

!TextFieldTest methodsFor: 'tests' stamp: 'C. L. 5/13/2019 19:59:29'!
test03

	| roque textField |
	
	roque := Student named: 'Roque Sanchez' identifiedAs: '233/19'.
	textField := TextField showing: (StudentShowable new: roque).
	
	textField showUsing: self.
	
	self assert: '233/19: Roque Sanchez' equals: drawn! !


!TextFieldTest methodsFor: 'showing' stamp: 'HAW 5/8/2019 18:48:56'!
show: aShowable

	drawn := aShowable ! !


!classDefinition: #AbstractShowable category: #'IS1-Showable'!
Object subclass: #AbstractShowable
	instanceVariableNames: '_person'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!AbstractShowable methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:56:04'!
asShowable
	^self subclassResponsibility .! !

!AbstractShowable methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:47:56'!
initializeWith: aPerson
	_person := aPerson .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AbstractShowable class' category: #'IS1-Showable'!
AbstractShowable class
	instanceVariableNames: ''!

!AbstractShowable class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:47:33'!
new: aPerson
	^self new initializeWith: aPerson.! !


!classDefinition: #CustomerShowable category: #'IS1-Showable'!
AbstractShowable subclass: #CustomerShowable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!CustomerShowable methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:56:25'!
asShowable
	^_person lastName, ', ', _person firstName.! !


!classDefinition: #ProfessorShowable category: #'IS1-Showable'!
AbstractShowable subclass: #ProfessorShowable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!ProfessorShowable methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:58:00'!
asShowable
	^_person name, ' -> ', _person subject.! !


!classDefinition: #StudentShowable category: #'IS1-Showable'!
AbstractShowable subclass: #StudentShowable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!StudentShowable methodsFor: 'as yet unclassified' stamp: 'C. L. 5/13/2019 19:59:00'!
asShowable
	^_person lu, ': ', _person name.! !


!classDefinition: #Customer category: #'IS1-Showable'!
Object subclass: #Customer
	instanceVariableNames: 'firstName lastName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!Customer methodsFor: 'xx' stamp: 'HAW 1/15/2019 22:59:13'!
m0

	1 yourself class.
	$a yourself ! !

!Customer methodsFor: 'xx' stamp: 'HAW 1/16/2019 00:11:15'!
m0: p1

	| c |
"
self new m0: 1.
self new m0: 1.0
self new m0: String
"
	1 yourself class.
	$a class.
	
	p1 class class class class class. 
	c := p1 class.
	c class! !

!Customer methodsFor: 'xx' stamp: 'HAW 12/21/2018 11:09:30'!
m11
"self new m11" 
	| q1 t2 t3 t4 t5 t6 t7 t8 t9 t10 |
	 
	q1 := nil.
	q1 := 1.
	q1 := q1 + (1/3).
	t2 := 2.0.
	t3 := 3.
	t4 := 4.
	t5 := 5.
	t6 := 6.
	t7 := 7.
	t8 := 8.
	t9 := t2+t3+t4+t5+t6+t7+t8.
	t10 := 'hola'.
	q1 := 'x'.
	t9 := t9+1.
	
	^t10! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/8/2019 18:47:08'!
initializeNamed: aFirstName surnamed: aLastName 

	firstName := aFirstName.
	lastName := aLastName ! !

!Customer methodsFor: 'initialization' stamp: 'HAW 12/24/2018 10:38:48'!
initializeNamed: aFirstName with: aLastName bornOn: aDateOfBirth
	
	firstName := aFirstName. 
	lastName := aLastName.
	dateOfBirth := aDateOfBirth! !


!Customer methodsFor: 'ppp' stamp: 'HAW 10/4/2018 16:22:52'!
m2

	self m1.
	^nil! !

!Customer methodsFor: 'ppp' stamp: 'HAW 10/4/2018 16:23:29'!
m5

	[ ^10 factorial ] value! !

!Customer methodsFor: 'ppp' stamp: 'HAW 10/4/2018 16:23:36'!
m6

	^false or: [ false ]! !

!Customer methodsFor: 'ppp' stamp: 'HAW 10/29/2018 05:46:50'!
m7

	^self! !

!Customer methodsFor: 'ppp' stamp: 'HAW 10/29/2018 06:03:40'!
m8: a

	^a! !

!Customer methodsFor: 'ppp' stamp: 'HAW 12/21/2018 11:07:25'!
m8a

	^true! !

!Customer methodsFor: 'ppp' stamp: 'HAW 2/21/2019 12:04:39'!
metodoClosure: p1

	| t1 t2 |
	
	t2 := { 1. 2. 3. }.
	t1 := t2 at: 1.
	[ | qq | qq _ 2 ] value.
	
	^t1 + p1! !


!Customer methodsFor: 'qqq' stamp: 'HAW 11/30/2018 14:46:58'!
m1
"self new m1"
	| t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 |
	 
	t1 := nil.
	t1 := 1.
	t1 := t1 + (1/3).
	t2 := 2.0.
	t3 := 3.
	t4 := 4.
	t5 := 5.
	t6 := 6.
	t7 := 7.
	t8 := 8.
	t9 := t2+t3+t4+t5+t6+t7+t8.
	t10 := 'hola'.
	t1 := 'x'.
	t9 := t9+1.
	^t10! !


!Customer methodsFor: 'apply primitives' stamp: 'HAW 10/4/2018 16:23:12'!
m3

	^true and: [ false ]
	! !


!Customer methodsFor: 'debugging' stamp: 'HAW 10/5/2018 18:00:31'!
m4

	[ :a | a factorial ] value: 10.
	[ :a | a factorial ] value: 10.! !


!Customer methodsFor: 'comparing' stamp: 'HAW 10/29/2018 05:50:07'!
m8

	^true! !


!Customer methodsFor: 'accessing' stamp: 'HAW 5/8/2019 18:56:10'!
firstName

	^firstName ! !

!Customer methodsFor: 'accessing' stamp: 'HAW 5/8/2019 18:56:15'!
lastName

	^lastName! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: #'IS1-Showable'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'instance creation' stamp: 'HAW 5/8/2019 18:45:58'!
named: aFirstName surnamed: aLastName

	^self new initializeNamed: aFirstName surnamed: aLastName ! !

!Customer class methodsFor: 'instance creation' stamp: 'HAW 9/17/2018 12:09'!
named: aFirstName with: aLastName bornOn: aDateOfBirth	^self new initializeNamed: aFirstName with: aLastName bornOn: aDateOfBirth	! !


!classDefinition: #Professor category: #'IS1-Showable'!
Object subclass: #Professor
	instanceVariableNames: 'name subject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!Professor methodsFor: 'accessing' stamp: 'HAW 5/8/2019 18:56:24'!
name

	^name! !

!Professor methodsFor: 'accessing' stamp: 'HAW 5/8/2019 18:56:31'!
subject

	^subject ! !


!Professor methodsFor: 'initialization' stamp: 'HAW 5/8/2019 18:55:22'!
initializeNamed: aName teaches: aSubject

	name := aName.
	subject := aSubject ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Professor class' category: #'IS1-Showable'!
Professor class
	instanceVariableNames: ''!

!Professor class methodsFor: 'instance creation' stamp: 'HAW 5/8/2019 18:55:01'!
named: aName teaches: aSubject

	^self new initializeNamed: aName teaches: aSubject

	! !


!classDefinition: #Student category: #'IS1-Showable'!
Object subclass: #Student
	instanceVariableNames: 'name lu'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!Student methodsFor: 'initialization' stamp: 'HAW 5/8/2019 18:59:31'!
initializeNamed: aName identifiedAs: aLU

	name := aName.
	lu := aLU ! !


!Student methodsFor: 'accessing' stamp: 'HAW 5/8/2019 19:02:21'!
lu

	^lu ! !

!Student methodsFor: 'accessing' stamp: 'HAW 5/8/2019 19:02:15'!
name

	^name ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Student class' category: #'IS1-Showable'!
Student class
	instanceVariableNames: ''!

!Student class methodsFor: 'instance creation' stamp: 'HAW 5/8/2019 18:59:07'!
named: aName identifiedAs: aLU

	^self new initializeNamed: aName identifiedAs: aLU! !


!classDefinition: #TextField category: #'IS1-Showable'!
Object subclass: #TextField
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Showable'!

!TextField methodsFor: 'showing' stamp: 'HAW 5/8/2019 18:37:32'!
showUsing: aCanvas

	aCanvas show: model asShowable! !


!TextField methodsFor: 'initialization' stamp: 'HAW 5/8/2019 18:48:04'!
initializeShowing: aModel

	model := aModel ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TextField class' category: #'IS1-Showable'!
TextField class
	instanceVariableNames: ''!

!TextField class methodsFor: 'instance creation' stamp: 'HAW 5/8/2019 18:47:46'!
showing: aModel

	^self new initializeShowing: aModel! !
