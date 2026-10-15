<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cálculo de Compra</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Calculadora de Subtotal y Descuento</h4>
                        </div>
                        <div class="card-body">
                            <form action="resultado.jsp" method="post">
                                <div class="mb-3">
                                    <label for="precio" class="form-label">Precio Unitario ($):</label>
                                    <input type="number" step="0.01" min="0" class="form-control" id="precio"
                                        name="precio" required placeholder="Ej. 150.50">
                                </div>

                                <div class="mb-3">
                                    <label for="cantidad" class="form-label">Cantidad:</label>
                                    <input type="number" min="1" class="form-control" id="cantidad" name="cantidad"
                                        required placeholder="Ej. 3">
                                </div>

                                <div class="mb-3">
                                    <label for="descuento" class="form-label">Descuento (%):</label>
                                    <input type="number" step="0.01" min="0" max="100" class="form-control"
                                        id="descuento" name="descuento" required placeholder="Ej. 10">
                                </div>

                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary btn-block">Calcular</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

    </html>