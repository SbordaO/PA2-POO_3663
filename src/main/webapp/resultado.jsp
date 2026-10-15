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

/*
 * COMPAÑERO B:
 * Cálculos y redondeos con Math
 */

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
