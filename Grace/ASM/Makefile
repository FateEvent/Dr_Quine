NAME = Grace

SRCS = ${NAME}.s
OBJS = ${SRCS:.s=.o}
TMP = ${NAME}_kid.s

NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64
LINKER_FLAGS = -m64

.s.o:
			$(NASM) -g $(NASM_FLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			${CC} ${LINKER_FLAGS} -o $@ $^

exec:		all
			./${NAME}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS} ${TMP}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
