import niveles.*


import extras.*
import comidas.*
import wollok.game.*

object pepita {
	const positionInicial = game.at(0,1)    //arranca en la celda (0,1)
	var property position = positionInicial
	const energiaInicial = 100
	var energia = energiaInicial
    const predador = silvestre
    const hogar = nido
	const joules = 9

	method encontraste(algo) {
	  algo.queHagoConVos(self) // para delegarle la reponsabilidad de comer o otra cosa, la haga el otro obj
	}
	
	method image(){
        return "pepita-" + self.estado() + ".png"
    }

	method estado(){
		//        (self.esAtrapada() OR NOT self.conEnergia()){ "gris" }
		return if (self.esAtrapada() || !self.puedeMover()){ "gris" }
		    	else if (self.enHogar()){ "grande"  }
				else { "base" }
	}

	method loQueHayAca() = game.uniqueCollider(self) //Devuelve el único objeto que está en la misma posición que el objeto dado

    method tratoDeComer(){
		try {
			const comida = self.loQueHayAca() //operacion parcial
		    self.comer(comida)
		    comida.andate()
		} 
		catch e1: Exception {
			self.error("No hay nada para comer acá")
		}
	}

	method comerAca(){ //
        self.tratoDeComer()
		game.say(self, "no hay nada que comer") //
	}
	
	method puedeMover() = energia >= self.energiaNecesaria(1) && not self.esAtrapada()

	method esAtrapada() = self.estaSobre(predador) //

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()
		
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaNecesaria(kms) = joules * kms

	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}

    method mover(direccion){
		if(self.puedeMover()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else {
			self.perder()
		}
	}

	method perder(){
		game.say(self, "Perdiste")
		keyboard.r().onPressDo {
            game.clear()
			nivel1.inicializar()
            self.inicializar()
		}

		game.schedule( 2000, { game.stop() })
	}

	method inicializar() {
	  position = positionInicial
	  energia  = energiaInicial
	}

	method energia() {
		return energia
	}

	//Esto no se usa.
	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}
}
