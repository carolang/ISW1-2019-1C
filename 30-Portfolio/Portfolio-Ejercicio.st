!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:05:04'!
test01PortfolioHasSumOfAccountBalances
	
	|portfolioAccount1 portfolioAccount2 portfolio|
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	portfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	
	Deposit register: 100 on: portfolioAccount1.
	Deposit register: 200 on: portfolioAccount2.
	
	self assert: 300 = portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:09:00'!
test02PortfolioWorksWithPortfolios
	
	|portfolioAccount1 portfolioAccount2 portfolioAccount3 simplePortfolio composedPortfolio |
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	simplePortfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	portfolioAccount3 := ReceptiveAccount new.
	composedPortfolio := Portfolio with: simplePortfolio with: portfolioAccount3.
	
	Deposit register: 100 on: portfolioAccount1.
	Deposit register: 200 on: portfolioAccount2.
	Deposit register: 300 on: portfolioAccount3.
		
	self assert: 600 = composedPortfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:12:31'!
test03PortfolioKnowsItsTransactions
	
	|portfolioAccount1 portfolioAccount2 portfolioAccount3 simplePortfolio composedPortfolio deposit1 deposit2 withdraw |
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	simplePortfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	portfolioAccount3 := ReceptiveAccount new.
	composedPortfolio := Portfolio with: simplePortfolio with: portfolioAccount3.
	
	deposit1 := Deposit register: 100 on: portfolioAccount1.
	deposit2 := Deposit register: 200 on: portfolioAccount2.
	withdraw := Withdraw register: 300 on: portfolioAccount3.
		
	self assert: (composedPortfolio hasRegistered: deposit1).
	self assert: (composedPortfolio hasRegistered: deposit2).
	self assert: (composedPortfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 02:04:34'!
test04PortfolioDoesntKnowsForeignTransactions
	
	|portfolioAccount1 portfolioAccount2 nonPortfolioAccount simplePortfolio deposit withdraw |
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	simplePortfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	nonPortfolioAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: nonPortfolioAccount .
	withdraw := Withdraw register: 300 on: nonPortfolioAccount .
		
	self deny: (simplePortfolio hasRegistered: deposit).
	self deny: (simplePortfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:19:51'!
test05PortfolioTransactionsAreAllOfItsAccountTransactions
	
	|portfolioAccount1 portfolioAccount2 portfolioAccount3 simplePortfolio composedPortfolio deposit1 deposit2 withdraw |
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	simplePortfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	portfolioAccount3 := ReceptiveAccount new.
	composedPortfolio := Portfolio with: simplePortfolio with: portfolioAccount3.
	
	deposit1 := Deposit register: 100 on: portfolioAccount1.
	deposit2 := Deposit register: 200 on: portfolioAccount2.
	withdraw := Withdraw register: 300 on: portfolioAccount3.
		
	self assert: 3 = composedPortfolio transactions size.
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:39:12'!
test06PortfolioCannotBeCreatedWithPortfolioRepeatingAccount
	
	| portfolioAccount innerPortfolio |
	portfolioAccount  := ReceptiveAccount new.
	innerPortfolio := Portfolio with: portfolioAccount.
	self
		should: [ Portfolio with: portfolioAccount with: innerPortfolio ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio | self assert: Portfolio portfolioCantHaveRepeatedAccountsMessage = invalidPortfolio messageText ] 
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:38:18'!
test06PortfolioCannotBeCreatedWithRepeatedAccount
	
	|portfolioAccount |
	portfolioAccount  := ReceptiveAccount new.
	self
		should: [ Portfolio with: portfolioAccount with: portfolioAccount ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio | self assert: Portfolio portfolioCantHaveRepeatedAccountsMessage = invalidPortfolio messageText ] 
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 00:39:48'!
test07PortfolioCannotBeCreatedWithPortfoliosWithRepeatedAccount
	
	| portfolioAccount innerPortfolio1 innerPortfolio2 |
	portfolioAccount  := ReceptiveAccount new.
	innerPortfolio1 := Portfolio with: portfolioAccount.
	innerPortfolio2 := Portfolio with: portfolioAccount.
	self
		should: [ Portfolio with: portfolioAccount with: innerPortfolio1 with: innerPortfolio2 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio | self assert: Portfolio portfolioCantHaveRepeatedAccountsMessage = invalidPortfolio messageText ] 
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 01:19:07'!
test08PortfolioCannotBeCreatedWithEmptyRepeatedPortfolio
	
	| innerPortfolio |
	
	innerPortfolio := Portfolio withAll: #().
	
	self
		should: [ Portfolio with: innerPortfolio with: innerPortfolio ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio | self assert: Portfolio portfolioCantHaveRepeatedAccountsMessage = invalidPortfolio messageText ] 
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 01:20:00'!
test09PortfolioCannotBeCreatedWithPortfolioHavingEmptyRepeatedPortfolio
	
	| innerEmptyPortfolio innerNonEmptyPortfolio1 innerNonEmptyPortfolio2 |
	
	innerEmptyPortfolio := Portfolio withAll: #().
	innerNonEmptyPortfolio1 := Portfolio with: innerEmptyPortfolio.
      innerNonEmptyPortfolio2 := Portfolio with: innerEmptyPortfolio.
	
	self
		should: [ Portfolio with: innerNonEmptyPortfolio1 with: innerNonEmptyPortfolio2 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio | self assert: Portfolio portfolioCantHaveRepeatedAccountsMessage = invalidPortfolio messageText ] 
	
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Account methodsFor: 'testing' stamp: 'FA 5/27/2019 01:29:45'!
hasAnyAccountOf: otherAccount
	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'FA 5/27/2019 00:48:44'!
hasRegistered: transaction
	self subclassResponsibility ! !


!Account methodsFor: 'value' stamp: 'FA 5/27/2019 00:47:49'!
balance
	self subclassResponsibility ! !

!Account methodsFor: 'value' stamp: 'FA 5/27/2019 00:48:00'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'FA 5/27/2019 01:50:43'!
balance

	^self transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'initialization' stamp: 'FA 5/27/2019 01:38:25'!
initializeWith: someAccounts
	accounts := someAccounts.! !


!Portfolio methodsFor: 'testing' stamp: 'FA 5/27/2019 01:43:45'!
hasAnyAccountOf: otherAccount
	^self = otherAccount or: [ accounts anySatisfy: [ :account | otherAccount hasAnyAccountOf: account ] ].! !

!Portfolio methodsFor: 'testing' stamp: 'FA 5/27/2019 02:00:07'!
hasRegistered: transaction
	^accounts anySatisfy: [ :account | account hasRegistered: transaction ].! !


!Portfolio methodsFor: 'transactions' stamp: 'FA 5/27/2019 02:03:45'!
transactions

	^ accounts inject: OrderedCollection new into: [ :accumulatedTransactions :account | accumulatedTransactions addAll: account transactions. accumulatedTransactions ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'assertions' stamp: 'FA 5/27/2019 01:52:00'!
checkNoRepeatedAccounts: accounts
	
	(self hasRepeatedAccounts: accounts) ifTrue: [self error: self portfolioCantHaveRepeatedAccountsMessage ].
	(self theresInnerAccountRepetition: accounts) ifTrue: [self error: self portfolioCantHaveRepeatedAccountsMessage ].! !

!Portfolio class methodsFor: 'assertions' stamp: 'FA 5/27/2019 01:53:16'!
theresInnerAccountRepetition: accounts
	
	^ accounts anySatisfy: 
		[ :account1 | accounts anySatisfy: 
			[ :account2 | account1 ~= account2 and: [(account1 hasAnyAccountOf: account2) or: [account2 hasAnyAccountOf: account1]]]].! !


!Portfolio class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 01:33:03'!
hasRepeatedAccounts: accounts
	
	^ accounts size ~= accounts asSet size.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 01:01:00'!
with: account
	^ self withAll: (Array with: account).! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 01:01:11'!
with: account1 with: account2
	^ self withAll: (Array with: account1 with: account2).! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 02:05:46'!
with: account1 with: account2 with: account3
	^ self withAll: (Array with: account1 with: account2 with: account3).! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 01:02:57'!
withAll: accounts
	
	self checkNoRepeatedAccounts: accounts.

	^ self new initializeWith: accounts.	! !


!Portfolio class methodsFor: 'errors' stamp: 'FA 5/27/2019 01:21:40'!
portfolioCantHaveRepeatedAccountsMessage
	^ 'Portfolio cant have repeated accounts message'.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/23/2019 15:19:32'!
balance

	^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'FA 5/27/2019 01:39:55'!
hasAnyAccountOf: otherAccount
	^self = otherAccount.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !
