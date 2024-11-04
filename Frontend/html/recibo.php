<?php
/*<!DOCTYPE html>
<html lang="en">

<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resumen</title>
 
</head>
<body>
    <h2>Recibo de compra:</h2>
    <div id="recibo"></div>

    <button>Descargar Recibo</button>
    <script src="js/recibo.js"></script>
</body>
</html>

*/



require('pdf/fpdf.php');
require "php/conexion.php";

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('images/logo.png',10,8,33);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(30,10,'Recibo',1,0,'C');
    // Salto de línea
    $this->Ln(20);
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,'Pagina '.$this->PageNo().'/{nb}',0,0,'C');
}
}

session_start();
    $idcliente =$_SESSION['idc'];
    try {

  

$sql = "SELECT * FROM  producto p
        JOIN `carrito_compra` cc
        ON cc.idProducto = p.idProd
        WHERE idCliente = :idc";


        $stmt = $con->prepare($sql);
        $stmt->bindParam(':idc' , $idcliente);
        $stmt->execute();


        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (count($resultados) > 0) {
            
        
            $pdf = new PDF();
            $pdf->AliasNbPages();
            $pdf->AddPage();
            $pdf->SetFont('Times','',12);
            for ($i =0; $i<count($resultados); $i++){
                $pdf->Cell(0,10,'Producto:'.$resultados[$i]["nombre"],0,1);
                $pdf->Cell(0,10,'Precio Unitario:'.$resultados[$i]["precio"],0,1);
                $pdf->Cell(0,10,'Cantidad:'.$resultados[$i]["cantidad"],0,1);


            }
            
            $pdf->Output();
            

// 'recibo.pdf', 'D'














        } else {
            echo json_encode(["error" =>"No se encontraron resultados para '$idcliente'."]);
        }

    } catch(PDOException $e) {
        echo json_encode(["error" => "Error de conexión"]);
    }


// Creación del objeto de la clase heredada

?>
