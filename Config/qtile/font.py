
"""
file containing a selection of possible sets of fonts
"""

# singular fonts
victormono = {
    "family" : "VictorMono Nerd Font Semibold",
    "fontsize" : 16,
    "padding" : 3
}

cozette = {
    "family" : "CozetteVector",
    "fontsize" : 24,
    "padding" : 0
}

firacode = {
    "family" : "FiraCode Nerd Font Mono",
    "fontsize" : 14,
    "padding" : 3
}


firacode_large = {
    "family" : "FiraCode Nerd Font Mono",
    "fontsize" : 22,
    "padding" : 3
}




# font sets
all_victormono = {
    "clear" : victormono,
    "mono" : victormono,
    "secondary" : victormono
}

all_firacode = {
    "clear" : firacode_large,
    "mono" : firacode,
    "secondary": firacode
}

# selected font set
font = all_firacode
