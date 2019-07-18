import wollok.game.*

class Arbusto {
	var property position
	
	method dibujar() {
		position.drawElement(self)
		game.whenCollideDo(self, { granjero => self.empuja(granjero) })
	}

	method image() = "fence02.png"
	method empuja(granjero)
}

class ArbustoArriba inherits Arbusto {
		
	override method empuja(granjero) {
		granjero.position(granjero.position().down(1))
	}
}

class ArbustoAbajo inherits Arbusto {
		
	override method empuja(granjero) {
		granjero.position(granjero.position().up(1))
	}
}

class ArbustoIzquierda inherits Arbusto {
	
	override method empuja(granjero) {
		granjero.position(granjero.position().right(1))
	}
}

class ArbustoDerecha inherits Arbusto {
		
	override method empuja(granjero) {
		granjero.position(granjero.position().left(1))
	}
}
