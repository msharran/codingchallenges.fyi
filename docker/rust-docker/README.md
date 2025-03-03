# dkr: A Simple Container Runtime in Rust

`dkr` is a minimalistic container runtime written in Rust, demonstrating core containerization concepts using Linux namespaces and system calls. It's intended for educational purposes, showcasing how containers work at a low level.  This is *not* a production-ready solution.

## Features

- **UTS Namespace Isolation:** Provides a separate hostname for the container (`nix::unistd::sethostname`).
- **PID Namespace Isolation:**  Creates an isolated process tree for the container (`nix::sched::unshare(CloneFlags::CLONE_NEWPID)`).
- **Root Filesystem Change:** Uses `chroot` to change the container's root directory to `/alpine-root`.  **You must create and populate this directory beforehand (see below).**
- **Command Execution:** Executes a user-provided command within the container, inheriting stdin, stdout, and stderr.
- **Basic Error Handling:**  Provides informative error messages.

## Prerequisites

1.  **Rust:** Install Rust: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install).
2.  **Root Privileges:** Running `dkr` requires root privileges (or appropriate capabilities) for namespace creation (use `sudo`).
3.  **Alpine Root Filesystem (`/alpine-root`):** Create and populate this directory with a minimal Linux filesystem:

    ```bash
    sudo mkdir /alpine-root
    sudo docker create --name alpine-temp alpine
    sudo docker export alpine-temp | sudo tar -xf - -C /alpine-root
    sudo docker rm alpine-temp
    ```
4.  **direnv (optional):** Install `direnv` and run `direnv allow` in the project directory (for `.envrc`).

## Building

```bash
git clone <repository_url>  # Replace with your repository URL
cd rust-docker
cargo build
```

## Running

```bash
sudo ./target/debug/dkr /bin/sh
```

This creates a container, sets its hostname to "container", changes its root to `/alpine-root`, and executes `/bin/sh`.  You'll get a shell prompt (`#`).  Available commands depend on what's in `/alpine-root`.

**Example:**

```
# (After running the above command)
# hostname
container
# ps  # (May not be available)
# exit
```

## Limitations

- **No Network Isolation:** The container shares the host's network.
- **No User Namespace Isolation:** The container's root user is the host's root user (though `chroot` provides some isolation).
- **No Mount Namespace Isolation (beyond `chroot`):**  Limited filesystem isolation.
- **No Resource Limits (cgroups):** No CPU, memory, or other resource limits.
- **Minimal Filesystem:**  You must manually create `/alpine-root`.
- **Security:**  This is a *demonstration* and is **not secure** for production use.
- **Basic Signal Handling.**
- **`println!` Restriction:** Uses `write_stdout` instead of `println!` in the child process for safety after `fork`.

## Further Exploration

- Add network namespaces and virtual network interfaces.
- Implement mount and user namespaces.
- Use cgroups for resource limiting.
- Explore image management.

This project provides hands-on experience with the core components of containers. Experiment and learn!
