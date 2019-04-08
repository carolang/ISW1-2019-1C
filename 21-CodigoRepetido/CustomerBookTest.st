'From Cuis 5.0 of 7 November 2016 [latest update: #3685] on 8 April 2019 at 12:17:58 am'!
!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:31:46'!
checkIfRunningTimeIsBounded: aClosure withTimeLimit: timeLimit

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < timeLimit
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/7/2019 14:50:35'!
isSuspendedCustomerCorerctlyStoredInCustomerBook: aCustomerBook withCustomerName: aCustomerName suspendedCustomers: numberOfSuspendedCustomers isCustomerPresent: isCustomerPresent

	self assert: 0 equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfCustomers. 
	
	self assert: (aCustomerBook includesCustomerNamed: aCustomerName) equals: isCustomerPresent.

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:33:58'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self checkIfRunningTimeIsBounded: [customerBook addCustomerNamed: 'John Lennon'] withTimeLimit: (50*millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:33:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self checkIfRunningTimeIsBounded: [customerBook addCustomerNamed: paulMcCartney] withTimeLimit: (100*millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:56:48'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook actionHandler |
			
	customerBook := CustomerBook new.
	actionHandler := [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
	
	self tryAndCatch: [customerBook addCustomerNamed: ''] onException: Error do: actionHandler.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:57:59'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon actionHandler |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	actionHandler := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
		
	self tryAndCatch: [customerBook removeCustomerNamed: 'Paul McCartney'] onException: NotFound do: actionHandler.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/7/2019 14:58:47'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self isSuspendedCustomerCorerctlyStoredInCustomerBook: customerBook withCustomerName: paulMcCartney suspendedCustomers: 1 isCustomerPresent: true.
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/7/2019 15:03:13'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self isSuspendedCustomerCorerctlyStoredInCustomerBook: customerBook withCustomerName: paulMcCartney suspendedCustomers: 0 isCustomerPresent: false.


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/7/2019 15:08:50'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self tryAndCatch: [customerBook suspendCustomerNamed: 'Paul McCartney'.] onException: CantSuspend do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/7/2019 23:57:10'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self tryAndCatch: [ customerBook suspendCustomerNamed: johnLennon.] onException: CantSuspend do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'C. L. 4/4/2019 21:54:44'!
tryAndCatch: aClosureToTry onException: anException do: handlerAction
			
	[ aClosureToTry value.
	self fail ]
		on: anException
		do: handlerAction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: #'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook'!
