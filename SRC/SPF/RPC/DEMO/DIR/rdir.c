/****************************************************************************
 *  ID:		%A%
 *  Date:	%G%
 ****************************************************************************
 *           Copyright 1989-1998 by Microware Systems Corporation           *
 *                           All Rights Reserved                            *
 *                         Reproduced Under License                         *
 *                                                                          *
 * This software is confidential property of Microware Systems Corporation, *
 * and is provided under license for internal development purposes only.    *
 * Reproduction, publication, distribution, or creation of derivative works *
 * in any form to any party other than the licensee is strictly prohibited, *
 * unless expressly authorized in writing by Microware Systems Corporation. *
 *                                                                          *
 ****************************************************************************
 *
 * Edition History:
 *
 * #   Date     Comments                                                By
 * --- -------- -----------------------------------------------------  ---
 *  01 10/21/93 <--------- OS-9 NFS 1.3 Released ------------------->
 *     04/22/96 <--------- NFS 1.4 Server Release ------------------>
 *  02 07/18/97 Fixed help syntax.                                     apw
 *  13 12/09/97 Removed compiler warnings                              rds
 *     04/03/98 <--------- SPF LAN Comm Pack v3.2 Release ---------->
 ****************************************************************************/

_asm("_sysedit: equ 13");

#include <stdio.h>
#include <stdlib.h>
#include <RPC/rpc.h>		/* always need this */
#include "dir.h"			/* need this too: will be generated by rpcgen*/
#include <time.h>

int getime(struct sgtbuf *);
extern int errno;

main(argc, argv)
	int argc;
	char *argv[];
{
	CLIENT *cl;
	char *server;
	char *dir;
	readdir_res *result;
	namelist nl;
	int i;	
	struct sgtbuf t;
	
	if (argc != 3) {
		fprintf(stderr,"Syntax:   rdir host directory\n");
		fprintf(stderr,"Function: display directory contents on remote host\n");
		fprintf(stderr,"Options:  none.\n");
		exit(1);
	}

	/*
	 * Remember what our command line arguments refer to
	 */
	server = argv[1];
	dir = argv[2];

	/*
	 * Create client "handle" used for calling MESSAGEPROG on the
	 * server designated on the command line. We tell the rpc package
	 * to use the "tcp" protocol when contacting the server.
	 */
	cl = clnt_create(server, DIRPROG, DIRVERS, "tcp");
	if (cl == NULL) {
		/*
		 * Couldn't establish connection with server.
		 * Print error message and die.
		 */
		clnt_pcreateerror(server);
		exit(1);
	}
	
	/*
	 * Call the remote procedure "readdir" on the server
	 */
	result = readdir_1(&dir, cl);
	if (result == NULL) {
		/*
		 * An error occurred while calling the server. 
	 	 * Print error message and die.
		 */
		clnt_perror(cl, server);
		exit(1);
	}

	/*
	 * Okay, we successfully called the remote procedure.
	 */
	if (result->errno != 0) {
		/*
		 * A remote system error occurred.
		 * Print error message and die.
		 */
		errno = result->errno;
		perror(dir);
		exit(1);
	}

	/*
	 * Successfuly got a directory listing.
	 * Print it out.
	 */
	getime(&t);
	printf("           Directory of %s %s %02d:%02d:%02d\n",
		server,dir,t.t_hour,t.t_minute,t.t_second);
	i = 0;
	for (nl = result->readdir_res_u.list; nl != NULL; nl = nl->next) {
		i++;
		printf("%-15s", nl->name);
		if (i % 5 == 0)
			printf("\n");
	}
	printf("\n");
	exit(0);
}
