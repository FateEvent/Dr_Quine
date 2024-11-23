SRCS	=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s \
			ft_write.s ft_read.s ft_atoi.s is_prime.s
SRCSB	= 	get_base_index.s check_base.s ft_atoi_base.s \
			ft_list_push_front.s ft_list_size.s ft_list_sort.s \
			ft_list_remove_if.s
OBJS = ${SRCS:.s=.o}
OBJSB = ${SRCSB:.s=.o}
NAME = libasm.a

NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64
# CFLAGS = -Wall -Wextra -Werror
ASM_DEBUG_FLAGS = -g
C_DEBUG_FLAGS = -g3

.s.o:
			$(NASM) $(NASM_FLAGS) $< -o ${<:.s=.o}

all:		${NAME}

debug:		NASM_FLAGS += $(ASM_DEBUG_FLAGS)
debug:		CFLAGS += $(C_DEBUG_FLAGS)
debug:		all


${NAME}:	${OBJS}
			ar -rcs $@ $^


bonus:		${NAME} ${OBJSB}
			ar -rcs $^

bonus_debug:	NASM_FLAGS += $(ASM_DEBUG_FLAGS)
bonus_debug:	CFLAGS += $(C_DEBUG_FLAGS)
bonus_debug:	bonus


test:		${NAME}
			$(CC) $(CFLAGS) tests/main.c libasm.a
			./a.out

test_debug:	debug
			$(CC) $(CFLAGS) tests/main.c libasm.a
			lldb a.out


bonus_test:	bonus
			$(CC) $(CFLAGS) tests/main_bonus.c libasm.a
			# $(CC) $(CFLAGS) tests/index.c libasm.a
			./a.out

bonus_test_debug:	bonus_debug
					$(CC) $(CFLAGS) tests/main_bonus.c libasm.a
					# $(CC) $(CFLAGS) tests/index.c libasm.a
					lldb ./a.out

clean:
			rm -f ${OBJS} ${OBJSB} a.out

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
