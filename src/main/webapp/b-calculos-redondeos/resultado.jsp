<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
     // Recepción y conversión de parámetros del formulario
     double precio = 0;
     int cantidad = 0;
     double descuento = 0;

     try {
         precio = Double.parseDouble(request.getParameter("precio"));
         cantidad = Integer.parseInt(request.getParameter("cantidad"));
         descuento = Double.parseDouble(request.getParameter("descuento"));
     } catch (Exception e) {
         // En caso de parámetros nulos o inválidos
         response.sendRedirect("index.jsp");
         return;
     }

     /*
     * COMPAÑERO B:
     * Cálculos y redondeos con Math
     */

     // Calcular el subtotal
     double subtotal = precio * cantidad;

     // Calcular el monto del descuento
     double montoDescuento = subtotal * (descuento / 100.0);

     // Calcular el total antes del redondeo
     double totalSinRedondear = subtotal - montoDescuento;

     // Evitar que el total sea menor que cero
     totalSinRedondear = Math.max(0, totalSinRedondear);

     // Redondear el total a dos decimales
     double total = Math.round(totalSinRedondear * 100.0) / 100.0;

     // Redondear el subtotal a dos decimales
     subtotal = Math.round(subtotal * 100.0) / 100.0;

     // Redondear el monto del descuento a dos decimales
     montoDescuento = Math.round(montoDescuento * 100.0) / 100.0;
 %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado del Cálculo</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow border-0">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0">Resumen de la Operación</h4>
                    </div>
                    <div class="card-body p-4">
                        <ul class="list-group list-group-flush mb-4">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Precio Unitario:</span>
                                <strong>$ <%= String.format("%.2f", precio) %></strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Cantidad:</span>
                                <strong>
                                    <%= cantidad %>
                                </strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>Subtotal:</span>
                                <strong>$ <%= String.format("%.2f", subtotal) %></strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center text-danger">
                                <span>Descuento Aplicado (<%= descuento %>%):</span>
                                <strong>- $ <%= String.format("%.2f", montoDescuento) %></strong>
                            </li>
                            <li
                                class="list-group-item d-flex justify-content-between align-items-center bg-light font-weight-bold fs-5">
                                <span>Total Final:</span>
                                <span class="badge bg-success text-wrap fs-5">$ <%= String.format("%.2f", total) %>
                                        </span>
                            </li>
                        </ul>

                        <div class="d-grid">
                            <a href="index.jsp" class="btn btn-outline-secondary">Realizar otro cálculo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>