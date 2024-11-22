SRCS = Grace.c
OBJS = ${SRCS:.c=.o}
NAME = Grace
TMP = ${NAME}_kid.c

CC = clang
CFLAGS = -Wall -Wextra -Werror

.s.o:
			$(CC) $(CFLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}

exec:		all
			./${NAME}
			diff ${TMP} ${SRCS}

clean:
			rm -f ${OBJS} ${TMP}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
