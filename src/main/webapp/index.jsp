<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CotizaFácil - Inicio</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
        }

        .contenedor {
            max-width: 520px;
            margin: 60px auto;
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 8px 30px #00000012;
        }

        h1 { color: #2563eb; margin-bottom: 5px; }
        .subtitulo { color: #64748b; margin-bottom: 30px; }

        label {
            display: block;
            font-weight: bold;
            margin: 18px 0 8px;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
        }

        input:focus {
            outline: 2px solid #93c5fd;
            border-color: #2563eb;
        }

        button {
            width: 100%;
            margin-top: 28px;
            padding: 14px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 7px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover { background: #1d4ed8; }

        .nota {
            margin-top: 20px;
            font-size: 13px;
            color: #64748b;
            text-align: center;
        }

        @media (max-width: 600px) {
            .contenedor { margin: 20px 12px; padding: 24px; }
        }
    </style>
</head>
<body>

<div class="contenedor">
    <h1>CotizaFácil</h1>
    <p class="subtitulo">Sistema web de cotización de productos</p>

    <form action="resultado.jsp" method="post" accept-charset="UTF-8">

        <label for="producto">Nombre del producto</label>
        <input type="text" id="producto" name="producto"
               maxlength="100" placeholder="Ej: Laptop Lenovo" required>

        <label for="precio">Precio unitario (S/)</label>
        <input type="number" id="precio" name="precio"
               min="0.01" max="100000000"
               step="0.01" placeholder="Ej: 2500.00" required>

        <label for="cantidad">Cantidad</label>
        <input type="number" id="cantidad" name="cantidad"
               min="1" max="100000"
               step="1" placeholder="Ej: 2" required>

        <label for="descuento">Descuento (%)</label>
        <input type="number" id="descuento" name="descuento"
               min="0" max="100" step="0.01"
               value="0" required>

        <button type="submit">Calcular cotización</button>
    </form>

    <p class="nota">Proyecto académico - Programación Orientada a Objetos</p>
</div>

</body>
</html>
