extends Control
#https://youtu.be/pVDUdXYa38I?t=2802
@onready var grid_container : GridContainer = $ScrollContainer/GridContainer
var items : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	_populate_slots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Ast / Zweig, Gummi, Klebeband, Stein
func _populate_slots():
	for i in 20:
		var packedScene = ResourceLoader.load("res://inventory/inventory_slot.tscn")
		var itemSlot : InventorySlot = packedScene.instantiate()
		itemSlot.connect("OnSlotClick", _on_slot_clicked)
		grid_container.add_child(itemSlot)

func _on_slot_clicked(index, currentItem):
	print("clicked inventory slot")

func _add_item(item : Resource):
	var currentItem = item.duplicate()
	for i in items.size():
		if items[i].ID == currentItem.ID && items[i].Quantity != items[i].StackSize:
			if items[i].Quantity + currentItem.Quantity > items[i].StackSize:
				items[i].Quantity = currentItem.StackSize
				currentItem.Quantity = -(currentItem.Quantity - items[i].StackSize)
				_update_button(i)
			else:
				items[i].Quantity += currentItem.Quantity
				currentItem.Quantity = 0
				_update_button(i)
	if currentItem.Quantity > 0:
		if currentItem.Quantity < currentItem.StackSize:
			items.append(currentItem)
			_update_button(items.size() - 1)
		else:
			var tempItem = currentItem.duplicate()
			tempItem.Quantity = currentItem.StackSize
			items.append(tempItem)
			_update_button(items.size() - 1)
			currentItem.Quantity -= currentItem.StackSize
			_add_item(currentItem)
	
func _update_button(index: int):
	if range(items.size()).has(index):
		grid_container.get_child(index)._update_item(items[index], index)
	else:
		grid_container.get_child(index)._update_item(null, index)

func _on_button_button_down():
	_add_item(ResourceLoader.load("res://objects/items/tesafilm.tres"))
