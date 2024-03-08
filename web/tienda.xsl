<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Modulo: LMSGI
    UD: 04
    Fecha 08/03/2024
    Autor: Miriam Costoya
    Tarea: Tarea Evaluativa 2
    Descripción:
        Se define la plantilla principal para el elemento raíz ("/"). 
        En la sección principal (<main>), se aplica una plantilla a los elementos <articulo> dentro del elemento <tienda>.
        Se define una plantilla para los elementos <articulo>, incluye la visualización de la imagen del artículo, su precio y el número de comentarios. 
        Se aplica otra plantilla a los elementos <comentarios> dentro de cada artículo.
        Se define una plantilla para los elementos <comentarios>, que muestra la fecha y el contenido del comentario.    
    Autoevaluación:https://docs.google.com/document/d/146aeO-C7QJGs0hOZpuA8WbMwT_0WIUTrxjsZwUtwUu0/edit?usp=sharing
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla principal para el elemento raíz -->
    <xsl:template match="/">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>Tienda de Voleibol</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main class="principal">
                    <!-- Aplicar plantillas a los elementos articulo dentro de la tienda -->
                    <xsl:apply-templates select="/club_voleibol/tienda/articulo"/>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para los elementos articulo -->
    <xsl:template match="articulo">
        <!-- Artículo de la tienda -->
        <article>
            <section>
                <!-- Imagen del artículo -->
                <img class="articulo" src="{@foto}"/>			
            </section>
            <section>
                <!-- Precio del artículo -->
                <h2><xsl:value-of select="precio"/> €</h2>
                <!-- Número de comentarios -->
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <!-- Lista de comentarios -->
                <ul>
                    <!-- Aplicar plantillas a los elementos comentarios dentro del artículo -->
                    <xsl:apply-templates select="comentarios"/>
                </ul>
            </section>
        </article>
    </xsl:template>
    
    <!-- Plantilla para los elementos comentarios -->
    <xsl:template match="comentarios">
        <!-- Elemento de lista para cada comentario -->
        <li><xsl:value-of select="@fecha"/>: <xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>

