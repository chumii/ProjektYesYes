class_name InventorySlot extends Button

var currentItem
@onready var currentIcon = $TextureRect
@onready var currentLabel = $Label 
var index
signal OnSlotClick(Index, item)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_item(item, index):
	self.index = index
	currentItem = item
	
	if currentItem == null:
		currentIcon.texture = null
		currentLabel.text = ""
	else:
		currentIcon.texture = item.Icon
		currentLabel.text = str(item.Quantity)

func _on_area_2d_area_entered(area):
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	pass # Replace with function body.


func _on_button_down():
	emit_signal("OnSlotClick",index, currentItem)
