!classDefinition: #ShoppingCartTest category: #'32-TusLibros.com'!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '32-TusLibros.com'!

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:31:18'!
test01CartsAreCreatedEmpty
    | cart |
    cart := ShoppingCart new.
    self assert: cart contents size = 0.! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:32:11'!
test02CannotAddLessThanOneBook
	| cart |

	cart := ShoppingCart new.
	self
	should: [ cart addItem: 'Learn You a Haskell for the Greater Good' withQty: 0 ]
	raise: Error
	withExceptionDo: [ :anError |
	self assert: cart contents size = 0.
	self assert: anError messageText = ShoppingCart invalidQuantityOfBooksErrorMessage. ]! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 05:03:55'!
test03CartCanAddABook
	| cart book |
	
	book := 'Learn you a Haskell for the Greater Good'.
	cart := ShoppingCart new.
	cart addItem: book withQty: 1.
	self assert: cart contents size = 1.
	self assert: (cart contents includes: book).! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:59:29'!
test04CartCanAddCopiesOfABook
	| cart book |

	book := 'Learn You a Haskell for the Greater Good'.
	cart := ShoppingCart new.
	cart addItem: book withQty: 5.
	self assert: cart contents size = 5.
	self assert: (5 = (cart contents occurrencesOf: book)).! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:59:44'!
test05CartCanContainDifferentBooks
	| cart book1 book2 |

	book1 := 'Learn You a Haskell for the Greater Good'.
	book2 := 'The Name of The Wind'.

	cart := ShoppingCart new.
	cart addItem: book1 withQty: 5.
	cart addItem: book2 withQty: 3.
	self assert: cart contents size = 8.
	self assert: (5 = (cart contents occurrencesOf: book1)).
	self assert: (3 = (cart contents occurrencesOf: book2)).! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:50:02'!
test06CannotAddBooksToCheckoutedCart
	| cart |
	cart := ShoppingCart new.
	cart checkout.

	self 
			should: [ cart addItem: 'Learn you a Haskell for the Greater Good' withQty: 2. ]
			raise: Error - MessageNotUnderstood 
			withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart cannotAddBooksToCheckoutedCartErrorMessage.]
	! !

!ShoppingCartTest methodsFor: 'testing' stamp: 'C. L. 6/3/2019 04:50:32'!
test07CannotCheckoutCheckoutedCart
	| cart |
	cart := ShoppingCart new.
	cart checkout.

	self 
			should: [ cart checkout. ]
			raise: Error - MessageNotUnderstood 
			withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart cannotCheckoutCheckoutedCartErrorMessage.]
	! !


!classDefinition: #ShoppingCart category: #'32-TusLibros.com'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'checkouted contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: '32-TusLibros.com'!

!ShoppingCart methodsFor: 'accessing' stamp: 'C. L. 6/3/2019 05:03:06'!
contents
	^contents.! !


!ShoppingCart methodsFor: 'modifying' stamp: 'C. L. 6/3/2019 04:58:24'!
addItem: item withQty: quantity
	(quantity < 1) ifTrue: [ self error: ShoppingCart invalidQuantityOfBooksErrorMessage. ].
	(checkouted) ifTrue: [self error: ShoppingCart cannotAddBooksToCheckoutedCartErrorMessage .].
	self contents add: item withOccurrences: quantity.! !

!ShoppingCart methodsFor: 'modifying' stamp: 'C. L. 6/3/2019 05:01:48'!
checkout
	(checkouted) ifTrue: [self error: ShoppingCart cannotCheckoutCheckoutedCartErrorMessage ].
	checkouted := true.! !


!ShoppingCart methodsFor: 'initialization' stamp: 'C. L. 6/3/2019 04:56:55'!
initialize
	contents := OrderedCollection new.
	checkouted := false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #'32-TusLibros.com'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'error messages' stamp: 'C. L. 6/3/2019 04:50:02'!
cannotAddBooksToCheckoutedCartErrorMessage
	^'Cannot add books to a cart that has already checked out'.! !

!ShoppingCart class methodsFor: 'error messages' stamp: 'C. L. 6/3/2019 04:50:32'!
cannotCheckoutCheckoutedCartErrorMessage
	^'Cannot checkout a cart that has already checked out'.! !

!ShoppingCart class methodsFor: 'error messages' stamp: 'C. L. 6/3/2019 04:30:22'!
invalidQuantityOfBooksErrorMessage
	^ 'Amount of books has to be at least 1'! !


!ShoppingCart class methodsFor: 'instance creation' stamp: 'C. L. 6/3/2019 04:56:10'!
new
	^super new initialize.! !
