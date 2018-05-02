
int main() {

    char q[6];
    translate_number_word(0.34, q);
    printf("%s\n", q);

    load_configure();

    printf("Seed starts...\n");

    action_seed  ("base");
    action_flower("base");

    printf("Over.\n");}
