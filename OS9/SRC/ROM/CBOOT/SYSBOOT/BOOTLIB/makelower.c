/*
 * Copyright 1990 by Microware Systems Corporation
 * Reproduced Under License
 *
 * This source code is the proprietary confidential property of
 * Microware Systems Corporation, and is provided to licensee
 * solely for documentation and educational purposes. Reproduction,
 * publication, or distribution in any form to any party other than
 * the licensee is strictly prohibited.
 */


/*--------------------------------------!
! makelower: make sure c is lower case	!
!--------------------------------------*/
char makelower(c)
char		c;
{
	if (c >= 'A' && c <= 'Z')
		return c + ('a'-'A');
	else
		return c;
}
