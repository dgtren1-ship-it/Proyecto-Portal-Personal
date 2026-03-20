<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:key name="preguntas" match="ROW" use="pregunta_id"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Quiz</title>
            </head>
            <body>
                <h1>Cuestionario</h1>

                <xsl:for-each select="DATA/ROW[generate-id() = generate-id(key('preguntas', pregunta_id)[1])]">
                    <div>
                        <h3>
                            <xsl:value-of select="pregunta"/>
                        </h3>
                        <ul>
                            <xsl:for-each select="key('preguntas', pregunta_id)">
                                <li>
                                    <xsl:value-of select="respuesta"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
