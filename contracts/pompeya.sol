pragma solidity ^0.5.0;
contract pompeya {
    struct Foto {
        uint id;
        string ruta;
        string hash;
    }
 
    struct Reuniones {
        uint id;
        string tema;
        string fecha;
        bool creado;
        Foto[] data;
    }
    
    mapping(uint => Reuniones) reuniones;
   
    
    //Permite Registrar una nueva reunion
    function registrarNuevaReunion(uint id, string memory tema, string memory fecha) public
    {
        reuniones[id].creado = true;
        reuniones[id].id = id;
        reuniones[id].tema = tema;
        reuniones[id].fecha = fecha;
       
    }
    
    function consultarReunion(uint id) 
    public view returns(uint, string memory,string memory){
        return(reuniones[id].id,reuniones[id].tema,reuniones[id].fecha);
    }
   
   
   //Permite adicionar datos de la foto a una reunion
    function adicionarDatosFotosReuniones(uint id, uint _idFoto, string memory ruta, string memory hash) 
     public  returns(uint) 
     {
        reuniones[id].data.push(Foto({
            id : _idFoto,
            ruta : ruta,
            hash: hash
            
        }));
       
    }
    
     //Permite obtener el numero de datos de fotos registrados en reuniones
    function obtenerNumDatosFotosReuniones(uint id) 
     public view returns(uint) {
         return reuniones[id].data.length;
    }
    
    
     //Permite obtener los datos de las fotos de la reunion
    function obtenerDatoFotosReunion(uint id, uint pos) 
     public view returns (uint, string memory ruta, string memory hash) 
     {
        return (reuniones[id].data[pos].id, reuniones[id].data[pos].ruta, reuniones[id].data[pos].hash);

     }  
    
}