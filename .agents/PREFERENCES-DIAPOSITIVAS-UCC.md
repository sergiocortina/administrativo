# 🎨 Preferencias de Diapositivas — Cursos UCC

> **Aplica a:** Todos los proyectos de presentaciones con formato Reveal.js  
> **Proyectos actuales:** Derecho Administrativo, Marco Jurídico de los Negocios, Ética, etc.  
> **Última actualización:** Agosto 2026

---

## 📁 Estructura de carpetas por proyecto

```
Nombre del Proyecto/
├── clase/
│   ├── index.html                    ← Página principal del curso
│   ├── diapositivas/
│   │   ├── unidad-01-nombre.html     ← Una archivo HTML por unidad
│   │   ├── unidad-02-nombre.html
│   │   └── ...
│   ├── Material Alumnos/             ← PDFs de estudio (dentro del repo)
│   │   ├── Unidad 1/
│   │   │   ├── Unidad 1.pdf
│   │   │   ├── Cuestionario y Casos.pdf
│   │   │   ├── Actividades.pdf
│   │   │   └── Autoevaluación.pdf
│   │   ├── Unidad 2/
│   │   │   └── ...
│   ├── .gitignore                    ← Permitir PDFs: !Material Alumnos/**/*.pdf
│   └── README-DIAPOSITIVAS.md
```

---

## 🎨 Estilo visual (CSS compartido)

### Paleta de colores
```css
:root {
    --r-background-color: #0a0a1a;        /* Fondo oscuro */
    --r-main-font: 'Inter', sans-serif;    /* Tipografía principal */
    --r-heading-font: 'Playfair Display', serif; /* Títulos */
    --r-main-font-size: 24px;
    --accent-blue: #4f8cff;
    --accent-purple: #a855f7;
    --accent-pink: #ec4899;
    --accent-green: #10b981;
    --accent-orange: #f59e0b;
    --accent-red: #ef4444;
    --glass: rgba(255,255,255,0.06);
    --glass-border: rgba(255,255,255,0.1);
}
```

### Fuentes externas
- **Google Fonts:** Inter (300-900), Playfair Display (700-900)
- **Font Awesome 6.5.1** (CDN)
- **Reveal.js 5.1.0** (CDN) con theme `black.css`

### Tipografía de títulos
- Títulos principales: `Playfair Display`, gradiente azul→morado con `-webkit-background-clip: text`
- Secciones: gradiente azul→morado
- Subtítulos: `rgba(255,255,255,0.6)`

---

## 🧱 Componentes obligatorios en TODA presentación

### 1. ⛶ Botón de Pantalla Completa (esquina superior derecha)
```html
<button class="fullscreen-btn" id="fullscreen-btn" title="Pantalla completa" aria-label="Pantalla completa">
    <i class="fa-solid fa-expand"></i>
</button>
```
- Posición: `fixed, top: 16px, right: 16px, z-index: 9999`
- Cambia ícono expand↔compress
- Soporte webkit (Safari móvil)

### 2. ☰ Botón de Índice (junto al de pantalla completa)
```html
<button class="index-btn" id="index-btn" title="Ir al índice de la unidad" aria-label="Ir al índice de la unidad">
    <i class="fa-solid fa-list-ul"></i>
</button>
```
- Posición: `fixed, top: 16px, right: 76px, z-index: 9999`
- **Semántica:** El índice es el `id="indice"` DENTRO de la misma presentación (Mapa de la Unidad)
- **NUNCA** lleva al índice general del curso, siempre al índice interno de la unidad
- Usa `Reveal.getIndices()` para navegar

### 3. 📊 Contador de Fragmentos (mostrados/total)
```html
<div class="fragment-counter" id="fragment-counter" title="Elementos de la diapositiva (mostrados/total)">
    <span class="fc-current">0</span>/<span class="fc-total">0</span>
</div>
```
- Posición: `fixed, top: 22px, right: 142px, z-index: 9999`
- Solo se muestra cuando la diapositiva tiene fragments (`.has-fragments`)
- Se actualiza en `slidechanged`, `fragmentshown`, `fragmenthidden`

