#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdint.h>
#include <Pipes.h>
#include "pipeHandler.h"
#include "inttypes.h"

typedef enum __convActivations {
	none,relu,sigmoid
} convActivations;

