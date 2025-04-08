# up

- Version 0.1.x of `up` provides a simple bash script for automating the installation of a few commonly required tools.
- Version ≥0.2.0 will provide a TUI (described below)

# Roadmap

The tool is now being extended to provide a Text User Interface (TUI) for:
1. Orchestrating the creation and management of infrastructure, using terraform Infrastructure as Code (IaC)
2. Provisioning known servers using Ansible
3. Managing containerised services (initially limtied to docker compose on a single server)

`up` will be configured by users for their specific needs using standard terraform, ansible, docker compose and .env files.

## Installation

Install the `up` command by typing `curl up.e3s.uk|sh`

## Example usage

```
curl up.e3s.uk|sh
up dnr

# or...
up d  # install docker
up n  # install neovim
up dn # install docker and neovim, etc.
```

See [`up.sh`](https://github.com/e3suk/up/blob/165763a941e1477411c6502fa07c905a800c0a46/up.sh#L36-L38) for all available commands.

## Warning

See `index.html` in this repository for the code that is downloaded and executed via GitHub pages when you install using the `curl up` command.

**Important:** don't trust code repositories like this one - fork the code and verify that it does what you expect.
