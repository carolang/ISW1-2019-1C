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

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:25:45'!
getTestRover
	^MarsRover onMarsPlanePoint: (3@4) withOrientation: 'S'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:21:07'!
test01EmptyCommandsDontMoveTheRover
	| position rover pointingDirection |
	position := 3@4.
	pointingDirection := 0@-1.
	
	rover := self getTestRover .
	rover moveWithCommands: ''.
	
	self assert: position equals: (rover position coordinates).
	self assert: pointingDirection equals: (rover orientation pointingDirection ).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:23:59'!
test02RoverMovesForwardCorrectly
	| position rover |
	position := 3@4.
	
	rover := self getTestRover .
	rover moveWithCommands: 'f'.
	
	self assert: (position + (0@-1)) equals: rover position coordinates.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:21:15'!
test03RoverMovesBackwardCorrectly
	| position rover |
	position := 3@4.
	
	rover := self getTestRover .
	rover moveWithCommands: 'b'.
	
	self assert: (position + (0@1)) equals: rover position coordinates.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 04:19:20'!
test04RoverRotatesLeftCorrectly
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'l'.
	
	self assert: (rover orientation pointingDirection) equals: 1@0.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 04:21:03'!
test05RoverRotatesRightCorrectly
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'r'.
	
	self assert: (rover orientation pointingDirection) equals: -1@0.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'C. L. 5/6/2019 21:53:05'!
