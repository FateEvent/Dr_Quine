NAME = Sully

SRCS = ${NAME}.s
OBJS = ${SRCS:.s=.o}
TMP = ${NAME}_*

NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64
LINKER_FLAGS = -m64

.s.o:
			$(NASM) -g $(NASM_FLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			${CC} ${LINKER_FLAGS} -o $@ $^
			rm -f ${OBJS}

exec:		all
			./${NAME}
			diff ${SRCS} ${NAME}_4.s

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME} ${TMP}

re:			fclean all

.PHONY:		all clean fclean re
