NAME = Colleen

SRCS = ${NAME}.c
OBJS = ${SRCS:.c=.o}
TMP = tmp_${NAME}

CC = clang
CFLAGS = -Wall -Wextra -Werror

.s.o:
			$(CC) $(CFLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}
			rm -f ${OBJS}

exec:		all
			./${NAME} > ${TMP}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME} ${TMP}

re:			fclean all

.PHONY:		all clean fclean re
