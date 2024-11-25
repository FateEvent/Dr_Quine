NAME = Colleen

SRCS = main.rs
SCAM = Cargo.lock
TMP = tmp_${NAME}

CC = clang
CFLAGS = -Wall -Wextra -Werror

all:		${NAME}

${NAME}:
			cargo run > ${TMP}
			diff ${TMP} ${addprefix src/, ${SRCS}}

fclean:
			cargo clean
			rm -f ${SCAM} ${TMP}

re:			fclean all

.PHONY:		all fclean re