### 4. 🔢 Navegador de Páginas (inferior izquierdo, clicable)
```html
<div class="slide-nav" id="slide-nav" title="Clic para ir a una diapositiva">
    <div class="slide-nav-display">
        <span class="slide-nav-current" id="slide-nav-current">1</span>
        <span class="slide-nav-sep">/</span>
        <span id="slide-nav-total">1</span>
    </div>
    <input type="number" class="slide-nav-input" id="slide-nav-input" min="1" placeholder="">
</div>
```
- Posición: `fixed, bottom: 16px, left: 16px, z-index: 9999`
- Click → aparece input para escribir número de diapositiva
- Enter → navega, Escape → cierra, blur → cierra

---

## 📐 Estructura de diapositivas (orden obligatorio)

Cada unidad HTML debe seguir este orden:

```
1. PORTADA (title-slide)         ← Nombre unidad, profesor, institución
2. MAPA DEL CURSO (opcional)     ← Árbol del curso completo
3. ÍNDICE DE LA UNIDAD (id="indice") ← TOC hipervinculado a cada sección
4. SECCIÓN 1 (section-header)    ← Header con ícono y título
5. ... contenido de sección 1
6. SECCIÓN 2 (section-header)
7. ... contenido de sección 2
8. ... repetir por cada sección
9. QUIZ / AUTOEVALUACIÓN         ← Preguntas interactivas
10. MATERIAL PARA ALUMNOS        ← Links a PDFs (solo en unidades 1+)
11. CIERRE (title-slide)         ← Resumen, lecturas, links
```

---

## 🗂️ Índice de la Unidad (Mapa clickable)

- **SIEMPRE** tener `id="indice"` en el slide del índice
- Cada sección debe tener `id="seccion-X-Y"` (ej: `seccion-2-1`, `seccion-2-5`)
- Los items del árbol son **clickeables** usando `href="#/id-seccion"`
- Usar `<a class="card ..."` en lugar de `<div class="card ..."` para hacerlos clickeables
- Style: `text-decoration: none;` para mantener el look de card

```html
<section data-background-color="#0a0a1a" id="indice">
    <h2><span class="icon-lg">📑</span> Índice de la Unidad X</h2>
    <div class="grid-2">
        <a class="card card-accent-blue" href="#/seccion-1-1" style="display: block; text-decoration: none;">
            <h4 style="color: var(--accent-blue); margin: 0;">1. Nombre del tema</h4>
            <p style="font-size: 0.75em; margin: 4px 0 0;">Subtítulo descriptivo</p>
        </a>
        <!-- ... más cards ... -->
    </div>
</section>
```

---

## 📦 Sección de Material para Alumnos

- **ID:** `id="material-alumnos"`
- **Posición:** Antes del cierre, después del quiz
- **4 cards** con PDFs (colores: blue, purple, green, orange)
- **Código QR** (placeholder si no hay imagen)
- **Ruta relativa:** `../Material Alumnos/Unidad X/` (desde `diapositivas/`)
- **PDFs deben estar dentro del repo** (no fuera en `H:\...`)
- **`.gitignore`** debe incluir: `!Material Alumnos/**/*.pdf`

```html
<section data-background-color="#0a0a1a" id="material-alumnos">
    <h2><span class="icon-lg">📦</span> Material para Alumnos</h2>
    <p style="color: rgba(255,255,255,0.5); font-size: 0.85em;">
        Descarga los materiales de estudio de la Unidad X
    </p>
    <div class="grid-2" style="margin-top: 20px;">
        <div>
            <!-- 4 cards con iconos fa-file-pdf rojos -->
        </div>
        <div class="fragment" style="text-align: center;">
            <!-- QR placeholder o imagen real -->
        </div>
    </div>
</section>
```

---

## 📝 Tipos de diapositivas disponibles

