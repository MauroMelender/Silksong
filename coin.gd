extends Area2D

signal moneda_recogida

func _ready():
	add_to_group("coins")
	body_entered.connect(recoger)

func recoger(body):
	if body.name == "Player":
		moneda_recogida.emit()
		_animar_y_destruir()

func _animar_y_destruir():
	# Desactivar colisión para evitar doble recolección
	$CollisionShape2D.set_deferred("disabled", true)
	
	var tween = create_tween()
	
	# Escalar a 0 y hacer fade out al mismo tiempo
	tween.set_parallel(true)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.3)\
		 .set_trans(Tween.TRANS_BACK)\
		 .set_ease(Tween.EASE_IN)
	tween.tween_property(self, "modulate:a", 0.0, 0.25)
	
	# Destruir al terminar la animación
	tween.set_parallel(false)
	tween.tween_callback(queue_free)
