# Windows 11 TPM + Secure Boot Bypass

A minimal Windows Setup script for bypassing the Windows 11 TPM 2.0 and Secure Boot requirement checks.

## What it changes

The script creates:

`HKLM\SYSTEM\Setup\LabConfig`

and sets:

- `BypassTPMCheck` = `1`
- `BypassSecureBootCheck` = `1`

It does not modify partitions, bootloaders, personal files, or Windows installation files.

## Usage from Windows 11 Setup

At the Windows Setup requirement screen:

1. Press `Shift + F10`.
2. Run the command below, replacing `USERNAME` with your GitHub username:

```cmd
curl -L https://raw.githubusercontent.com/USERNAME/windows-11-bypass/main/win11-bypass.cmd -o bypass.cmd && bypass.cmd
```

3. Close the script.
4. Close Command Prompt.
5. Return to Windows Setup and retry.

## One-command version

After the repository is published:

```cmd
curl -L https://raw.githubusercontent.com/USERNAME/windows-11-bypass/main/win11-bypass.cmd | cmd
```

## Scope

This repository intentionally contains only a registry-based Windows Setup bypass. It does not attempt to disable Secure Boot in firmware or modify TPM hardware.
