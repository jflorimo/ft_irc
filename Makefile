#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jflorimo <jflorimo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/04/22 18:17:27 by jflorimo          #+#    #+#              #
#    Updated: 2014/04/22 18:17:27 by jflorimo         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAMES =	serveur

NAMEC = client

SRCDIRS = srcsServeur/

SRCDIRC = srcsClient/

CFILES =	main.c

SFILES =	main.c init_env.c clean_fd.c get_opt.c x.c main_loop.c \
	init_fd.c do_select.c check_fd.c \
	srv_create.c srv_accept.c \
	client_read.c client_write.c	

SRCS = $(addprefix $(SRCDIRS), $(SFILES))
SRCC = $(addprefix $(SRCDIRC), $(CFILES)) 
GCC = gcc -Wall -Wextra -Werror
OBJS = $(SRCS:.c=.o)
OBJC = $(SRCC:.c=.o)
HDDIR = includes/

all: client serveur

serveur:	$(OBJS)
			make -C libft/
			$(GCC) -o $(NAMES) $(OBJS) libft/libft.a
client:		$(OBJC)
			make -C libft/
			$(GCC) -o $(NAMEC) $(OBJC) libft/libft.a

%.o: %.c
	$(GCC) -c -o $@ $^  -I $(HDDIR)

clean:
		make -C libft/ clean
		rm -f $(OBJS)
		rm -f $(OBJC)

fclean: clean
		make -C libft/ fclean
		rm -rf $(NAMES)
		rm -rf $(NAMEC)

re: fclean all

.PHONY: clean fclean re