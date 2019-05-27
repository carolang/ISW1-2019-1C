!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

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

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 02:34:40'!
test10PortfolioBalancesOKWithADepositIntraPortfolio
	
	|portfolioAccount1 portfolioAccount2 portfolio|
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	portfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	
	Transfer registerFrom: portfolioAccount1 to: portfolioAccount2 forValue: 100.
	
	self assert: 0 = portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 02:35:01'!
test11PortfolioBalancesOKWithADepositOutPortfolio
	
	|portfolioAccount1 portfolioAccount2 portfolioAccount3 portfolio|
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	portfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	portfolioAccount3 := ReceptiveAccount new.
	
	Transfer registerFrom: portfolioAccount1 to: portfolioAccount3 forValue: 100.
	
	self assert: -100 = portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 02:43:41'!
test12PortfolioBalancesOKWithADepositOutPortfolioAndOneInPortfolio
	
	|portfolioAccount1 portfolioAccount2 portfolioAccount3 portfolio|
	portfolioAccount1  := ReceptiveAccount new.
	portfolioAccount2 := ReceptiveAccount new.
	portfolio := Portfolio with: portfolioAccount1 with: portfolioAccount2.
	portfolioAccount3 := ReceptiveAccount new.
	
	Transfer registerFrom: portfolioAccount1 to: portfolioAccount3 forValue: 100.
	Transfer registerFrom: portfolioAccount3 to: portfolioAccount1 forValue: 200.
	
	self assert: 100 = portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 03:20:01'!
test13PortfolioPrintsAccountSummary
	
	| readingAccount otherAccount readingPortfolio summary |
	readingAccount := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	readingPortfolio := Portfolio with: readingAccount.
	
	Deposit register: 100 on: readingAccount.
	Withdraw register: 50 on: readingAccount.
	Transfer registerFrom: readingAccount to: otherAccount forValue: 20.
	Transfer registerFrom: otherAccount to: readingAccount forValue: 30.
	
	summary := (AccountReport of: readingPortfolio) accountSummary.
	
	self assert: 4 = summary size.
	self assert: '#Depósito por 100.' = (summary at: 1).
	self assert: '#Extracción por 50.' = (summary at: 2).
	self assert: '#Salida por transferencia de 20.' = (summary at: 3).
	self assert: '#Entrada por transferencia de 30.' = (summary at: 4).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FA 5/27/2019 03:25:22'!
test14PortfolioPrintsTransferNet
	
	| readingAccount otherAccount readingPortfolio |
	readingAccount := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	readingPortfolio := Portfolio with: readingAccount.
	
	Deposit register: 100 on: readingAccount.
	Withdraw register: 50 on: readingAccount.
	Transfer registerFrom: readingAccount to: otherAccount forValue: 20.
	Transfer registerFrom: otherAccount to: readingAccount forValue: 30.
	
	self assert: 10 = (AccountReport of: readingPortfolio) transferNet.! !


!classDefinition: #ReceptiveAccountTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

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


!classDefinition: #Account category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

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


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

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


!Portfolio methodsFor: 'tracing' stamp: 'FA 5/27/2019 03:13:10'!
calculateSummary: reportVisitor

	self transactions do: [ :transaction | transaction calculateSummary: reportVisitor].! !

!Portfolio methodsFor: 'tracing' stamp: 'FA 5/27/2019 03:21:48'!
calculateTransferNet: reportVisitor

	self transactions do: [ :transaction | transaction calculateTransferNet: reportVisitor].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
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


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

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


!ReceptiveAccount methodsFor: 'tracing' stamp: 'FA 5/27/2019 03:13:15'!
calculateSummary: reportVisitor

	self transactions do: [ :transaction | transaction calculateSummary: reportVisitor].! !

!ReceptiveAccount methodsFor: 'tracing' stamp: 'FA 5/27/2019 03:21:55'!
calculateTransferNet: reportVisitor

	self transactions do: [ :transaction | transaction calculateTransferNet: reportVisitor].! !


!classDefinition: #AccountReport category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountReport
	instanceVariableNames: 'account summary net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountReport methodsFor: 'initialization' stamp: 'FA 5/27/2019 02:58:22'!
initializeWith: anAccount
	account := anAccount.! !


!AccountReport methodsFor: 'value' stamp: 'FA 5/27/2019 03:04:36'!
accountSummary

	summary := OrderedCollection new.
	
	account calculateSummary: self.
	
	^ summary! !

!AccountReport methodsFor: 'value' stamp: 'FA 5/27/2019 03:27:46'!
transferNet
	
	net := 0.
	
	account calculateTransferNet: self.
	
	^net.! !


!AccountReport methodsFor: 'summary' stamp: 'FA 5/27/2019 03:17:39'!
addDepositToSummary: aDeposit
	
	summary add: '#Depósito por ', aDeposit value abs printString, '.'.! !

!AccountReport methodsFor: 'summary' stamp: 'FA 5/27/2019 03:17:32'!
addTransferDepositToSummary: aTransferDeposit
	
	summary add: '#Entrada por transferencia de ', aTransferDeposit value abs printString, '.'.! !

!AccountReport methodsFor: 'summary' stamp: 'FA 5/27/2019 03:17:43'!
addTransferWithdrawToSummary: aTransferWithdraw
	
	summary add: '#Salida por transferencia de ', aTransferWithdraw value abs printString, '.'.! !

