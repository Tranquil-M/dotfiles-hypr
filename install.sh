if [ -f /etc/arch-release ]; then
    echo "Welcome to Tranquil-M's Dotfiles!"
    
    SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
    cd $SCRIPT_DIR
    
    echo "Installing Packages"
    sh scripts/install_packages.sh
    
    echo "Setting Defaults"
    sh scripts/set_defaults.sh

    echo "Applying Symlinks"
    sh scripts/create_symlinks.sh

    echo "Installing Firefox Themes"
    sh scripts/install_firefox_theme.sh
    
    echo "Running Post Install Scripts"
    sh ~/.config/hypr/conf.d/scripts/create_workspaces.sh

    echo "All done!"
    exit 0
fi

