NAME = Sully

SRCS = main.rs
SCAM = Cargo.lock
TMP = ${NAME}_*

CC = clang
CFLAGS = -Wall -Wextra -Werror

all:		${NAME}

${NAME}:
			cargo run
			diff ${NAME}_4.rs ${addprefix src/, ${SRCS}}

fclean:
			cargo clean
			rm -f ${SCAM} ${TMP}

re:			fclean all

.PHONY:		all fclean re
