APP		:= lsuio

# Add any other object files to this list below
APP_SRCS	:= $(shell ls *.c)
APP_OBJS	:= $(APP_SRCS:.c=.o)
CFLAGS += -DHAVE_CONFIG_H

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)

clean:
	rm -f $(APP_OBJS)
	rm -f $(APP)
