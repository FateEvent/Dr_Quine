NAME = Grace

SRCS = ${NAME}.c
OBJS = ${SRCS:.c=.o}
TMP = ${NAME}_kid.c

CC = clang
CFLAGS = -Wall -Wextra -Werror

.c.o:
			$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}

exec:		all
			./${NAME}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME} ${TMP}

re:			fclean all

.PHONY:		all clean fclean re
