import wollok.game.*

class Arbusto {
	var property position
	
	method dibujar() {
		game.addVisual(self)
	}

	method image() = "fence02.png"
}
