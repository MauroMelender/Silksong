extends Node

@onready var hud = $HUD

func _ready():
	await get_tree().process_frame
	# Conectar todas las monedas que ya están en la escena
	for moneda in get_tree().get_nodes_in_group("coins"):
		moneda.moneda_recogida.connect(hud.sumar_moneda)
