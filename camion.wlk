
object camion{
    var cosas = contenedor.cosas
    method peso(){
        return 1000 + cosas.sum({c => c.peso()})
    }
    method cargar(unaCosa){
        cosas.add(unaCosa)
    }
    method descargar(unaCosa) {
      cosas.remove(unaCosa)
    }
    method sonTodasImpares(){
        return not cosas.any({c => c.peso().even()})
        //return cosas.all({c=>c.peso().odd()})
    }
    method cosaQuePesa(unValor){
        return cosas.any({c=>c.peso() == unValor})
    }
    method nivelPeligrosidad(unNivelPeligrosidad){
        return cosas.find({c=>c.peligrosidad() == unNivelPeligrosidad})
    }
    method cosasQueSuperan(unNivelPeligrosidad){
        return cosas.filter({c=>c.peligrosidad() > unNivelPeligrosidad})
    }
    method cosasQueSuperanA(unaCosa){
        return self.cosasQueSuperan(unaCosa.peligrosidad())
    }
    method estaExcedido(){
        return self.peso() > 2500
    }
    method puedeCircular(unNivelPeligrosidad){
        return not self.estaExcedido() 
        and self.superanElMaximoPeligrosidad(unNivelDePeligrosidad)
    }
    method superanElMaximoPeligrosidad(unNivelDePeligrosidad){
        return cosas.all({c=> c.peligrosidad()< unNivelDePeligrosidad})
    }
    
}
object knightRider{
    method peso() = 500
    method peligrosidad ()= 10  
    method bulto()=1
    method consecuencia(){}
}
object robot{
    method peligrosidad() = 30
}
object auto{
    method peligrosidad() = 15 
}

object bumblebee {
    method peso() = 800
    var estaRobot = false
    method bulto()=2
    method peligrosidad() = if(estaRobot) 30 else 15     
    method consecuencia(){
        self.transformar()
    }
    method transformar (){
        estaRobot = not estaRobot
    }
    /*
    var estado = auto
    method peligrosidad() = estado.peligrosidad()
    method transformar(unEstado){
        estado = unEstado
    } 
    */

    /*
    var  transformacion = "auto"
    method transformar(){
        if (transformacion == "auto"){
            transformacion = "robot"
        }
        else {
            transformacion = "auto"
        }   
    }
    
    method peligrosidad(){
       if (transformacion == "auto"){
         return  15 
        }
        else {
         return 30
        }
    }
    */
  
}

object paqueteDeLadrillos {
    var property cantLadrillos = 0
    method peso() = cantLadrillos*2
    method peligrosidad() = 2
    method bulto(){
        if(cantLadrillos.between(0,100)) return 1
        if(cantLadrillos.between(101, 300)) return 2
        return 3
    }
    method consecuencia(){
        cantLadrillos += 20
    }
}

object arenaGranel{
    method peligrosidad()=1
    var property peso = 0
    method bulto()=1
    method consecuencia(){
        peso -= 10
    }
}
object bateriaAntiaerea{
    var tieneMisiles = false
    method peso()= if (tieneMisiles) 300 else 200
    method peligrosidad()= if(tieneMisiles) 100 else 0
    method cargarMisiles(){
        tieneMisiles=true
    }
    method descargarMisiles(){
        tieneMisiles=false
    }
    method bulto(){
        if (tieneMisiles)return 1
        return 2
    }
    method consecuencia(){
        self.cargarMisiles()
    }
}
object contenedor{
    const cosas = []
    method agregarCosa(unaCosa){
        cosas.add(unaCosa)
    }
    method bulto()=1+ cosas.sum({c=>c.bulto()})
    
    method peso(){
        return 100 + cosas.sum({c => c.peso()})
    }
    method peligrosidad(){
        if(cosas.isEmpty())return 0
        return cosas.max({c => c.peligrosidad()}).peligrosidad()
    }
    method consecuencia(){
        cosas.all({c=> c.consecuencia()})
    }
}
object residuos{
    var property peso = 0 
    method peligrosidad()=200
    method bulto()=1
    method consecuencia(){
        peso += 15
    }

}
object embalajeDeSeguridad{
    method bulto()=2
    var property cosaEnvuelta = cosaNull
    method peso()=cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() *0.5  
    method consecuencia(){}
}
object cosaNull{
    method peso() = 0
    method peligrosidad() = 0  
}