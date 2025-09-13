

import extras.*
import comidas.*
import wollok.game.*

object pepita {
	var property position = game.at(0,1) //arranca en la celda (0,1)
	var energia = 100
    const predador = silvestre
    const hogar = nido
	const joules = 9

	//method image() = "pepita-base.png"
	method image(){
        return "pepita-" + self.estado() + ".png"
    }

	method estado(){
		//(self.esAtrapada() or not self.conEnergia()){ "gris" }
		return if (self.esAtrapada() || !self.puedeMover()){ "gris" }
		    	else if (self.enHogar()){ "grande"  }
				else { "base" }
	}

	method loQueHayAca() = game.uniqueCollider(self)

	method comerAca(){
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.andate()
	}
	
	method puedeMover() = energia >= self.energiaNecesaria(1) && not self.esAtrapada()

	method esAtrapada() = self.estaSobre(predador)

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()
		
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaNecesaria(kms) = joules * kms

	method volar(kms) {
		//energia = energia - 9 * kms
		//energia -= 9 * kms
		energia -= self.energiaNecesaria(kms) 
		//energia = energia - self.energiaNecesaria(kms)
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
		game.say(self, "Perdí!")
		game.schedule( 2000, { game.stop() })
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
