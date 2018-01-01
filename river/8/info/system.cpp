void* info_system_get()
{
        
        FILE *read;
        read = popen ("uname -a", "r");
        if (read != NULL)
        {
            fread(info_system, sizeof(char), 1000, read);
            pclose(read);
        }
}
