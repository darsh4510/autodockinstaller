# autodockinstaller
# AutoDock Vina & MGLTools Installer (Ubuntu 22.04)

A professional, one-command installer for **AutoDock Vina** and **MGLTools (AutoDockTools)**.

Maintained by **darsh4510**.

---

## ✨ Features

- One-command installation
- Official MGLTools 1.5.7
- Latest AutoDock Vina (Ubuntu repository)
- Automatic dependency installation
- Desktop shortcuts
- Clean `/home/<user>/software` layout
- Safe to re-run

---

## 📁 Installation Layout


/home/<user>/software/
└── mgltools/
└── mgltools_x86_64Linux2_1.5.7/
└── bin/
├── adt
└── pythonsh


Desktop launchers:
- AutoDockTools (GUI)
- AutoDock Vina (CLI)

---

## ⚙️ System Requirements

- Ubuntu 22.04 LTS
- sudo privileges
- Active internet connection
- Xorg session recommended (for GUI)

---

## 🚀 Installation

```bash
git clone https://github.com/darsh4510/autodock-installer.git
cd autodock-installer
chmod +x install.sh
./install.sh
```
The installer will:

    Create /home/<user>/software

    Install all dependencies

    Download and install MGLTools

    Install AutoDock Vina

    Configure PATH

    Create desktop icons

🧪 Usage
AutoDockTools (GUI)

adt

or launch from the Desktop icon.
AutoDock Vina (CLI)

vina --help

🖥 Desktop Icons

After installation:

    Go to Desktop

    Right-click the icons

    Select Allow Launching

⚠️ Important Notes (Ubuntu 22.04)

    MGLTools requires Python 2, which is installed automatically

    For best GUI compatibility:

        Logout

        Select Ubuntu on Xorg

        Login again

    OpenGL or VMware warnings can usually be ignored

🔁 Re-running the Installer

The script is safe to re-run:

./install.sh

Already-installed components will be skipped.
📜 License

MIT License
🙏 Disclaimer

This project does not redistribute proprietary software.

All software is downloaded from official sources:

    MGLTools: Scripps Research Institute

    AutoDock Vina: Ubuntu repositories

This installer is intended for academic and research use.
