import wollok.game.*
import cultivos.*

object granjero {
	var property oro = 0
	var cultivos = []
	var property position = new Position(x = 3, y = 3)
	
	method plantaMaiz() {
		self.planta(new Maiz())
	}

	method plantaTrigo() {
		self.planta(new Trigo())
	
	}
	method plantaTomaco() {
		self.planta(new Tomaco())
	}

	method planta(cultivo) {
		position.clone().drawElement(cultivo)
		cultivos.add(cultivo)
	}
	
	method rega() {
		var cultivosARegar = position.allElements()
			.filter { obj => !(self == obj) }
			
		if (cultivosARegar.isEmpty())
			throw new Exception("Solo las plantas se pueden regar!")
			
		cultivosARegar.forEach { cultivo => cultivo.crece() }
	}
	
	method cosechaTodo() {
		cultivos.forEach { c => c.cosechate(self) }
		cultivos.clear()
	}
	
	method sumaOro(cantidad) { oro += cantidad }

	method image() = "player.png"
}
