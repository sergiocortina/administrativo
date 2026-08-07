# Guía de Diapositivas — Derecho Administrativo

## Estructura

```
diapositivas/
├── unidad-01-introduccion-da.html    ← Presentación Unidad 1 (Reveal.js)
├── README-DIAPOSITIVAS.md            ← Este archivo
└── (futuras unidades aquí)
```

## Tecnología

- **Framework:** Reveal.js 5.1.0 (CDN)
- **Formato:** HTML standalone (un solo archivo por unidad)
- **Temas:** Oscuro (fondo #0a0a1a), gradientes azul-púrpura
- **Fuentes:** Inter (cuerpo), Playfair Display (títulos), Font Awesome (iconos)

## Reglas de edición (IMPORTANTE)

### Al INSERTAR diapositivas:
- **NUNCA reemplazar** una diapositiva existente
- **SIEMPRE insertar** la nueva y correr todas las siguientes
- Reveal.js maneja la numeración automáticamente

### Scroll vertical:
- TODAS las diapositivas tienen scroll habilitado por defecto (wheel del mouse o barra)
- Configurado en CSS: `overflow-y: auto` en `.reveal .slides section`

### Teclas de volumen (USB):
- Mapeadas para scroll en todas las presentaciones
- Volumen + = scroll arriba (keyCode 175)
- Volumen - = scroll abajo (keyCode 174)

### Click para avanzar:
- Click en cualquier parte avanza la diapositiva
- Excepciones: links, botones, opciones de quiz, elementos interactivos

### Animaciones (fragments):
- Cada tarjeta/criterio debe tener `class="fragment"` individualmente
- NO agrupar múltiples elementos en un solo fragment
- Patrón correcto: `<div class="card fragment">` por cada elemento

## Estructura de cada diapositiva

```html
<!-- NOMBRE DE LA DIAPOSITIVA -->
<section data-background-color="#0a0a1a">
    <h2><span class="icon-lg">EMOJI</span> Título</h2>
    
    <!-- Contenido con fragmentos -->
    <div class="card card-accent-COLOR fragment">
        <h4 style="color: var(--accent-COLOR);">Subtítulo</h4>
        <p style="font-size: 0.8em;">Contenido</p>
    </div>
</section>
```

## Paleta de colores (clases CSS)

| Clase | Color |
|-------|-------|
| `card-accent-blue` | Azul #4f8cff |
| `card-accent-purple` | Púrpura #a855f7 |
| `card-accent-pink` | Rosa #ec4899 |
| `card-accent-green` | Verde #10b981 |
| `card-accent-orange` | Naranja #f59e0b |
| `card-accent-red` | Rojo #ef4444 |

## Componentes disponibles

- `.card` — Tarjeta de contenido
- `.principle-card` — Tarjeta de principio (con icono)
- `.definition-box` — Caja de definición
- `.fun-fact` — Dato curioso/interesante
- `.real-life` — Ejemplo de la vida real
- `.quiz-card` — Pregunta de autoevaluación
- `.comparison-table` — Tabla comparativa
- `.timeline` + `.timeline-item` — Línea de tiempo
- `.grid-2`, `.grid-3` — Cuadrícula de 2 o 3 columnas
- `.fragment` — Animación de entrada (uno por uno)

## Fuentes del contenido

Ver `../AGENTS.md` para las fuentes doctrinales y legales completas.

### Fuentes principales para la Unidad 1:
- Fernández Ruiz — Cap. I, III, VIII
- Roldán Xopa — Cap. 1, 2
- Hamdan Amad — Tema I
- Artículos constitucionales: 6°, 14, 21, 49, 90, 113

## Contenido actual

### Unidad 1: Introducción al Derecho Administrativo
- ~40 diapositivas
- Secciones: Portada → Mapa curso → Evolución → Concepto → Caracteres → Función → Relaciones → Principios → Legislación → Quiz → Síntesis → Casos → Cierre
