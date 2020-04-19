extends Resource
class_name StoryStates

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Menu = preload("res://Resources/Menu.tres")
const Player = preload("res://Resources/Player.tres")

var states = []
var stateTracker = 0
var currentStory
var currentA = "test"
var currentB = ""
var currentC = ""

func _ready():
	states.append(intro)
	states.append(intro2)
	currentStory = states[stateTracker]

func _advance_state():
	stateTracker += 1
	currentStory = states[stateTracker]
	print(currentStory)

func _load_options():
	currentA = introA
	currentB = introB
	currentC = introC

var intro = "You awaken. Cold, wet grass presses against your back, and the steady drum of rain has soaked " \
			+ "through your meager clothing. Your head pounds from the events of last night. You were..."
			
var intro2 = "At the least, you are not without your weapon. Your trusty sword lies beside you, easily taken as " \
			+ "as you stand up. As you look around you see a scaled creature, teeth stained red with blood. " \
			+ "This creature appears to be one of the savage Karjorot, a reptilian race that live north of Mistral. " \
			+ "It leaves you no choice as it lunges forth...you must fight!" 

var introA = "Sparring. I was with a friend...where are they? Where am I? (+1 STR)"

func introA_selected():
	Player._str += 1
	print(Player._str)
	_advance_state()

var introB = "Running. I had just finished stretching my legs before I passed out. (+1 AGI)"

func introB_selected():
	Player._agi += 1
	print(Player._agi)
	_advance_state()

var introC = "Investigating. I had heard rumors about magical disturbances. (+1 MAG)"

func introC_selected():
	Player._mag += 1
	print(Player._mag)
	_advance_state()