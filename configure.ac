#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.65])
AC_INIT(wdb-performance, 0.1.0, [wdb@met.no])

AC_CONFIG_SRCDIR([src/performanceTestConfiguration.h])
AC_CONFIG_MACRO_DIR([m4])
AC_PROG_RANLIB

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_LN_S
AC_PROG_LIBTOOL


WDB_LOG4CPP_CHECK(1.0)
WDB_POSTGRES_CHECK(9.1.x)
WDB_PQXX_CHECK(3.0.x)

# Checks for libraries.
AX_BOOST_BASE(1.40.0)
AX_BOOST_PROGRAM_OPTIONS
AX_BOOST_DATE_TIME
AX_BOOST_REGEX
AX_BOOST_FILESYSTEM
AX_BOOST_THREAD
# Env
CPPFLAGS="$CPPFLAGS $BOOST_CPPFLAGS"
export CPPFLAGS
LDFLAGS="$LDFLAGS $BOOST_LDFLAGS"
export LDFLAGS
LIBS="$LIBS $BOOST_PROGRAM_OPTIONS_LIB $BOOST_DATE_TIME_LIB $BOOST_REGEX_LIB $BOOST_FILESYSTEM_LIB $BOOST_THREAD_LIB -lboost_system -lpq -lboost_program_options-mt -lboost_date_time-mt -lboost_regex-mt -lboost_filesystem-mt -lboost_thread-mt -llog4cpp -lnsl"
export LIBS

# CppUnit
WDB_CPPUNIT

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_INLINE

AM_INIT_AUTOMAKE([foreign -Wall -Werror subdir-objects])
AM_PROG_CC_C_O

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

# Print Out Summary of Configuration
AC_MSG_RESULT([ ])
AC_MSG_RESULT([$PACKAGE_NAME $PACKAGE_VERSION])
AC_MSG_RESULT([Configuration:])
AC_MSG_RESULT([-------------------------------------------------------------------------])
AC_MSG_RESULT([ ])
AC_MSG_RESULT([ Database Name:	  $DATABASE_NAME])
AC_MSG_RESULT([ Source Code:      $srcdir])
AC_MSG_RESULT([ Host System:      $host])
AC_MSG_RESULT([  ])
AC_MSG_RESULT([ Prefix:           $prefix])
AC_MSG_RESULT([ Binaries:         $exec_prefix])
AC_MSG_RESULT([ Manuals:          $mandir])
AC_MSG_RESULT([ Data:             $datadir])
AC_MSG_RESULT([ System Config:    $sysconfdir])
AC_MSG_RESULT([ ])
AC_MSG_RESULT([ CPPFLAGS:         $CPPFLAGS])
AC_MSG_RESULT([ LDFLAGS:          $LDFLAGS])
AC_MSG_RESULT([ LIBS:             $LIBS])
AC_MSG_RESULT([  ])
AC_MSG_RESULT([-------------------------------------------------------------------------])
AC_MSG_RESULT([ ])
