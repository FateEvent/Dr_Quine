NAME = Sully

SRCS = ${NAME}.c
OBJS = ${SRCS:.c=.o}
TMP = ${NAME}_*

CC = clang
CFLAGS = -Wall -Wextra -Werror

.c.o:
			$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}
			rm -f ${OBJS}

exec:		all
			./${NAME}
			diff ${SRCS} ${NAME}_4.c

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME} ${TMP}

re:			fclean all

.PHONY:		all clean fclean re
