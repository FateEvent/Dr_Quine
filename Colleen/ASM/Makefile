NAME = Colleen

SRCS = ${NAME}.s
OBJS = ${SRCS:.s=.o}
TMP = tmp_${NAME}

NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64
LINKER_FLAGS = -m64

.s.o:
			$(NASM) $(NASM_FLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			${CC} ${LINKER_FLAGS} -o $@ $^

exec:		all
			./${NAME} > ${TMP}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS} ${TMP}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
