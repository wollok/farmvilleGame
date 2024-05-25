import wollok.game.*
import cultivos.*

object granjero {
	var property oro = 0
	const cultivos = []
	var property position = new Position(x = 3, y = 3)
	
	method plantaMaiz() {
		self.planta(new Maiz(position = position))
	}

	method plantaTrigo() {
		self.planta(new Trigo(position = position))
	
	}
	method plantaTomaco() {
		self.planta(new Tomaco(position = position))
	}

	method planta(cultivo) {
		game.addVisual(cultivo)
		cultivos.add(cultivo)
	}
	
	method rega() {
		const cultivosARegar = position.allElements()
			.filter { obj => !(self == obj) }
			
		if (cultivosARegar.isEmpty())
			throw new DomainException(message = "Solo las plantas se pueden regar!", source = self)
			
		cultivosARegar.forEach { cultivo => cultivo.crece() }
	}
	
	method cosechaTodo() {
		cultivos.forEach { cultivo => cultivo.cosechate(self) }
		cultivos.clear()
	}
	
	method sumaOro(cantidad) { oro += cantidad }

	method image() = "player.png"
}
