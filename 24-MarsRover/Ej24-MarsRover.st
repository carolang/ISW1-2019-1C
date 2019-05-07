!classDefinition: #RoverInvalidCommand category: #'Ej24-MarsRover'!
Error subclass: #RoverInvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverInvalidCommand class' category: #'Ej24-MarsRover'!
RoverInvalidCommand class
	instanceVariableNames: ''!

!RoverInvalidCommand class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:34:17'!
signal
	"Overrides signaling message"
	^self new signal: (MarsRover invalidCommandErrorDescription ).! !


!classDefinition: #MarsRoverTest category: #'Ej24-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:08:53'!
getTestRover
	^MarsRover newWithPosition: (3@4) withOrientation: 'S'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:06:45'!
test01EmptyCommandsDontMoveTheRover
	| position orientation rover |
	position := 3@4.
	orientation := 'S'.
	
	rover := self getTestRover .
	rover moveWithCommands: ''.
	
	self assert: position equals: (rover position).
	self assert: orientation equals: (rover orientation).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:07:16'!
test02RoverMovesForwardCorrectly
	| position rover |
	position := 3@4.
	
	rover := self getTestRover .
	rover moveWithCommands: 'f'.
	
	self assert: (position + (0@-1)) equals: rover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:07:39'!
test03RoverMovesBackwardCorrectly
	| position rover |
	position := 3@4.
	
	rover := self getTestRover .
	rover moveWithCommands: 'b'.
	
	self assert: (position + (0@1)) equals: rover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:08:41'!
test04RoverRotatesLeftCorrectly
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'l'.
	
	self assert: (rover orientation) equals: 'E'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:52:50'!
test05RoverRotatesRightCorrectly
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'r'.
	
	self assert: (rover orientation) equals: 'O'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:53:05'!
test06ExceptionWhenTheRoverReceivesAnInvalidCommand
	| rover |
	
	rover := self getTestRover .
	self should: [ rover moveWithCommands: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:53:20'!
test07RoverCanExecuteTwoCommandsInSequence
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'lf'.
	
	self assert: rover position equals: (4@4).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:53:37'!
test08LongSequenceOfCharacters
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'fffrfflfffflffflbb'.
	
	self assert: (4@-5) equals: rover position.! !


!classDefinition: #CardinalPoint category: #'Ej24-MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:47:59'!
backward
	^(self forward) negated.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:46:29'!
forward
	^self subclassResponsibility .! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:46:11'!
rotateLeft
	^self subclassResponsibility .! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:46:16'!
rotateRight
	^self subclassResponsibility .! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:13:35'!
toString
	^self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: #'Ej24-MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:41:45'!
newWith: initialOrientation
	(initialOrientation = 'N') ifTrue: [^North new].
	(initialOrientation = 'O') ifTrue: [^West new].
	(initialOrientation = 'S') ifTrue: [^South new].
	(initialOrientation = 'E') ifTrue: [^East new].! !


!classDefinition: #East category: #'Ej24-MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:48:40'!
forward
	^(1@0).! !

!East methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:49:26'!
rotateLeft
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:49:21'!
rotateRight
	^South new.! !

!East methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:13:45'!
toString
	^'E'.! !


!classDefinition: #North category: #'Ej24-MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:49:41'!
forward
	^(0@1).! !

!North methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:50:04'!
rotateLeft
	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:50:11'!
rotateRight
	^East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:13:57'!
toString
	^'N'.! !


!classDefinition: #South category: #'Ej24-MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:50:30'!
forward
	^(0@-1).! !

!South methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:50:48'!
rotateLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:50:59'!
rotateRight
	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:14:12'!
toString
	^'S'.! !


!classDefinition: #West category: #'Ej24-MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:51:16'!
forward
	^(-1@0).! !

!West methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:51:29'!
rotateLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:51:38'!
rotateRight
	^North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:14:24'!
toString
	^'O'.! !


!classDefinition: #MarsRover category: #'Ej24-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: ''
	classVariableNames: '_orientation _position'
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:17:03'!
initializeWithPosition: initialPosition withOrientation: initialOrientation
	_position := initialPosition .
	_orientation := (CardinalPoint newWith: initialOrientation) .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:56:51'!
moveWithCommands: commands
	(commands isEmpty) ifFalse:[
		self moveWithSingleCommand: (commands at: 1).
		self moveWithCommands: (commands copyFrom: 2 to: (commands size)).
	].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:45:46'!
moveWithSingleCommand: command
	(command == $f) ifTrue: [_position := _position + (_orientation forward). ^_position].
	(command == $b) ifTrue: [_position := _position + (_orientation backward). ^_position].
	(command == $l) ifTrue: [_orientation := _orientation rotateLeft. ^_position].
	(command == $r) ifTrue: [_orientation := _orientation rotateRight. ^_position].
	^RoverInvalidCommand signal.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:13:08'!
orientation
	^_orientation toString.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 20:09:56'!
position
	^_position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ej24-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:32:55'!
invalidCommandErrorDescription
	^'The rover has received an invalid command'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:16:52'!
newWithPosition: initialPosition withOrientation: initialOrientation
	^(self new) initializeWithPosition: initialPosition withOrientation: initialOrientation .! !
