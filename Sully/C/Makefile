NAME = Sully

SRCS = ${NAME}.c
OBJS = ${SRCS:.c=.o}
TMP = ${NAME}_*

CC = clang
CFLAGS = -Wall -Wextra -Werror

.s.o:
			$(CC) $(CFLAGS) $< -o ${<:.s=.o}

all:		${NAME}

${NAME}:	${OBJS}
			$(CC) $(CFLAGS) ${OBJS} -o ${NAME}

exec:		all
			./${NAME}
			diff ${SRCS} ${NAME}_5.c

clean:
			rm -f ${OBJS} ${TMP}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
