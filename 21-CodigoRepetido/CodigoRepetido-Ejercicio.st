!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 02:22:27'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self checkThat: [customerBook addCustomerNamed: 'John Lennon'] runsWithinMilliseconds: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 03:08:43'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self checkThat: [customerBook removeCustomerNamed: paulMcCartney] runsWithinMilliseconds: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 02:35:31'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self checkThat: [customerBook addCustomerNamed: ''] raisesException: Error 
		ensure: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 02:47:56'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self checkThat: [customerBook removeCustomerNamed: 'Paul McCartney'] 
		raisesException: NotFound 
		ensure: [ :anError | self checkCustomerBook: customerBook withOnlyCustomer: johnLennon ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 03:28:23'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkCustomerBook: customerBook withActiveCustomers: 0 andSuspendedCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 03:28:27'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkCustomerBook: customerBook withActiveCustomers: 0 andSuspendedCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 02:46:22'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self checkThat: [ customerBook suspendCustomerNamed: 'Paul McCartney'. ]
		raisesException: CantSuspend 
		ensure: [ :anError | self checkCustomerBook: customerBook withOnlyCustomer: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FA 4/8/2019 02:46:03'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self checkThat: [ customerBook suspendCustomerNamed: johnLennon ]
		raisesException: CantSuspend 
		ensure: [ :anError | self checkCustomerBook: customerBook withOnlyCustomer: johnLennon ]
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'FA 4/8/2019 03:28:15'!
checkCustomerBook: customerBook withActiveCustomers: active andSuspendedCustomers: suspended
	self assert: active + suspended equals: customerBook numberOfCustomers.
	self assert: active equals: customerBook numberOfActiveCustomers.
	self assert: suspended equals: customerBook numberOfSuspendedCustomers.
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'FA 4/8/2019 02:45:34'!
checkCustomerBook: customerBook withOnlyCustomer: customer
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: customer)
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'FA 4/8/2019 02:27:33'!
checkThat: aClosureToTry raisesException: anException ensure: ensureBlock
			
	[ aClosureToTry value.
	self fail ]
		on: anException
		do: ensureBlock! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'FA 4/8/2019 02:24:44'!
checkThat: aClosure runsWithinMilliseconds: timeLimitInMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < timeLimitInMilliseconds
	
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'FA 4/8/2019 01:33:13'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ].! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FA 4/8/2019 01:19:39'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	( self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FA 4/8/2019 03:29:42'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FA 4/8/2019 01:25:54'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^ NotFound signal]].

      ^ aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:22'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
