# nix-fleet

My personal NixOS configuration for most machines in my home network — managed using [flake-parts](https://github.com/hercules-ci/flake-parts), [home-manager](https://github.com/nix-community/home-manager) and [sops-nix](https://github.com/Mic92/sops-nix).

The module structure follows the dendritic pattern: modules are organized in a tree that mirrors their flake name, and auto-imported via [import-tree](https://github.com/vic/import-tree). Each file declares a single `nixosModule` or `homeModule` named after its path (e.g. `modules/gaming/sys/steam.nix` → `gaming-sys-steam`).

## Hosts

| Host | Description | Desktop | User |
|------|-------------|---------|------|
| `computer-mo` | Main desktop (x86_64) | GNOME | mo |
| `computer-nadine` | Second desktop (x86_64) | KDE Plasma 6 | nadine |
| `deck` | Steam Deck | KDE Plasma 6 (Jovian NixOS) | deck |
| `cloud-server` | VPS / cloud server (x86_64) | — | administrator |

## Structure

```
modules/
├── apps/          # Applications 
├── base/          # Base system
├── desktop/       # Desktop-specific
├── disks/         # Disk layouts via disko
├── gaming/        # Gaming
├── gnome/         # GNOME system modules & per-user config
├── hosts/         # Per-host nixosConfiguration entry points
├── hypervisor/    # Virtualisation
├── hyprland/      # Hyprland
├── kde/           # KDE Plasma system modules & per-user config
├── platform/      # Cross-cutting concerns (Nix cache, auto-upgrades, mkHost)
├── security/      # Secure Boot (lanzaboote), sops-nix, secrets
├── services/      # Server services
└── users/         # User definitions
```

`sys/` modules configure the NixOS system level; `usr/` modules configure the home-manager level. Group modules (e.g. `base/group-base.nix`) bundle related modules for convenient importing.

## Flake inputs

| Input | Purpose |
|-------|---------|
| `nixpkgs` (unstable) | Package base |
| `home-manager` | User-level configuration |
| `sops-nix` | Secrets management |
| `disko` | Declarative disk partitioning |
| `lanzaboote` | Secure Boot |
| `plasma-manager` | KDE Plasma config via home-manager |
| `jovian-nixos` | Steam Deck support |
| `caelestia-shell` | Hyprland shell (experimental) |
| `import-tree` | Auto-import of the module tree |

## Secrets

Secrets are encrypted with [sops](https://github.com/getsops/sops#2usage) and stored in `modules/security/secrets/secrets.yaml`.

## Deployment

```bash
# Rebuild from GitHub
sudo nixos-rebuild switch --refresh --flake github:Moe1369/nix-fleet#<host>

# Rebuild from self-hosted Gitea
sudo nixos-rebuild switch --refresh --flake git+https://gitea.chrayed.de/Chrayed/nix-fleet#<host>
```

Both aliases are available as `rebuild` and `rebuild-from-gitea` in the shell. All hosts run automatic upgrades every Sunday at 04:00, followed by a garbage collection at 04:30 (generations older than 7 days are deleted).

## Nix cache

Private binary cache via [garnix.io](https://garnix.io).
