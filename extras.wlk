import wollok.game.*
import pepita.*

object nido{
    const property position = game.at(8, 8)

    method image() = "nido.png"

}

object silvestre{
  const presa = pepita

  method image() = "silvestre.png"

  method position() = game.at(self.x(), 0) //cada vez recalcula

  method x() = 3.max(presa.position().x()) 
}

object muro {
  var property position = game.at(2, 0)
  method image() = "muro.png"
}
