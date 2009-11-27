dnl rtw.m4 --- check for Real-Time Workshop.
dnl
dnl Copyright (C) 2000--2003 Ralph Schleicher
dnl
dnl This program is free software; you can redistribute it and/or
dnl modify it under the terms of the GNU General Public License as
dnl published by the Free Software Foundation; either version 2,
dnl or (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; see the file COPYING.  If not, write to
dnl the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
dnl Boston, MA 02111-1307, USA.
dnl
dnl As a special exception to the GNU General Public License, if
dnl you distribute this file as part of a program that contains a
dnl configuration script generated by GNU Autoconf, you may include
dnl it under the same distribution terms that you use for the rest
dnl of that program.
dnl
dnl Code:

# AX_RTW
# ------
# Check for Real-Time Workshop.
AC_DEFUN([AX_RTW],
[dnl
AC_PREREQ([2.50])
AC_REQUIRE([AX_MATLAB])
ax_enable_rtw=
AC_ARG_WITH([rtw], AC_HELP_STRING([--with-rtw], [check for Real-Time Workshop [[yes]]]),
[case $withval in
  yes | no)
    # Explicitly enable or disable RTW.
    ax_enable_rtw=$withval
    ;;
  *)
    AC_MSG_ERROR([invalid value '$withval' for --with-rtw])
    ;;
esac])
AC_MSG_CHECKING([whether to enable Real-Time Workshop support])
if test x$ax_enable_matlab = xno ; then
    ax_enable_rtw=no
fi
if test x$ax_enable_rtw != xno ; then
    if test -d "$MATLAB/rtw/c/libsrc" ; then
	ax_enable_rtw=yes
    elif test x$ax_enable_rtw = x ; then
	ax_enable_rtw=no
    else
	# Fail if RTW was explicitly enabled.
	AC_MSG_RESULT([failure])
	AC_MSG_ERROR([check your Matlab setup])
    fi
fi
AC_MSG_RESULT([$ax_enable_rtw])
if test x$ax_enable_rtw = xyes ; then
    AC_DEFINE([HAVE_RTW], [1], [Define if you have Real-Time Workshop.])
fi
])

# AX_REQUIRE_RTW
# --------------
# Like AX_RTW but fail if Real-Time Workshop support is disabled.
AC_DEFUN([AX_REQUIRE_RTW],
[dnl
AC_PREREQ([2.50])
AC_REQUIRE([AX_RTW])
if test x$ax_enable_rtw = xno ; then
    AC_MSG_ERROR([can not enable Real-Time Workshop support])
fi
])

# AX_RTW_CONDITIONAL
# ------------------
# Define RTW conditional for GNU Automake.
AC_DEFUN([AX_RTW_CONDITIONAL],
[dnl
AC_PREREQ([2.50])
AC_REQUIRE([AX_RTW])
AM_CONDITIONAL([RTW], [test x$ax_enable_rtw = xyes])
])

dnl rtw.m4 ends here
