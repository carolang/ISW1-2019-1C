!classDefinition: #TerniLapilliTest category: #'Ingsoft-TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:47:09'!
test01PutOOutOfTurnFails
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:44:30'!
test02PutXInAValidPositionWorks
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli putXAt: 2@3.! !


!classDefinition: #TableroTerniLapilli category: #'Ingsoft-TerniLapilli'!
Object subclass: #TableroTerniLapilli
	instanceVariableNames: 'positionsOfX positionsOfO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-TerniLapilli'!

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:25:53'!
completedDiagonal: positions
	^((1 to: 3) allSatisfy: [:e | positions includes: (e@e)]) or: ((1 to: 3) allSatisfy: [:e | positions includes: (e@(4 - e))]).! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:27:20'!
completedHorizontal: positions
	^(1 to: 3) anySatisfy: [:r | (1 to: 3) allSatisfy: [:c | positions includes: (r@c)]].! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:27:37'!
completedVertical: positions
	^(1 to: 3) anySatisfy: [:c | (1 to: 3) allSatisfy: [:r | positions includes: (r@c)]].! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:20:37'!
hasOWon
	^self hasPlayerWon: positionsOfO.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:28:44'!
hasPlayerWon: positions
	^(self completedDiagonal: positions) or: (self completedHorizontal: positions) or: (self completedVertical: positions).! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:20:31'!
hasXWon
	^self hasPlayerWon: positionsOfX.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:34:20'!
initialize
	"Initializes an empty board filled with the character '-' "
	positionsOfX := Set new.
	positionsOfO := Set new.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:33:02'!
isValidPosition: position
	^(position x > 0) and: (position y > 0) and: (position x < 4) and: (position y < 4).! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:30:23'!
moveOFrom: initialPosition to: finalPosition
	positionsOfO remove: initialPosition.
	self putOAt: finalPosition.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:30:32'!
moveXFrom: initialPosition to: finalPosition
	positionsOfX remove: initialPosition.
	self putXAt: finalPosition.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:18:37'!
putOAt: position
	positionsOfO add: position.! !

!TableroTerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:18:30'!
putXAt: position
	positionsOfX add: position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TableroTerniLapilli class' category: #'Ingsoft-TerniLapilli'!
TableroTerniLapilli class
	instanceVariableNames: ''!

!TableroTerniLapilli class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 15:52:55'!
new
	^super new initialize.! !


!classDefinition: #TerniLapilli category: #'Ingsoft-TerniLapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board curPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:35:29'!
initialize
	board := TableroTerniLapilli new.
	curPlayer := #x.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:43:40'!
moveOFrom: initialPosition to: finalPosition
	board moveOFrom: initialPosition to: finalPosition.
	curPlayer := #x.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:43:36'!
moveXFrom: initialPosition to: finalPosition
	board moveXFrom: initialPosition to: finalPosition.
	curPlayer := #o.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:43:23'!
putOAt: position
	board putOAt: position.
	curPlayer := #x.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:43:32'!
putXAt: position
	board putXAt: position.
	curPlayer := #o.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Ingsoft-TerniLapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'C. L. 5/27/2019 16:34:47'!
new
	^super new initialize.! !
