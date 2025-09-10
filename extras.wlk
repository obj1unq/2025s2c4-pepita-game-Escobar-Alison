import wollok.game.*
import pepita.*

object nido{
    const property position = game.at(8, 8)

    method image() = "nido.png"

}
object silvestre {
  const presa = pepita

  method image() = "silvestre.png"

  method position() = game.at(self.x(), 0)

  method x() = presa.position().x().max(3)

}