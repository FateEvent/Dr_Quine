NAME = Colleen

SRCS = ${NAME}.c
OBJS = ${SRCS:.c=.o}
TMP = tmp_${NAME}

CC = clang
CFLAGS = -Wall -Wextra -Werror

.c.o:
			$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}

exec:		all
			./${NAME} > ${TMP}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME} ${TMP}

re:			fclean all

.PHONY:		all clean fclean re
