import wollok.game.*
import arbustos.*
import granjero.*
object nivel {

method configurate(){
	//	CONFIG	
		game.title("FarmVille")
		game.height(10)
		game.width(10)
		game.ground("ground.png")
		
	//	VISUALES
	 	game.addVisualCharacter(granjero)
		
	//	ARBUSTOS
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		(1 .. ancho-1).forEach { n => new ArbustoAbajo(new Position(n, 0)) } // bordeAbajo
		(1 .. ancho-1).forEach { n => new ArbustoArriba(new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach { n => new ArbustoIzquierda(new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach { n => new ArbustoDerecha(new Position(ancho, n)) } // bordeDer
		
	//	TECLADO
		keyboard.m().onPressDo { granjero.plantaMaiz() }
		keyboard.t().onPressDo { granjero.plantaTrigo() }
		keyboard.o().onPressDo { granjero.plantaTomaco() }
		keyboard.r().onPressDo { granjero.rega() }
		keyboard.c().onPressDo { granjero.cosechaTodo() }
		
		keyboard.space().onPressDo{ game.say(granjero, "mi oro: " + granjero.getOro()) }  
	}

}