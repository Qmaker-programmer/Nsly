# 🛡️ NSLY VAULT — Gestor de Contraseñas TUI

> Un gestor de contraseñas minimalista, seguro y FACHERO que vive en tu terminal 🖥️

## 🚀 Instalación rápida

```bash
# 1. Entra al directorio
cd nsly_vault

# 2. Descarga dependencias
go mod tidy

# 3. ¡Ejecuta!
go run main.go

# O compila un binario permanente:
go build -o nsly_vault main.go
./nsly_vault

# En Windows:
go build -o nsly_vault.exe main.go
nsly_vault.exe
```

## 🔐 Seguridad

| Capa           | Tecnología                      | Para qué                                |
|----------------|---------------------------------|-----------------------------------------|
| **Autenticación** | bcrypt cost=14              | Verificar contraseña maestra (~1s)       |
| **Cifrado datos** | AES-256-GCM                 | Cifrar cada contraseña guardada          |
| **Deriva de clave** | SHA-256(master+salt)      | Generar clave AES desde tu master pass   |
| **Permisos**    | 0700 dir / 0600 archivos        | Solo tu usuario puede leer los archivos  |

**Los archivos en `~/.nsly_vault/`:**
- `master.hash` — Hash bcrypt de tu contraseña maestra (nunca se guarda en claro)
- `vault.json` — Contraseñas cifradas con AES-256-GCM

## ⌨️ Atajos de teclado

### Global
| Tecla      | Acción                     |
|------------|----------------------------|
| `Ctrl+C`   | Salir de emergencia        |
| `Esc`      | Volver / Bloquear bóveda   |

### Lista de contraseñas
| Tecla      | Acción                     |
|------------|----------------------------|
| `↑/↓` `k/j`| Navegar                    |
| `Enter`    | Ver detalle                |
| `C`        | Copiar contraseña          |
| `D`        | Eliminar entrada           |

### Detalle de contraseña
| Tecla      | Acción                     |
|------------|----------------------------|
| `S`        | Mostrar/ocultar contraseña |
| `C`        | Copiar al clipboard        |
| `D`        | Eliminar entrada           |

### Añadir contraseña
| Tecla      | Acción                     |
|------------|----------------------------|
| `Ctrl+G`   | Generar contraseña aleatoria (en campo contraseña) |

### Generador
| Tecla      | Acción                     |
|------------|----------------------------|
| `←/→`      | Cambiar longitud           |
| `Space`    | Toggle opciones            |
| `C`        | Copiar al clipboard        |

## 📦 Dependencias

```
github.com/atotto/clipboard      — Copiar al portapapeles
github.com/charmbracelet/bubbles — Componentes TUI (textinput)
github.com/charmbracelet/bubbletea — Framework TUI
github.com/charmbracelet/lipgloss  — Estilos para terminal
golang.org/x/crypto/bcrypt         — Hashing seguro
```

## 📤 Exportar

Desde el menú → "Exportar bóveda" → genera un JSON en tu carpeta home con todas
las contraseñas en texto plano. **¡Guárdalo en un lugar seguro y bórralo después!**

## 🗺️ Roadmap

- [x] Cifrado AES-256-GCM
- [x] Generador de contraseñas seguras
- [x] Búsqueda en tiempo real
- [x] Copiar al clipboard
- [x] Exportar JSON
- [x] Medidor de fortaleza de contraseña
- [x] Confirmación antes de eliminar
- [ ] Cifrado del vault completo (no solo passwords)
- [ ] Soporte para TOTP / 2FA codes
- [ ] Sincronización con la nube
- [ ] Importar desde otros gestores (Bitwarden, KeePass)
