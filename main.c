#include <locale.h>
#include <stdio.h>
#include <libintl.h>

#include "gettext.h"
#include "second.h"
// thanks, https://chat.openai.com/chat

void print_menu() {
    printf("%s\n", _("Menu:")); printf("%s\n", _("1. Play"));
    printf("%s\n", _("2. Options"));
    printf("%s\n", _("3. Quit"));
}

int main(void) {
    printf("%s\n", _("Welcome to My Game!"));

    print_menu();

    int choice;
    scanf("%d", &choice);

    switch (choice) {
        case 1:
            play_game();
            break;
        case 2:
            show_options();
            break;
        case 3:
            printf("%s\n", _("Goodbye!"));
            break;
        default:
            printf("%s\n", _("Invalid choice."));
            break;
    }

    return 0;
}
