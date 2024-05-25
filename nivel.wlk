import wollok.game.*
import arbustos.*
import granjero.*
import movimiento.*
object nivel {

method configurate(){
	//	CONFIG	
		game.title("FarmVille")
		game.height(10)
		game.width(10)
		game.boardGround("ground.png")
		
	//	VISUALES
	 	game.addVisual(granjero)
	 	movimiento.configurarFlechas(granjero)
		
	//	ARBUSTOS
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		(1 .. ancho-1).forEach { n => new Arbusto(position = new Position(x = n, y = 0)).dibujar() } // bordeAbajo
		(1 .. ancho-1).forEach { n => new Arbusto(position = new Position(x =n, y = largo)).dibujar() } // bordeArriba 
		(0 .. largo).forEach { n => new Arbusto(position = new Position(x =0, y = n)).dibujar() } // bordeIzq 
		(0 .. largo).forEach { n => new Arbusto(position = new Position(x =ancho, y = n)).dibujar() } // bordeDer
		
	//	TECLADO
		keyboard.m().onPressDo { granjero.plantaMaiz() }
		keyboard.t().onPressDo { granjero.plantaTrigo() }
		keyboard.o().onPressDo { granjero.plantaTomaco() }
		keyboard.r().onPressDo { granjero.rega() }
		keyboard.c().onPressDo { granjero.cosechaTodo() }
		
		keyboard.space().onPressDo{ game.say(granjero, "mi oro: " + granjero.oro()) }  
	}

}