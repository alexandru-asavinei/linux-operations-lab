# Linux Operations Lab

A hands-on DevOps portfolio focused on Linux administration,
Bash automation, system diagnostics, and troubleshooting.

## Goals

- Practice command-line operations.
- Automate repeatable system checks.
- Build and test maintainable Bash scripts.
- Document troubleshooting procedures.
- Verify results before publishing changes.

## Repository Structure

```text
linux-operations-lab/
├── docs/
├── exercises/
├── scripts/
│   └── system-report.sh
├── tests/
│   └── test-system-report.sh
└── README.md
```

## Requirements

- macOS or Linux
- Bash
- Standard command-line utilities
- Git

## First Lab: System Diagnostics

The first script collects basic system information,
including the operating system, hostname, uptime, and
filesystem usage for the current directory.

Run it with:

```bash
bash scripts/system-report.sh
```

Run the automated checks with:

```bash
bash tests/test-system-report.sh
```

## Platform Compatibility

The initial lab is designed to run on macOS and Linux.
Commands and outputs can differ between operating systems.

Linux-specific administration exercises will be documented
and tested in a Linux environment as the project progresses.

## Security

The scripts must not collect credentials, access tokens,
or other secrets. Review output before sharing it publicly.

## Status

Initial lab in development. Features are not considered
complete until their checks have passed.
