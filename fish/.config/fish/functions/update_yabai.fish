function update_yabai --description 'executes necessary update steps'
    brew services stop yabai
    brew upgrade yabai
    sudo yabai --uninstall-sa
    sudo yabai --install-sa
    brew services start yabai
end
