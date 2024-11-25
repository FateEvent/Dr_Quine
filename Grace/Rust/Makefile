NAME = Grace

SRCS = main.rs
SCAM = Cargo.lock
TMP = ${NAME}_kid.rs

CC = clang
CFLAGS = -Wall -Wextra -Werror

all:		${NAME}

${NAME}:
			cargo run
			diff ${TMP} ${addprefix src/, ${SRCS}}

fclean:
			cargo clean
			rm -f ${SCAM} ${TMP}

re:			fclean all

.PHONY:		all fclean re
