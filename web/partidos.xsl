<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Modulo: LMSGI
    UD: 04
    Fecha 08/03/2024
    Autor: Miriam Costoya
    Tarea: Tarea Evaluativa 2
    Descripción:
        Página HTML para mostrar los partidos de voleibol mostrará la lista de partidos de voleibol.
        Lista de partidos creada en una tabla (table) que se obtiene mediante la instrucción <xsl:apply-templates select="partido[lugar/@ciudad='Lima']">, 
        la cual selecciona todos los partidos que se jugaron en la ciudad de Lima y los ordena por fecha de forma descendente.
        Plantilla para cada partido que muestrar la información de cada partido la fecha y el resultado. El resultado se muestra en azul si el equipo visitante obtiene más puntos que el equipo local.        
    Autoevaluación:https://docs.google.com/document/d/146aeO-C7QJGs0hOZpuA8WbMwT_0WIUTrxjsZwUtwUu0/edit?usp=sharing
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla principal para el elemento raíz club_voleibol -->
    <xsl:template match="/club_voleibol">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>Partidos de Voleibol</title>
                <style type="text/css">
                    .resultado-visitante {
                        color: blue;
                    }
                </style>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>

                <main>
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                        <!-- Aplicar plantillas a los elementos partido con lugar/ciudad='Lima' -->
                        <xsl:apply-templates select="partido[lugar/@ciudad='Lima']">
                            <!-- Ordenar los partidos por fecha en orden descendente -->
                            <xsl:sort select="fecha" order="descending"/>
                        </xsl:apply-templates>
                    </table>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para los elementos partido -->
    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <td>
                <!-- Condición para determinar el color del resultado -->
                <xsl:choose>
                    <!-- Si la puntuación del equipo visitante es mayor que la del local  se muestra en azul-->
                    <xsl:when test="equipos/visitante/@puntuacion > equipos/local/@puntuacion">
                        <span class="resultado-visitante">
                            <xsl:value-of select="concat(equipos/local/@puntuacion, ' - ', equipos/visitante/@puntuacion)"/>
                        </span>
                    </xsl:when>
                    <!-- En caso contrario muestra la informacion normal-->
                    <xsl:otherwise>
                        <xsl:value-of select="concat(equipos/local/@puntuacion, ' - ', equipos/visitante/@puntuacion)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>


