# DocketWise Demo

Una aplicación de gestión de casos de inmigración construida como proyecto 
personal para entender y replicar las funcionalidades core de DocketWise.

## Demo en vivo
[https://docketwise-rails-demo.onrender.com](https://docketwise-rails-demo.onrender.com)

## Features implementadas

- Autenticación segura con Devise (email + password)
- Gestión de clientes (solicitantes) con búsqueda en tiempo real
- Búsqueda filtrada con Turbo Frames — sin recarga de página
- Creación y gestión de eventos por cliente
- Sistema de notas asociadas a cada cliente
- Generación de PDF de expedientes con Prawn
- Autorización por scope — cada usuario solo ve sus propios datos

## Stack técnico

| Tecnología | Versión | Propósito |
|---|---|---|
| Ruby on Rails | 8.1.2 | Framework principal |
| SQLite3 | - | Base de datos |
| Devise | 5.0.2 | Autenticación |
| Turbo Rails | - | Interactividad sin JS |
| Prawn | - | Generación de PDFs |
| Kamal | - | Deploy |

## Decisiones técnicas

**Búsqueda en tiempo real con Turbo Frames**
En lugar de usar JavaScript personalizado, implementé la búsqueda 
usando `turbo_frame_tag` y `oninput: "this.form.requestSubmit()"`. 
Esto actualiza solo la tabla de resultados sin recargar la página 
completa, reduciendo la carga del servidor y mejorando la experiencia 
del usuario.

**Seguridad por scope**
Todas las queries usan `current_user.solicitantes` en lugar de 
`Solicitante.all`. Esto garantiza que un usuario nunca pueda acceder 
a datos de otro usuario, incluso manipulando IDs en la URL.

**SQL case-insensitive**
La búsqueda usa `LOWER(nombre) LIKE LOWER(?)` para que "hugo", 
"Hugo" y "HUGO" devuelvan los mismos resultados.

## Instalación local

```bash
git clone https://github.com/McHuginho/docketwise-demo
cd docketwise-demo
bundle install
rails db:create db:migrate db:seed
rails server
```

## Contexto

Este proyecto nació de mi interés por transicionar al equipo de 
ingeniería de DocketWise. Lo construí para entender las funcionalidades 
de la plataforma desde adentro, aplicando los principios de Rails, 
seguridad, y buenas prácticas de desarrollo que he venido estudiando.