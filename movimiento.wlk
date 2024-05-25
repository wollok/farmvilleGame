import wollok.game.*

object movimiento {
	
	method configurarFlechas(visual){
		keyboard.up().onPressDo {
			self.mover(arriba,visual)
		}
		keyboard.down().onPressDo { 
			self.mover(abajo,visual)
		}
		keyboard.left().onPressDo{
			self.mover(izquierda,visual)
		}
		keyboard.right().onPressDo{ 
			self.mover(derecha,visual)
		}
   }
	
	method mover(direccion,personaje){
		const nuevaPosicion = direccion.siguiente(personaje.position())
		if (nuevaPosicion.x() >= 1 && nuevaPosicion.x() < game.width() - 1 &&
				nuevaPosicion.y() >= 1 && nuevaPosicion.y() < game.height() - 1)
		personaje.position(nuevaPosicion)
	}	
	
}

object izquierda { 
	method siguiente(position) = position.left(1) 
}

object derecha { 
	method siguiente(position) = position.right(1) 
}

object abajo { 
	method siguiente(position) = position.down(1) 
}

object arriba { 
	method siguiente(position) = position.up(1) 
}
