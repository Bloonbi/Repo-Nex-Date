const boton = document.getElementById("boton1");
const producto = document.getElementById("producto");
const div = document.getElementById("contenido");
 

boton.addEventListener("click", () => { 
     
    fetch('../../frontend/php/busqueda2.php?producto='+producto.value)
        .then(response => response.json())
        .then(data =>{
            var prod = ''
                
                
                
                for( id = 0 ; id < data.length ; id++){
                       prod += `
            
                           <div class="tarjeta">
    <img class="img" src="../vistas/img/Producto/${data[id].Id_Producto}.jpg">    
    
   
                <h3>${data[id].Nombre}</h3>
                
                </div><br>
             `
                }
                
             
             div.innerHTML = prod;
        })
        .catch(error => {
            console.error("Error",(error));
        })
    });