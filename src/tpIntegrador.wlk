/* 1 - LOS INSTRUMENTOS */
class GuitarraFenderStratocaster{
    const color
    const historialAfinaciones = []

    method precio(){
        if(color == "negro"){
            return 15
        }
        else{
            return 10
        }
    }

    method familia() = "cuerdas"

    method valioso() = true

    method afinado() = true

    method esCopado() = false

    method historialAfinaciones() = historialAfinaciones

    method afinar() = true
}
class TrompetaJupiter{
    var temperaturaAmbiente = 21
    const sordinaPuesta
    const historialAfinaciones = []

    method historialAfinaciones() = historialAfinaciones

    method valioso() = false

    method afinado() = temperaturaAmbiente >= 20 && temperaturaAmbiente <= 25

    method sordinaPuesta() = sordinaPuesta

    method familia() = "viento"

    method esCopado() = sordinaPuesta

    method afinar() {
        temperaturaAmbiente = 23
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
object pianoBechstein{
    var ubicacion = new Habitacion(ancho = 5, largo = 5)

    const historialAfinaciones = [(new Revision(fecha = new Date(day = 5, month = 10, year = 2025), tecnico = new Tecnico(especialistaEn = "cuerdas")))]

    method historialAfinaciones() = historialAfinaciones

    method afinado() = ubicacion.area() > 20

    method familia() = "cuerdas"

    method precio() = 2 * ubicacion.ancho()

    method valioso() = self.afinado()

    method esCopado() = ubicacion.ancho() > 6 || ubicacion.largo() > 6

    method cambiarUbicacion(nuevaHabitacion){
        ubicacion = nuevaHabitacion
    }

    method afinar(){
        self.cambiarUbicacion(habitacionGrande)
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

const habitacionGrande = new Habitacion(ancho = 8, largo = 4)

class ViolinStagg {
    var tremolosRealizados = 0
    const pinturaLaqueado
    const historialAfinaciones = []

    method historialAfinaciones() = historialAfinaciones

    method familia() = "cuerdas"

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

    method afinar(){
        tremolosRealizados = 0
    }

    method esCopado() = false
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

    method diferenciaEntreFechas(){
        if(instrumento.historialAfinaciones().size() == 0){
            return 0
        }
        else{
            const fechaDeHoy = new Date()
            return fechaDeHoy - instrumento.historialAfinaciones().last().fecha()
        }
    }
    method sePuedeMandarARevisarCon(tecnicoAfinador) {
        const fechaDeHoy = new Date()
        const diferenciaFechas = self.diferenciaEntreFechas()

        return tecnicoAfinador.puedeRevisarElInstrumento(instrumento) && (diferenciaFechas >= 7 || instrumento.historialAfinaciones().size() == 0 )
    }

    method mandarAfinarInstrumentoCon(tecnicoAfinador){

        if (self.sePuedeMandarARevisarCon(tecnicoAfinador)){
            instrumento.afinar()
            instrumento.historialAfinaciones().add(new Revision(tecnico = tecnicoAfinador))
        }   
    }

    method instrumento() = instrumento

}

object wolfang{

    method esFeliz(){
        return johann.esFeliz()
    }
}

object antonio{
    var instrumento = pianoBechstein

    method esFeliz(){
        return instrumento.valioso()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }

    method diferenciaEntreFechas(){
        if(instrumento.historialAfinaciones().size() == 0){
            return 0
        }
        else{
            const fechaDeHoy = new Date()
            return fechaDeHoy - instrumento.historialAfinaciones().last().fecha()
        }
    }
    method sePuedeMandarARevisarCon(tecnicoAfinador) {
        const fechaDeHoy = new Date()
        const diferenciaFechas = self.diferenciaEntreFechas()

        return tecnicoAfinador.puedeRevisarElInstrumento(instrumento) && (diferenciaFechas >= 7 || instrumento.historialAfinaciones().size() == 0 )
    }

    method mandarAfinarInstrumentoCon(tecnicoAfinador){

        if (self.sePuedeMandarARevisarCon(tecnicoAfinador)){
            instrumento.afinar()
            instrumento.historialAfinaciones().add(new Revision(tecnico = tecnicoAfinador))
        }   
    }

    method instrumento() = instrumento
}

object giuseppe{
    var instrumento = new GuitarraFenderStratocaster(color = "negra")

    method esFeliz(){
        return instrumento.afinado()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }

    method diferenciaEntreFechas(){
        if(instrumento.historialAfinaciones().size() == 0){
            return 0
        }
        else{
            const fechaDeHoy = new Date()
            return fechaDeHoy - instrumento.historialAfinaciones().last().fecha()
        }
    }
    method sePuedeMandarARevisarCon(tecnicoAfinador) {
        const fechaDeHoy = new Date()
        const diferenciaFechas = self.diferenciaEntreFechas()

        return tecnicoAfinador.puedeRevisarElInstrumento(instrumento) && (diferenciaFechas >= 7 || instrumento.historialAfinaciones().size() == 0 )
    }

    method mandarAfinarInstrumentoCon(tecnicoAfinador){

        if (self.sePuedeMandarARevisarCon(tecnicoAfinador)){
            instrumento.afinar()
            instrumento.historialAfinaciones().add(new Revision(tecnico = tecnicoAfinador))
        }   
    }

    method instrumento() = instrumento
}

object maddalena{
    var instrumento = new ViolinStagg(pinturaLaqueado = "lacaAcrilica")

    method esFeliz(){
        return instrumento.precio().even()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }

    method diferenciaEntreFechas(){
        if(instrumento.historialAfinaciones().size() == 0){
            return 0
        }
        else{
            const fechaDeHoy = new Date()
            return fechaDeHoy - instrumento.historialAfinaciones().last().fecha()
        }
    }
    method sePuedeMandarARevisarCon(tecnicoAfinador) {
        const fechaDeHoy = new Date()
        const diferenciaFechas = self.diferenciaEntreFechas()

        return tecnicoAfinador.puedeRevisarElInstrumento(instrumento) && (diferenciaFechas >= 7 || instrumento.historialAfinaciones().size() == 0 )
    }

    method mandarAfinarInstrumentoCon(tecnicoAfinador){

        if (self.sePuedeMandarARevisarCon(tecnicoAfinador)){
            instrumento.afinar()
            instrumento.historialAfinaciones().add(new Revision(tecnico = tecnicoAfinador))
        }   
    }

    method instrumento() = instrumento
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

    method experto() = instrumentoQueToca.familia() == preferenciaPor

    method esFeliz() = instrumentoQueToca.esCopado()

    method instrumento() = instrumentoQueToca

    method diferenciaEntreFechas(){
        if(instrumentoQueToca.historialAfinaciones().size() == 0){
            return 0
        }
        else{
            const fechaDeHoy = new Date()
            return fechaDeHoy - instrumentoQueToca.historialAfinaciones().last().fecha()
        }
    }
    method sePuedeMandarARevisarCon(tecnicoAfinador) {
        const fechaDeHoy = new Date()
        const diferenciaFechas = self.diferenciaEntreFechas()

        return tecnicoAfinador.puedeRevisarElInstrumento(instrumentoQueToca) && (diferenciaFechas >= 7 || instrumentoQueToca.historialAfinaciones().size() == 0 )
    }

    method mandarAfinarInstrumentoCon(tecnicoAfinador){

        if (self.sePuedeMandarARevisarCon(tecnicoAfinador)){
            instrumentoQueToca.afinar()
            instrumentoQueToca.historialAfinaciones().add(new Revision(tecnico = tecnicoAfinador))
        }   
    }

}

class Orquesta{
    const integrantes = []
    const cantidadMaxima

    method agregarIntegrante(nuevoIntegrante){
        if(integrantes.size() < cantidadMaxima && not integrantes.contains(nuevoIntegrante)){
            integrantes.add(nuevoIntegrante)
        } 
    }

    method estaBienConformado() = integrantes.all({n => n.esFeliz()})

    method integrantes() = integrantes
}

/* PUNTO 4 - INSTRUMENTOS GENERICOS*/

class InstrumentoGenerico{
    const familiaInstrumento
    const historialAfinaciones = []
    const valor = multiplicadorVendedor.multiplicador()

    method precio() = familiaInstrumento.size() * valor

    method afinado() {
        const ultimoMesDeAfinacionHecha = historialAfinaciones.last().fecha().month()
        const mesActual = new Date().month()

        const diferenciaMes = mesActual - ultimoMesDeAfinacionHecha

        return diferenciaMes >= 1
    }

    method afinar() = true

    method esCopado() = false 

    method familiaInstrumento() = familiaInstrumento
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

class Revision{
    const fecha = new Date() 
    const tecnico

    method fecha() = fecha
    method tecnico() = tecnico 
}

class Tecnico{
    const especialistaEn

    method puedeRevisarElInstrumento(instrumento){
        return especialistaEn == instrumento.familia()
    }
}



