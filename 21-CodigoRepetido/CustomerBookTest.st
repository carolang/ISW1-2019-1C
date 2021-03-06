'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 8 April 2019 at 3:28:34 am'!
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