test06ExceptionWhenTheRoverReceivesAnInvalidCommand
	| rover |
	
	rover := self getTestRover .
	self should: [ rover moveWithCommands: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:21:33'!
test07RoverCanExecuteTwoCommandsInSequence
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'lf'.
	
	self assert: rover position coordinates equals: (4@4).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:21:50'!
test08LongSequenceOfCharacters
	| rover |
	
	rover := self getTestRover .
	rover moveWithCommands: 'fffrfflfffflffflbb'.
	
	self assert: (4@-5) equals: rover position coordinates.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:38:59'!
test09RoverDoesQuarterTurnCorrectly
	| rover startingPosition |
	
	rover := self getTestRover .
	startingPosition := rover position coordinates.
	rover moveWithCommands: 'llfr'.
	
	self assert: startingPosition + (0@1) equals: rover position coordinates.
	self assert: East new pointingDirection  equals: rover orientation pointingDirection.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:38:49'!
test10RoverDoesHalfTurnCorrectly
	| rover startingPosition |
	
	rover := self getTestRover .
	startingPosition := rover position coordinates.
	rover moveWithCommands: 'llfrfrfr'.
	
	self assert: startingPosition + (1@0) equals: rover position coordinates.
	self assert: West new pointingDirection  equals: rover orientation pointingDirection.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FA 5/13/2019 05:41:29'!
test11RoverDoesFullTurnCorrectly
	| rover startingPosition |
	
	rover := self getTestRover .
	startingPosition := rover position coordinates. 
	rover moveWithCommands: 'llfrfrfrfr'.
	
	self assert: startingPosition equals: rover position coordinates.
	self assert: North new pointingDirection  equals: rover orientation pointingDirection.! !


!classDefinition: #CardinalPoint category: #'Ej24-MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!CardinalPoint methodsFor: 'printing' stamp: 'FA 5/13/2019 05:34:59'!
printOn: aStream
	aStream print: self class name.! !


!CardinalPoint methodsFor: 'relations' stamp: 'FA 5/13/2019 04:40:04'!
cardinalPoint180Degrees
	^self cardinalPoint90DegreesClockwise cardinalPoint90DegreesClockwise .! !

!CardinalPoint methodsFor: 'relations' stamp: 'FA 5/13/2019 03:47:25'!
cardinalPoint90DegreesClockwise
	^self subclassResponsibility .! !

!CardinalPoint methodsFor: 'relations' stamp: 'FA 5/13/2019 04:48:47'!
cardinalPoint90DegreesCounterClockwise
	^self cardinalPoint90DegreesClockwise cardinalPoint90DegreesClockwise cardinalPoint90DegreesClockwise ! !


!CardinalPoint methodsFor: 'value' stamp: 'FA 5/13/2019 03:46:56'!
pointingDirection
	^self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: #'Ej24-MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'instance creation' stamp: 'FA 5/13/2019 03:59:18'!
with: initialOrientation
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

!East methodsFor: 'relations' stamp: 'FA 5/13/2019 04:01:04'!
cardinalPoint90DegreesClockwise
	^South new.! !


!East methodsFor: 'value' stamp: 'FA 5/13/2019 04:02:01'!
pointingDirection
	^(1@0).! !


!classDefinition: #North category: #'Ej24-MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!North methodsFor: 'relations' stamp: 'FA 5/13/2019 04:04:25'!
cardinalPoint90DegreesClockwise
	^East new.! !


!North methodsFor: 'value' stamp: 'FA 5/13/2019 04:04:36'!
pointingDirection
	^(0@1).! !


!classDefinition: #South category: #'Ej24-MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!South methodsFor: 'relations' stamp: 'FA 5/13/2019 04:05:00'!
cardinalPoint90DegreesClockwise
	^West new.! !


!South methodsFor: 'value' stamp: 'FA 5/13/2019 04:05:07'!
pointingDirection
	^(0@-1).! !


!classDefinition: #West category: #'Ej24-MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!West methodsFor: 'relations' stamp: 'FA 5/13/2019 04:02:48'!
cardinalPoint90DegreesClockwise
	^North new.! !


!West methodsFor: 'value' stamp: 'FA 5/13/2019 04:03:00'!
pointingDirection
	^(-1@0).! !


!classDefinition: #MarsPosition category: #'Ej24-MarsRover'!
Object subclass: #MarsPosition
	instanceVariableNames: 'coordinates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!MarsPosition methodsFor: 'initialization' stamp: 'FA 5/13/2019 04:36:57'!
initializeWithCoordinates: someCoordinates
	coordinates := someCoordinates.! !


!MarsPosition methodsFor: 'movements' stamp: 'FA 5/13/2019 04:44:54'!
backwards: aCardinalPoint
	^self forward: (aCardinalPoint cardinalPoint180Degrees).! !

!MarsPosition methodsFor: 'movements' stamp: 'FA 5/13/2019 05:14:22'!
forward: aCardinalPoint
	^MarsPosition withCoordinates: aCardinalPoint pointingDirection + self coordinates.! !


!MarsPosition methodsFor: 'printing' stamp: 'FA 5/13/2019 05:31:37'!
printOn: aStream

	aStream print: self coordinates. ! !


!MarsPosition methodsFor: 'testing' stamp: 'FA 5/13/2019 04:41:54'!
coordinates
	^coordinates! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsPosition class' category: #'Ej24-MarsRover'!
MarsPosition class
	instanceVariableNames: ''!

!MarsPosition class methodsFor: 'instance creation' stamp: 'FA 5/13/2019 04:37:32'!
withCoordinates: someCoordinates
	^self new initializeWithCoordinates: someCoordinates.! !


!classDefinition: #MarsRover category: #'Ej24-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ej24-MarsRover'!

!MarsRover methodsFor: 'accesing' stamp: 'FA 5/13/2019 04:07:39'!
orientation
	^orientation.! !

!MarsRover methodsFor: 'accesing' stamp: 'FA 5/13/2019 04:07:33'!
position
	^position.! !


!MarsRover methodsFor: 'commands execution' stamp: 'FA 5/13/2019 05:41:44'!
executeCommands: commands
	(commands isEmpty) ifFalse:[
		self executeCommand: (commands at: 1).
		self moveWithCommands: (commands copyFrom: 2 to: (commands size)).
	].! !


!MarsRover methodsFor: 'commands execution - private' stamp: 'FA 5/13/2019 04:56:23'!
executeCommand: command
	(command == $f) ifTrue: [self goForward. ^self]. "Es razonable responder self aca?"
	(command == $b) ifTrue: [self goBackwards. ^self].
	(command == $l) ifTrue: [self rotate90DegreesCounterClockwise. ^self ].
	(command == $r) ifTrue: [self rotate90DegreesClockwise. ^self ].
	^RoverInvalidCommand signal.! !


!MarsRover methodsFor: 'initialization' stamp: 'FA 5/13/2019 04:42:37'!
initializeOnMarsPlanePoint: startingPosition withOrientation: startingOrientation
	position := (MarsPosition withCoordinates: startingPosition) .
	orientation := (CardinalPoint with: startingOrientation) .! !


!MarsRover methodsFor: 'movements' stamp: 'FA 5/13/2019 04:52:54'!
goBackwards
	position := self position backwards: self orientation.! !

!MarsRover methodsFor: 'movements' stamp: 'FA 5/13/2019 05:09:15'!
goForward
	position := self position forward: self orientation.! !

!MarsRover methodsFor: 'movements' stamp: 'FA 5/13/2019 04:46:26'!
rotate90DegreesClockwise
	orientation := self orientation cardinalPoint90DegreesClockwise .! !

!MarsRover methodsFor: 'movements' stamp: 'FA 5/13/2019 04:46:19'!
rotate90DegreesCounterClockwise
	orientation := self orientation cardinalPoint90DegreesCounterClockwise .! !


!MarsRover methodsFor: 'printing' stamp: 'FA 5/13/2019 05:34:00'!
printOn: aStream

	aStream print: self position.
	aStream space.
	aStream print: self orientation.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ej24-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FA 5/13/2019 03:55:27'!
initialize
	uniqueInstance := self basicNew! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/6/2019 21:32:55'!
invalidCommandErrorDescription
	^'The rover has received an invalid command'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FA 5/13/2019 04:13:58'!
onMarsPlanePoint: position withOrientation: orientation
	^(self new) initializeOnMarsPlanePoint: position withOrientation: orientation .! !

MarsRover initialize!