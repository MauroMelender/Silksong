extends CanvasLayer

var monedas := 0

func _ready():
	actualizar_label()

func sumar_moneda():
	monedas += 1
	actualizar_label()
	# Animación pequeña del label al sumar
	var tween = create_tween()
	tween.tween_property($Label, "scale", Vector2(2, 2), 0.08)
	tween.tween_property($Label, "scale", Vector2.ONE, 0.12)

func actualizar_label():
	$Label.text = "Dolares: %d" % monedas
