import wollok.game.*
import plantas.*

object hector {
	// necesita posicion e imagen para poder
	// estar en el tablero
	var property posicion = game.at(2,2)
	var plantasParaVender = []
	var cantidadDeOro = 0	

	method imagen() = "player.png"
	
	// metodo que reacciona ante una tecla
	method plantaMaiz() { 
		if (self.plantasDondeEstoy().isEmpty()) {
			// la forma corta
			game.addVisualIn(new Maiz(), self.posicion().clone())
	
			// la forma larga
//			const fotocopia = new Position()
//			fotocopia.x(self.posicion().x())
//			fotocopia.y(self.posicion().y())
//			game.addVisualIn(new Maiz(), fotocopia)
		} else {
			throw new Exception("Ya hay una planta che")
		}		
	}

	method plantaTrigo() { 
		if (self.plantasDondeEstoy().isEmpty()) {
			game.addVisualIn(new Trigo(), self.posicion().clone())
		} else {
			throw new Exception("Ya hay una planta che")
		}		
	}
	
	method plantaTomaco() {
		if (self.plantasDondeEstoy().isEmpty()) {
			const nuevaPlanta = new Tomaco()
			nuevaPlanta.posicion(self.posicion().clone())
			game.addVisual(nuevaPlanta)
		} else {
			self.error("Ya hay una planta che")
		}		
	}
	
	method plantasDondeEstoy() = game.colliders(self)		
	
	method regar() { 
		if (self.plantasDondeEstoy().isEmpty()) {
			self.error("No hay nada que regar acá")
		}
		self.plantasDondeEstoy().forEach { planta => planta.regar() }
	}

	method cosechar() { 
		self.plantasDondeEstoy()
			.filter { planta => planta.puedeSerCosechada() }
			.forEach { planta => plantasParaVender.add(planta)
				game.removeVisual(planta)
			}
	}
	
	method vender() {
		cantidadDeOro += plantasParaVender.sum { planta => planta.precio() }
		plantasParaVender = []
	}
}

