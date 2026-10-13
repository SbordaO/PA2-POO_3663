
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