| Tipo | Clase CSS | Uso |
|------|-----------|-----|
| Portada | `class="title-slide"` | Inicio y cierre de unidad |
| Sección | `class="section-header"` | Header de cada tema |
| Contenido | Ninguna especial | Diapositivas normales con cards |
| Definición | `class="definition-box"` | Conceptos clave |
| Cuadro legal | `class="legal-box"` | Artículos de ley |
| Ejemplo | `class="example-box"` | Ejemplos prácticos |
| Dato curioso | `class="fun-fact"` | Datos interesantes |
| Tabla comparativa | `class="comparison-table"` | Comparaciones |
| Quiz | `class="quiz-card"` + `class="quiz-option"` | Preguntas interactivas |
| Timeline | `class="timeline"` + `class="timeline-item"` | Procesos cronológicos |
| Caso práctico | `class="real-life"` | Situaciones reales |
| Princípios | `class="principle-card"` | Conceptos fundamentales |

---

## ⚡ Configuración de Reveal.js (obligatoria)

```javascript
Reveal.initialize({
    hash: true,
    slideNumber: false,           // SIEMPRE oculto (usamos nuestro slide-nav)
    width: 1100,
    height: 700,
    margin: 0.04,
    transition: 'slide',
    transitionSpeed: 'default',
    backgroundTransition: 'fade',
    center: true,
    controls: true,
    controlsLayout: 'edges',
    controlsTutorial: false,
    disableLayout: true,
    plugins: [RevealNotes, RevealMarkdown, RevealHighlight]
});
```

### Plugins incluidos
- `RevealNotes` (notas del presentador)
- `RevealMarkdown` (soporte markdown)
- `RevealHighlight` (resaltado de código)

---

## 🖱️ Interacción (obligatoria)

1. **Click en cualquier lugar → avanza** (excepto links, botones, quiz, scrollbar)
2. **Teclas de volumen → scroll vertical** (keyCode 174/175)
3. **Scroll vertical habilitado** en todas las diapositivas
4. **Fragments** para animar contenido paso a paso

---

## 📏 Reglas de contenido

- **Tipografía de contenido:** 0.85em en cards, 0.75em en detalles
- **Íconos:** Font Awesome 6.x (`fa-solid`)
- **Emojis:** Como decoración visual (`icon-lg` = 1.6em)
- **Negritas:** Para conceptos clave
- **Color highlight:** `var(--accent-blue)` para términos importantes
- **Listas:** Sin bullets nativos, usar `▸` con `::before`
- **Tablas:** Clase `comparison-table`, encabezados con gradiente
- **Responsive:** Grid 2→1 columna en mobile (`@media max-width: 768px`)

---

## 🔄 Checklist al crear nueva presentación

- [ ] Copiar bloque CSS completo desde una presentación existente
- [ ] Incluir los 4 elementos UI (fullscreen, índice, fragment-counter, slide-nav)
- [ ] Bloque JavaScript completo con los 4 handlers de UI
- [ ] Slide de portada con `title-slide`
- [ ] Slide de índice con `id="indice"` y items clickeables
- [ ] Secciones con `id="seccion-X-Y"` 
- [ ] Quiz interactivo al final
- [ ] Sección de Material para Alumnos (si hay PDFs)
- [ ] Slide de cierre con lecturas recomendadas
- [ ] Links de material apuntan a `../Material Alumnos/Unidad X/`
- [ ] PDFs copiados al repo y `.gitignore` actualizado
- [ ] `slideNumber: false` en config
- [ ] Click-to-advance habilitado
- [ ] Scroll vertical habilitado

---

## 🚫 Errores comunes a evitar

1. **NO** usar `../../` para rutas de material → usar `../` (desde `diapositivas/`)
2. **NO** poner PDFs fuera del repo → GitHub Pages no los sirve
3. **NO** usar `slideNumber: true` → conflicto con nuestro slide-nav
4. **NO** hacer el botón de índice navegar al `index.html` del curso → debe ir al slide `#indice` interno
5. **NO** olvidar `id="indice"` → el botón ☰ no funciona sin él
6. **NO** olvidar `id="seccion-X-Y"` en headers → el TOC no puede navegar
7. **NO** usar `<div>` para items del TOC → usar `<a>` para que sean clickeables
