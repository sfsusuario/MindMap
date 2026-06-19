Integración en el flujo de trabajo:

MENCIONAR EL CHATBOT, Y TAMBIÉN ALGUNOS MODELOS DE CLASIFICACIÓN MER.

1. Herramientas
    1. Claude code
    2. Github copilot
    3. Gemini antigravity
2. Pipelines
    1. Snyk
    2. Github copilot (github actions)
    3. Sonar
3. Desarrollo
    1. Entender mejor el código - explicar
    2. Encontrar y explicar bugs o errores más rápido.
    3. Generar casos de prueba y cobertura de código.
    4. Documentación de código
    5. Comparar opciones de arquitectura
    6. Utilizar Skills especializadas para frontend / backend on buenas prácticas
4. Técnicas para validar el código
    1. Realizar una planificación del mismo.
    2. Entender como funciona el código.
    3. Validar principios SOLID, patrones de diseño, y complejidad
    4. Validar reglas de negocio fuera de la US - cosas que la IA no conoce en la integralidad del proyecto: afecta otros microservicios o módulo.
    5. Doy feedback al la codificación de la IA para validar el código
    6. A veces se genera código repetitivo, detectar patrones y organizarlo

## Flujo completo

1. Entender el requerimiento funcional US
    1. Buscar elementos contradictorios.
    2. Añadir mas detalles funcionales.
    3. Ver incongruencias con definiciones anteriores.
2. Refinar la US con el business analyst.
    1. Realizar reuniones de refinamiento.
    2. Comentar US con propuestas de mejoras o enfoque distinto.
    3. Entender requerimientos.
3. Validar con la herramienta IA temas funcionales, y encontrar casos border
    1. Refinar nuevamente con BA si es necesario, añadir mas detalles.
4. Planificación de la implementación del ticket con IA.
    1. Revisar el plan generado por la herramienta y aplicar feedback.
    2. Validar si el enfoque de la solución tiene sentido, y cubre todos los AC.
5. Ejecutar la codificación
    1. Entender claramente como funciona el código
    2. Validar si esto afecta desarrollos o modulos adicionales para comentarlo al QA
    3. Ver sección: Técnicas para validar el código
6. Realizar una prueba completa funcional en mi ambiente LOCAL para validar que todo funciona correctamente y los escenaros de la US se reflejan.
7. Detallar el PR con el contexto y la solución (esto con ayuda de IA).
8. El equipo revisa en conjunto el PR
    1. Validación en pipeline de vulnerabilidades Snyk.
    2. Validación de buenas prácticas en el código con Lint en el pipeline (convenciones definidas).
    3. Github copilot analiza el código cross-repositorios, contra definiciones de US previas y comparte comentarios en el código. Algunos tienen sentido y aplican.
    4. No afecte otros desarrollos en curso.
    5. Doble check de criterio técnico para aprobación del PR.
    6. Resolución de comentarios y actualización del PR.
9. Se despliega en el ambiente donde los QA revisan funcionalmente el desarrollo.
    1. Si reportan bugs se repite el proceso de correcciones y validaciones.
10. Se aprueba y certifica finalmente para UAT.

MCP:

- SERVER SIDE
    - RESOURCES
    - PROMPTS
    - TOOLS
- CLIENTE SIDE CLASS

AGENTES:

- Me apoyo en agentes integrados como Claude, Github copilot etc, definiendo planes de ejecución.
- Enrobustecer la validación de cada desarrollo aplicando Skills especializadas en backend, frontend y bases de datos.
- Definiciones de prompts especializados para generar tareas repetitivas
    - Creación de PRs.
    - Apoyo en code reviews.
    - Validación de covencioens de código para el proyecto.
    - Lineamientos de arquitectura y organización del proyecto etc.
- Tener un entendimiento más rapido del proyecto ejecutando multiples agentes que investigan el codigo fuente de uno o varios repositorios y sus relaciones.
- He contruido flujos de trabajo supervisados con python integrando diferentes tipos de tareas claras, modelos especializados, prompt caching, control de contexto, e iteraciones sobre problemas. Los agentes ejecutan:
    - Analizador: Analiza la US, sus dependencias y estructura los requerimiento en un markdown.
    - Eplorador: Varios agentes revisan la estructura del código bajo unas pautas, analizando el codigo existnte en diferentes repositorios que se van a ver afectados ganando contexto del estado actual del proyecto. Aqui el modelo itera varias veces.
    - Planificador: Planifica con los resultados previos, como integrar los cambios con el conocimiento de contexto y la definicion funcional, generando un markdown final con el plan de integración delas nuevas funcionalidades. Aqui itera muchas veces hasta que el modelo define que ya es posible, o se le da feedback.
    - Codificador: Implementa los cambios utilizando tools para modificar archivos, integrar cambios y ejecutar comandos para compilar y validar el código.
        - Ejecuta loops para validar las ejecución de las pruebas y cobertura de escenarios en el código.
    - Otros flujos de apoyo: utilizo otros flujos para aplicar feedback, revisión de pullrequests conservando el contexto inicial de la planificación, o para solucionr bugs, etc.
    - Desplegar cambios con MCP como github, para generar el PR final con su documentación.