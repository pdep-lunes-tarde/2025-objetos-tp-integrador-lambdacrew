
/* 1 - LOS INSTRUMENTOS */
class GuitarraFenderStratocaster{
    const color

    method precio(){
        if(color == "negro"){
            return 15
        }
        else{
            return 10
        }
    }

    method valioso() = true

    method afinado() = true
}

class TrompetaJupiter{
    var temperaturaAmbiente
    const sordinaPuesta

    method valioso() = false

    method afinado() = temperaturaAmbiente >= 20 && temperaturaAmbiente <= 25

    method sordinaPuesta() = sordinaPuesta

    method afinar(aTemperatura) {
        if (not self.afinado()){
            temperaturaAmbiente = aTemperatura
        }
    }

    method precio(){
        if(sordinaPuesta){
            return 35
        }
        else {
            return 30
        }
    }
}

class PianoBechstein{
    var ubicacion = new Habitacion(ancho = 5, largo = 5)

    method afinado() = ubicacion.area() > 20

    method precio() = 2 * ubicacion.ancho()

    method valioso() = self.afinado()

    method cambiarUbicacion(nuevaHabitacion){
        ubicacion = nuevaHabitacion
    }
}


class Habitacion{
    const ancho 
    const largo 

    method ancho(){
        return ancho
    }

    method largo(){
        return largo
    }

    method area(){
        return ancho * largo
    }
}

class ViolinStagg {
    var tremolosRealizados = 0
    const pinturaLaqueado

    method pintura() = pinturaLaqueado

    method valioso() = pinturaLaqueado == "lacaAcrilica"

    method afinado() = tremolosRealizados < 10

    method precio(){
        const precioInicial = 20
        if((precioInicial - tremolosRealizados) <= 15){
            return 15
        }
        else{
            return precioInicial - tremolosRealizados
        }
    }

    method realizarTremolos(cantidad){
        tremolosRealizados = tremolosRealizados + cantidad
    }
}

/* 2 - LOS MUSICOS */

object johann{
    var instrumento = new TrompetaJupiter(temperaturaAmbiente = 21, sordinaPuesta = true)
    
    method esFeliz(){
        return instrumento.precio() > 20
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

object wolfang{

    method esFeliz(){
        return johann.esFeliz()
    }
}

object antonio{
    var instrumentos = new PianoBechstein()

    method esFeliz(){
        return instrumentos.valioso()
    }

    method cambiarInstrumento(instrumento){
        instrumentos = instrumento
    }
}

object giuseppe{
    var instrumentos = new GuitarraFenderStratocaster(color = "negra")

    method esFeliz(){
        return instrumentos.afinado()
    }

    method cambiarInstrumento(instrumento){
        instrumentos = instrumento
    }
}

object maddalena{
    var instrumentos = new ViolinStagg(pinturaLaqueado = "lacaAcrilica")

    method esFeliz(){
        return instrumentos.precio().even()
    }

    method cambiarInstrumento(instrumento){
        instrumentos = instrumento
    }
}

class AsociacionMusical{
    const integrantes = []

    method sonFelices(){
        return integrantes.filter({n => n.esFeliz()})
    }

    method agregarIntegrante(unNuevoIntegrante){
        integrantes.add(unNuevoIntegrante)
    }
}

/* PUNTO 3 - MUSICOS Y ORQUESTA */

class Musico{
    const preferenciaPor
    const instrumentoQueToca

    method experto() = instrumentoQueToca.categoria() == preferenciaPor

    method esFeliz() = not instrumentoQueToca.sordinaPuesta() || instrumentoQueToca.area() > 6
}

class Orquesta{
    const integrantes = []
    const cantidadMaxima

    method agregarIntegrante(nuevoIntegrante){
        if(integrantes.size() >= cantidadMaxima && not integrantes.contains(nuevoIntegrante)){
            integrantes.add(nuevoIntegrante)
        }  
    }

    method estaBienConformado() = integrantes.all({n => n.esFeliz()})
}

/* PUNTO 4 - INSTRUMENTOS GENERICOS*/

class Instrumento{
    const familiaInstrumento

    method precio() = familiaInstrumento.size() * multiplicadorVendedor.multiplicador()
}

object multiplicadorVendedor{

    method multiplicador() {
        const numeroAleatorio = 1.randomUpTo(10).truncate(0)
        if (numeroAleatorio.even()){
            return 2
        }
        else{
            return 3
        }
    }
}