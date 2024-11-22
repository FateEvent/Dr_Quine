SRCS = Colleen.c
OBJS = ${SRCS:.c=.o}
NAME = Colleen
TMP = tmp_${NAME}

CC = clang
CFLAGS = -Wall -Wextra -Werror

.s.o:
			$(CC) $(CFLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}

exec:		all
			./${NAME} > ${TMP}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS} ${TMP}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
