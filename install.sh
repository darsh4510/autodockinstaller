#!/usr/bin/env bash
set -euo pipefail

############################################################
# AutoDock Vina + MGLTools Installer
# OS: Ubuntu 22.04 LTS
# Author: darsh4510
# GitHub: https://github.com/darsh4510/autodock-installer
############################################################

# ---------------- CONFIG ----------------
SOFTWARE_DIR="$HOME/software"
MGL_DIR="$SOFTWARE_DIR/mgltools"
MGL_VERSION="mgltools_x86_64Linux2_1.5.7"
MGL_PATH="$MGL_DIR/$MGL_VERSION"
BIN_DIR="$MGL_PATH/bin"
DESKTOP_DIR="$HOME/Desktop"
MGL_URL="https://ccsb.scripps.edu/download/532/"
# ----------------------------------------

echo "================================================="
echo " AutoDock Vina + MGLTools Installer"
echo " Ubuntu 22.04 LTS"
echo "================================================="

# 1. CREATE DIRECTORY STRUCTURE
echo "[1/6] Creating /home/<user>/software directory..."
mkdir -p "$SOFTWARE_DIR" "$MGL_DIR"

# 2. INSTALL SYSTEM DEPENDENCIES
echo "[2/6] Installing system dependencies..."
sudo apt update
sudo apt install -y \
    python2 \
    python2-dev \
    libxmu6 \
    libxi6 \
    libglu1-mesa \
    libgl1 \
    libstdc++6 \
    wget \
    tar \
    unzip \
    autodock-vina

# 3. INSTALL MGLTOOLS (OFFICIAL LATEST)
echo "[3/6] Installing MGLTools 1.5.7..."

if [ ! -d "$MGL_PATH" ]; then
    cd "$MGL_DIR"
    wget -O mgltools.tar.gz "$MGL_URL"
    tar -xzf mgltools.tar.gz
    cd "$MGL_VERSION"
    ./install.sh
else
    echo "✔ MGLTools already installed. Skipping."
fi

# 4. ADD MGLTOOLS TO PATH
echo "[4/6] Configuring PATH..."

if ! grep -q "$BIN_DIR" "$HOME/.bashrc"; then
    {
        echo ""
        echo "# MGLTools PATH"
        echo "export PATH=\$PATH:$BIN_DIR"
    } >> "$HOME/.bashrc"
fi

# 5. CREATE DESKTOP SHORTCUTS
echo "[5/6] Creating Desktop shortcuts..."

cat > "$DESKTOP_DIR/AutoDockTools.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=AutoDockTools
Comment=AutoDockTools (MGLTools)
Exec=$BIN_DIR/adt
Icon=applications-science
Terminal=false
Categories=Science;
EOF

cat > "$DESKTOP_DIR/AutoDockVina.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=AutoDock Vina
Comment=AutoDock Vina (CLI)
Exec=gnome-terminal -- vina --help
Icon=applications-science
Terminal=true
Categories=Science;
EOF

chmod +x "$DESKTOP_DIR/"*.desktop

# 6. FINALIZE
source "$HOME/.bashrc"

echo "================================================="
echo " ✅ INSTALLATION COMPLETE"
echo "================================================="
echo "Installed location:"
echo " $SOFTWARE_DIR"
echo ""
echo "Commands:"
echo "  adt"
echo "  vina"
echo ""
echo "IMPORTANT:"
echo " • Right-click Desktop icons → Allow Launching"
echo " • If ADT window is blank:"
echo "   Logout → Login using 'Ubuntu on Xorg'"
