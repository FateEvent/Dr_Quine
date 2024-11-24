NAME = Colleen

SRCS = ${NAME}.s
OBJS = ${SRCS:.s=.o}

NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64
LINKER_FLAGS = -m64
# CFLAGS = -Wall -Wextra -Werror
ASM_DEBUG_FLAGS = -g

.s.o:
			$(NASM) $(NASM_FLAGS) $< -o ${<:.s=.o}

all:		${NAME}

debug:		NASM_FLAGS += $(ASM_DEBUG_FLAGS)
debug:		all


${NAME}:	${OBJS}
			${CC} ${LINKER_FLAGS} -o $@ $^

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