!AccountReport methodsFor: 'summary' stamp: 'FA 5/27/2019 03:17:46'!
addWithdrawToSummary: aWithdraw
	
	summary add: '#Extracción por ', aWithdraw value abs printString, '.'.! !


!AccountReport methodsFor: 'transfer net' stamp: 'FA 5/27/2019 03:24:10'!
addDepositTransferNet: aDeposit! !

!AccountReport methodsFor: 'transfer net' stamp: 'FA 5/27/2019 03:28:06'!
addTransferDepositTransferNet: aDeposit
	net := net + aDeposit value.! !

!AccountReport methodsFor: 'transfer net' stamp: 'FA 5/27/2019 03:24:38'!
addTransferWithdrawTransferNet: aWithdraw
	net := net + aWithdraw value.! !

!AccountReport methodsFor: 'transfer net' stamp: 'FA 5/27/2019 03:24:22'!
addWithdrawTransferNet: aWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 02:58:03'!
of: anAccount
	^ self new initializeWith: anAccount.! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'reports' stamp: 'FA 5/27/2019 03:10:06'!
calculateSummary: reportVisitor

	reportVisitor addDepositToSummary: self.! !

!Deposit methodsFor: 'reports' stamp: 'FA 5/27/2019 03:22:34'!
calculateTransferNet: reportVisitor

	reportVisitor addDepositTransferNet: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDepositLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferDepositLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDepositLeg methodsFor: 'value' stamp: 'FA 5/27/2019 02:30:13'!
transfer

	^transfer! !

!TransferDepositLeg methodsFor: 'value' stamp: 'FA 5/27/2019 02:31:18'!
value

	^transfer value.! !


!TransferDepositLeg methodsFor: 'initialization' stamp: 'FA 5/27/2019 02:29:59'!
initializeFromTransfer: aTransfer
	
	transfer := aTransfer.! !


!TransferDepositLeg methodsFor: 'reports' stamp: 'FA 5/27/2019 03:10:28'!
calculateSummary: reportVisitor

	reportVisitor addTransferDepositToSummary: self.! !

!TransferDepositLeg methodsFor: 'reports' stamp: 'FA 5/27/2019 03:22:53'!
calculateTransferNet: reportVisitor

	reportVisitor addTransferDepositTransferNet: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDepositLeg class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDepositLeg class
	instanceVariableNames: ''!

!TransferDepositLeg class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 02:28:20'!
fromTransfer: transfer
	^ self new initializeFromTransfer: transfer.! !


!classDefinition: #TransferWithdrawLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferWithdrawLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'value' stamp: 'FA 5/27/2019 02:30:53'!
transfer

	^transfer! !

!TransferWithdrawLeg methodsFor: 'value' stamp: 'FA 5/27/2019 02:41:10'!
value

	^transfer value * -1.! !


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'FA 5/27/2019 03:10:44'!
calculateSummary: reportVisitor

	reportVisitor addTransferWithdrawToSummary: self.! !

!TransferWithdrawLeg methodsFor: 'reports' stamp: 'FA 5/27/2019 03:23:21'!
calculateTransferNet: reportVisitor

	reportVisitor addTransferWithdrawTransferNet: self! !


!TransferWithdrawLeg methodsFor: 'initialization' stamp: 'FA 5/27/2019 02:29:48'!
initializeFromTransfer: aTransfer
	
	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdrawLeg class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdrawLeg class
	instanceVariableNames: ''!

!TransferWithdrawLeg class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 02:28:31'!
fromTransfer: transfer
	^ self new initializeFromTransfer: transfer.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'reports' stamp: 'FA 5/27/2019 03:10:56'!
calculateSummary: reportVisitor

	reportVisitor addWithdrawToSummary: self.! !

!Withdraw methodsFor: 'reports' stamp: 'FA 5/27/2019 03:23:41'!
calculateTransferNet: reportVisitor

	reportVisitor addWithdrawTransferNet: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'extractionLegAccount depositLegAccount value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'legs' stamp: 'FA 5/27/2019 02:39:00'!
asDeposit
	^ TransferDepositLeg fromTransfer: self.! !

!Transfer methodsFor: 'legs' stamp: 'FA 5/27/2019 02:39:04'!
asWithdraw
	^ TransferWithdrawLeg fromTransfer: self.! !


!Transfer methodsFor: 'value' stamp: 'FA 5/27/2019 02:42:48'!
value

	^value! !


!Transfer methodsFor: 'initialization' stamp: 'FA 5/27/2019 02:38:31'!
initializeFrom: fromAccount depositTo: toAccount forValue: aValue
	
	extractionLegAccount := fromAccount .
	depositLegAccount := toAccount.
	value := aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 02:37:37'!
from: fromAccount to: toAccount forValue: value
	^ self new initializeFrom: fromAccount depositTo: toAccount forValue: value.! !

!Transfer class methodsFor: 'instance creation' stamp: 'FA 5/27/2019 03:19:08'!
registerFrom: fromAccount to: toAccount forValue: value
	
	| transaction |
	
	transaction := self from: fromAccount to: toAccount forValue: value.
	fromAccount register: (transaction asWithdraw).
	toAccount register: (transaction asDeposit).
	
	^ transaction.! !
