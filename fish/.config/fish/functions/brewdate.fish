function brewdate --wraps brew --description="updates and upgrades brew"
    brew update && brew upgrade
end