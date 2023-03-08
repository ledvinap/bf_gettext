#include <stdio.h>
#include "second.h"
#include "gettext.h"

void play_game() {
    printf("%s\n", _("Starting game..."));
}

void show_options() {
    printf("%s\n", _("Display options:"));
    printf("%s\n", _("1. Sound"));
    printf("%s\n", _("2. Graphics"));
}
