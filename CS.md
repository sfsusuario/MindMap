# Apuntes de Arquitectura, Desarrollo y Cloud

## 1. Arquitectura de Software, Patrones y Principios

### SOLID
* **Single Responsibility (Responsabilidad Única):** $\rightarrow$ Clases de Magento.
* **Open/Closed (Abierto/Cerrado):** $\rightarrow$ Implementaciones del Core de NuGet (acepta cambios/extensiones).
* **Liskov Substitution (Sustitución de Liskov):** $\rightarrow$ Tipos de registro de historial (*History Record types*).
    * Herencia (*Inheritance*) / Heredado (*Inherited*).
    * Casteo hacia abajo (*Downcast*).
    * Abierto (*Open*).
    * Métodos de impresión (*Print methods*).
    * Estado (*Status*).
* **Interface Segregation (Segregación de Interfaces):** $\rightarrow$ Similar a Liskov.
    * No sobrecargar las interfaces.
    * Evolución del proyecto (Ej: Outlook $\rightarrow$ Gmail, etc.).
* **Dependency Inversion (Inversión de Dependencias):**
    * Reducir el acoplamiento (*Reduce coupling*).
    * Mocking con pruebas unitarias (*Unit testing*).
    * Referencias al contrato.

### Patrones de Diseño (Design Patterns)
* **Creational (Creacionales):**
    * Builder $\rightarrow$ Linq.
    * Factory + Strategy $\rightarrow$ Proveedor de login / Email / SNS.
* **Structural (Estructurales):**
    * Decorator $\rightarrow$ Plantillas de React (*React templates*).
* **Behavior (Comportamiento):**
    * Strategy $\rightarrow$ Proveedor de login (*Login prov*).
    * Mediator $\rightarrow$ App de capas (*Layers app*).
    * Visitor $\rightarrow$ Parámetros sobrecargados (*Overload parameter*) / Registros de historial (*History Records*) $\rightarrow$ PDF, XLS.

### Resiliencia (Resilience)
* **Retry:** Core de la experiencia.
* **Healthcheck:** $\rightarrow$ Kubernetes.
* **Circuit Breaker:** Tiene dependencias (*Flos dependencies*).
* **Outbox**

### Patrones de Arquitectura y Desarrollo
* **DDD:** Domain Driven Design (Diseño Guiado por el Dominio).
* **EDA:** Event Driven Architecture (Arquitectura Dirigida por Eventos).
* **TDD:** Test Driven Development (Desarrollo Guiado por Pruebas).
* **CQRS:** Command Query Responsibility Segregation $\rightarrow$ Réplicas SQL.
* **SAGA:** Transaction Distributed Systems (Sistemas de Transacciones Distribuidas).
* **MVC**
* **Onion:** Lógica de negocio (*Business logic*).
* **Hexagonal:** Enfoque en separar la infraestructura (*Separate infrastructure focus*).

---

## 2. Bases de Datos y SQL

### SQL Execution Plans (Planes de Ejecución SQL)
* **Access (Acceso):**
    * Escanear las columnas de las tablas, tamaños, etc.
    * Verificar índices y llaves foráneas (*foreign keys*).
* **Unions / Relationships (Uniones / Relaciones):**
    * Joins sobre índices optimizados.
* **Operations and filters (Operaciones y filtros):**
    * Cómo se usan las sentencias (*where, group by, order by*).
    * Si necesita un ordenamiento específico (*specific sort*).

### Buenas Prácticas y Optimización en SQL
* Read-only DB replicas (Réplicas de BD de solo lectura).
* SQL Profiler.
* Cached queries (Consultas en caché).
* `UNION ALL` vs `UNION`.
* Evitar `SELECT *`.
* Repeated subqueries (Subconsultas repetidas).

### Filtros en Consultas
* **Where:** Antes de cualquier agrupación o agregación (*Before any grouping aggregation*).
* **Having:** Después de `count()`, `avg()`, `etc.`

### Normalization Process (Proceso de Normalización)
* **1NF:** Eliminar grupos repetidos de datos (*Remove repeated groups of data*).
* **2NF:** Eliminar dependencias $\rightarrow$ Dividir/separar tabla (*Remove dependencies - split table*).
* **3NF:** Dividir en más segmentos (*Divide more segments*).

### Index Types (Tipos de Índices)
* Primary Keys (Llaves primarias).
* Secondary Keys (Llaves secundarias).
* Foreign Keys (Llaves foráneas).
* Composite index (Índice compuesto - múltiples columnas).
* Unique indexes (Índices únicos).

### Objetos de Base de Datos
* **Views (Vistas):** System views (schema), User defined (sample $\rightarrow$ complex).
* **Stored procedure / Function**

---

## 3. Desarrollo Frontend con Vue.js

### Vue Lifecycle (Ciclo de Vida)
* `beforeCreate`
* `created`
* `beforeMount`
* `mounted`
* `beforeUpdate`
* `updated`
* `beforeUnmount`
* `unmounted`
* `destroyed` *(Nota: Vue 2)*

### Directivas y Condicionales (Conditionals / Attributes)
* `v-if` / `v-else`
* `v-show` (hide)
* `v-for`

### Mutators (Métodos que modifican arrays)
* `push`, `pop`, `shift`, `unshift`, `splice`, `sort`, `reverse`.

### Event Handlers & Binding
* `v-on:click.stop.prevent`
* **Two-way Binding (Enlace bidireccional):** `v-model.lazy`

### Comunicación entre Componentes
* **Props:** $\rightarrow$ `title="..."` (Padre a hijo / *Parent to child*).
* **Emit:** `$emit('...')` (Hijo a padre).
* **Slot:** ¿Parámetros u objetos? (*parameters / objects?*) / `template`.

### Reactividad y Estado (State)
* **Method / Computed Property:**
    * `computed` se almacena en caché (*cached*), solo cambia si cambian las dependencias.
* **Watchers:** Maneja o ejecuta si las dependencias cambian (*handle or execute if dependencies are changed*).
* **Mutation / Payload:**
    * Realiza modificaciones de estado (*perform state modifications*).
    * `Vue.set(..., ..., ...)`

### Estado Global (Status / State Management)
* **Vuex:** Inspirado en Flux.
* **Pinia:** *Actions, dispatchers, stores, views.*

### Vue Router
* Guards (Guardias de navegación).
* Parameters (Parámetros $\rightarrow$ `params`).

### Mixins
* Funciones importadas o compartidas en todos los componentes (*functions imported or shared on all components*).

---

## 4. Fundamentos de Programación y .NET / C#

### Conceptos de POO (Programación Orientada a Objetos)
* **Abstract Class / Interface:**
    * *Abstract Class:* Herencia simple (*Single inheritance*), propiedades, firmas (*sign*), no tiene implementación.
    * *Interface:* Herencia múltiple (*Multiple inheritance*), cuerpo de función no siempre (*function body not always*), es un contrato.
* **Virtual / Override:** Indica métodos sobreescribibles (*indicate overridable methods*).

### Memoria y Ejecución
* **Garbage Collector (Recolector de basura):**
    * Gestionado por el core de .Net (*Managed by core .Net*).
    * Llamada explícita a `Dispose()`.
    * Ident