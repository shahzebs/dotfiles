//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {" ", "playback 2>/dev/null", 15, 3},
    {"", "weather 2>/dev/null", 900, 0},
    {"", "dropbx 2>/dev/null", 10, 0},
    {"", "cpuload 2>/dev/null", 3, 0},
    {"", "cputemp 2>/dev/null", 3, 0},
    {"", "memory 2>/dev/null", 5, 0},
    {"", "wifi 2>/dev/null", 10, 2},
    {"", "volume 2>/dev/null", 60, 1},
    {"", "iodevices 2>/dev/null", 10, 1},
    {"", "brightness 2>/dev/null", 0, 4},
    {"", "battery BAT0 2>/dev/null", 15, 0},
	{"", "datetime 2>/dev/null", 30, 0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '\0';
