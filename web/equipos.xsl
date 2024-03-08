<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Modulo: LMSGI
    UD: 04
    Fecha 08/03/2024
    Autor: Miriam Costoya
    Tarea: Tarea Evaluativa 2
    Descripción:
        Plantilla principal para el elemento raíz club_voleibol como la principal del documento XSLT.
        Se aplica al elemento raíz del XML. 
        Variable $entrenadorNombre para guardar el nombre del entrenador del equipo. Se utiliza la expresión equipo[entrenador/nombre='Julio Velasco']/entrenador/nombre.
        Mostrar el nombre del entrenador con un enlace a su URL en un encabezado (<h1>) y se enlaza a su URL correspondiente, utilizando la expresión {equipo[entrenador/nombre=$entrenadorNombre]/entrenador/url}.
        Mostrar la información del  equipo entrenado por Julio Velasco, utilizando una plantilla article para mostrar la información del equipo. Se selecciona el nombre del equipo y 
        se muestran los jugadores titulares utilizando la expresión equipo[entrenador/nombre=$entrenadorNombre]/jugadores/jugador[@titular='si'].
    Autoevaluación:https://docs.google.com/document/d/146aeO-C7QJGs0hOZpuA8WbMwT_0WIUTrxjsZwUtwUu0/edit?usp=sharing
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla para el elemento raíz -->
    <xsl:template match="/club_voleibol">
        <!-- Guardar el nombre del entrenador en una variable -->
        <xsl:variable name="entrenadorNombre" select="equipo[entrenador/nombre='Julio Velasco']/entrenador/nombre" />
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página de equipos" />
                <title>Equipos - Información del Club de Voleibol</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main>
                    <!-- Información del entrenador -->
                    <h1><a href="{equipo[entrenador/nombre=$entrenadorNombre]/entrenador/url}">
                        <xsl:value-of select="$entrenadorNombre"/>
                    </a></h1>
                    <!-- Información del primer equipo -->
                    <article class="equipos">
                        <h4><xsl:value-of select="equipo[entrenador/nombre=$entrenadorNombre]/nombre"/></h4>
                        <ul>
                            <!-- Jugadores titulares del primer equipo -->
                            <xsl:apply-templates select="equipo[entrenador/nombre=$entrenadorNombre]/jugadores/jugador[@titular='si']"/>
                        </ul>
                    </article>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para la información de cada jugador -->
    <xsl:template match="jugador[@titular='si']">
        <li><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></li>
    </xsl:template>
</xsl:stylesheet>

