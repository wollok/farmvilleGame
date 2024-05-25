import etapas.*

class Cultivo {
	var property position
	var property etapa = ninio
	
	method crece() { etapa.crece(self) }
	
	method cosechate(granjero) {
		granjero.sumaOro(etapa.oroPorCosecha(self))
		etapa = muerto
	}
	
	method image() = etapa.imagen(self)
}


class Maiz inherits Cultivo {
	method imagenCultivoAdulto() = "corn_adult.png"
	method imagenCultivoNinio() = "corn_baby.png"
	method oroBase() = 150
}

class Trigo inherits Cultivo {
	method imagenCultivoAdulto() = "wheat_adult.png"
	method imagenCultivoNinio() = "wheat_baby.png"
	method oroBase() = 100
}

class Tomaco inherits Cultivo {
	method imagenCultivoAdulto() = "tomaco_adult.png"
	method imagenCultivoNinio() = "tomaco_baby.png"
	method oroBase() = 50
}
