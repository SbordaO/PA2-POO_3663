<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--
 * COMPAÑERO A:
 * Validaciones de datos con String
--%>

<%!
    // Escapar caracteres especiales para mostrar texto en HTML
    public String escaparHtml(String texto) {
        if (texto == null) return "";

        return texto.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    String producto = "";
    double precio = 0;
    int cantidad = 0;
    double descuento = 0;

    double subtotal = 0;
    double montoDescuento = 0;
    double total = 0;

    String error = "";
    boolean valido = false;

    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        error = "Debes enviar el formulario para generar una cotización.";
    } else {
        try {
            // 1. RECIBIR DATOS
            String productoTexto = request.getParameter("producto");
            String precioTexto = request.getParameter("precio");
            String cantidadTexto = request.getParameter("cantidad");
            String descuentoTexto = request.getParameter("descuento");

            // 2. VALIDAR CAMPOS OBLIGATORIOS
            if (productoTexto == null || precioTexto == null ||
                cantidadTexto == null || descuentoTexto == null) {

                error = "Todos los campos son obligatorios.";

            } else {
                // 3. MÉTODOS DE STRING
                producto = productoTexto.trim();

                precioTexto = precioTexto.trim();
                cantidadTexto = cantidadTexto.trim();
                descuentoTexto = descuentoTexto.trim();

                if (producto.isEmpty() ||
                    precioTexto.isEmpty() ||
                    cantidadTexto.isEmpty() ||
                    descuentoTexto.isEmpty()) {

                    error = "No puedes dejar campos vacíos.";

                } else if (producto.length() > 100) {
                    error = "El nombre del producto es demasiado largo.";

                } else {
                    producto = producto.toUpperCase(java.util.Locale.ROOT);

                    // 4. CONVERTIR DATOS
                    precio = Double.parseDouble(precioTexto);
                    cantidad = Integer.parseInt(cantidadTexto);
                    descuento = Double.parseDouble(descuentoTexto);

                    // 5. VALIDACIONES NUMÉRICAS
                    if (!Double.isFinite(precio) ||
                        !Double.isFinite(descuento)) {

                        error = "Los números ingresados no son válidos.";

                    } else if (precio <= 0 || precio > 100000000) {
                        error = "El precio debe ser mayor que cero y no superar 100000000.";

                    } else if (cantidad <= 0 || cantidad > 100000) {
                        error = "La cantidad debe estar entre 1 y 100000.";

                    } else if (descuento < 0 || descuento > 100) {
                        error = "El descuento debe estar entre 0 y 100%.";

                    } else {

<%--
 * COMPAÑERO B:
 * Cálculos y redondeos con Math
--%>

                        // 6. CÁLCULOS
                        subtotal = precio * cantidad;

                        montoDescuento = subtotal * (descuento / 100.0);

                        double totalSinRedondear =
                            subtotal - montoDescuento;

                        // 7. MÉTODOS DE MATH
                        // Limitar el resultado a un mínimo de cero
                        totalSinRedondear = Math.max(0, totalSinRedondear);

                        // Redondear a dos decimales
                        total = Math.round(totalSinRedondear * 100.0) / 100.0;

                        // Redondear también los importes mostrados
                        subtotal = Math.round(subtotal * 100.0) / 100.0;
                        montoDescuento =
                            Math.round(montoDescuento * 100.0) / 100.0;

                        valido = true;

                    }
                }
            }

        } catch (NumberFormatException e) {
            error = "Ingresa números válidos en precio, cantidad y descuento.";
        }
    }

    // Formatear importes con dos decimales
    String subtotalFormato = String.format(
        java.util.Locale.US, "%.2f", subtotal);

    String descuentoFormato = String.format(
        java.util.Locale.US, "%.2f", montoDescuento);

    String totalFormato = String.format(
        java.util.Locale.US, "%.2f", total);

    String precioFormato = String.format(
        java.util.Locale.US, "%.2f", precio);

    String porcentajeFormato = String.format(
        java.util.Locale.US, "%.2f", descuento);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CotizaFácil - Resultado</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        .contenedor {
            max-width: 580px;
            margin: 60px auto;
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 8px 30px #00000012;
        }

        h1 {
            color: #2563eb;
        }

        h2 {
            margin-top: 0;
        }

        .fila {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 13px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .fila span:first-child {
            color: #64748b;
        }

        .fila strong {
            text-align: right;
            overflow-wrap: anywhere;
        }

        .total {
            margin-top: 20px;
            padding: 20px;
            background: #eff6ff;
            border-radius: 9px;
            text-align: center;
        }

        .total p {
            margin: 0;
            color: #475569;
        }

        .total h2 {
            color: #2563eb;
            font-size: 32px;
            margin: 10px 0 0;
        }

        .error {
            padding: 20px;
            background: #fef2f2;
            color: #b91c1c;
            border-radius: 8px;
        }

        .boton {
            display: block;
            margin-top: 25px;
            padding: 13px;
            text-align: center;
            text-decoration: none;
            color: white;
            background: #2563eb;
            border-radius: 7px;
            font-weight: bold;
        }

        .boton:hover {
            background: #1d4ed8;
        }

        @media (max-width: 600px) {
            .contenedor {
                margin: 20px 12px;
                padding: 24px;
            }
        }
    </style>
</head>

<body>

<div class="contenedor">

    <h1>CotizaFácil</h1>

    <% if (valido) { %>

        <h2>Resultado de la cotización</h2>

        <div class="fila">
            <span>Producto:</span>
            <strong><%= escaparHtml(producto) %></strong>
        </div>

        <div class="fila">
            <span>Precio unitario:</span>
            <strong>S/ <%= precioFormato %></strong>
        </div>

        <div class="fila">
            <span>Cantidad:</span>
            <strong><%= cantidad %></strong>
        </div>

        <div class="fila">
            <span>Subtotal:</span>
            <strong>S/ <%= subtotalFormato %></strong>
        </div>

        <div class="fila">
            <span>Descuento aplicado:</span>
            <strong><%= porcentajeFormato %>%</strong>
        </div>

        <div class="fila">
            <span>Monto descontado:</span>
            <strong>S/ <%= descuentoFormato %></strong>
        </div>

        <div class="total">
            <p>Total a pagar</p>
            <h2>S/ <%= totalFormato %></h2>
        </div>

    <% } else { %>

        <h2>No se pudo generar la cotización</h2>

        <div class="error">
            <strong>Error:</strong>
            <p><%= escaparHtml(error) %></p>
        </div>

    <% } %>

    <a class="boton" href="index.jsp">
        Nueva cotización
    </a>

</div>

</body>
</html>
