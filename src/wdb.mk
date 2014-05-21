
#-----------------------------------------------------------------------------
# WDB Call Interface Performance Tests
#-----------------------------------------------------------------------------

noinst_PROGRAMS +=		wciPerformanceTester

wciPerformanceTester_SOURCES =\
						src/wdbConfiguration.cpp \
						src/wdbConfiguration.h \
						src/wdbLogHandler.cpp \
						src/wdbLogHandler.h \
						src/performanceTest.cpp \
						src/performanceTestConfiguration.h \
						src/performanceTestConfiguration.cpp \
						src/wciRowStructures.h \
						src/transactors/wciTransactors.h \
						src/transactors/getRandomPoint.h \
						src/transactors/getComplexPoint.h \
						src/transactors/getPolygon.h \
						src/transactors/getField.h \
						src/transactors/getBilinearPoint.h

wciPerformanceTester_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/src

wciPerformanceTester_LDFLAGS =	$(AM_LDFLAGS) \
								-lwdbConfig \
								-lwdbLog

WCIPERFTEST_SOURCES =	src/caseP001_01.in.test \
						src/caseP001_02.in.test \
						src/caseP001_03.in.test \
						src/caseP001_08.in.test \
						src/caseP001_11.in.test \
						src/caseP001_12.in.test \
						src/caseP001_13.in.test \
						src/caseP001_21.in.test \
						src/caseP001_22.in.test \
						src/caseP002_01.in.test \
						src/caseP002_02.in.test \
						src/caseP003_01.in.test \
						src/caseP003_02.in.test \
						src/caseP003_03.in.test \
						src/caseP003_04.in.test \
						src/caseP003_05.in.test \
						src/caseP004_01.in.test \
						src/caseP004_02.in.test \
						src/caseP004_03.in.test \
						src/caseP004_04.in.test \
						src/caseP004_05.in.test

WCIPERFTEST_SUPPORT =	src/buildUp.in.sh \
						src/tearDown.in.sh \
						src/testEnvironment.in.sh \
						src/wciRead_time.in.sh


PERFORMANCETESTS +=		wciPerformanceTest.sh

noinst_SCRIPTS +=		wciPerformanceTest.sh \
						$(WCIPERFTEST_SOURCES:.in.test=.test) \
						$(WCIPERFTEST_SUPPORT:.in.sh=.sh)

CLEANFILES +=			wciPerformanceTest.sh \
						$(WCIPERFTEST_SOURCES:.in.test=.test) \
						$(WCIPERFTEST_SUPPORT:.in.sh=.sh)
				
EXTRA_DIST +=			src/wciPerformanceTest.in.sh \
						$(WCIPERFTEST_SOURCES) \
						$(WCIPERFTEST_SUPPORT) \
						src/wdb.mk \
						src/Makefile.am \
						src/Makefile.in

DISTCLEANFILES +=		src/Makefile

wciPerformanceTest.sh:	src/wciPerformanceTest.in.sh
				sed s%__WDB_VERSION__%$(VERSION)% $<\
				| sed s%__WDB_LIB_PATH__%$(LD_LIBRARY_PATH)% \
	 			| sed s%__WDB_BINDIR__%$(bindir)% \
				| sed s%__WDB_BUILDDIR__%"@abs_builddir@"% \
				| sed s%__WDB_SRCDIR__%$(srcdir)% \
	 			| sed s%__WDB_SYSCONFDIR__%$(sysconfdir)% \
	 			| sed s%__WDB_LOCALSTATEDIR__%$(localstatedir)% \
	 			> $@;\
				chmod 754 $@




#-----------------------------------------------------------------------------
# WDB TestWrite Component
#-----------------------------------------------------------------------------

noinst_PROGRAMS +=			testWrite

testWrite_SOURCES =			src/testWrite.cpp \
							src/TestWriteConfiguration.cpp \
							src/TestWriteConfiguration.h \
							src/GridWriter.cpp \
							src/GridWriter.h \
							src/transactors/WriteTypeTransactor.h \
							src/transactors/GridWriteTransactor.h \
							src/transactors/PointWriteTransactor.h

testWrite_LDADD = 			-lwdbConfig \
							-lwdbExcept \
							-lwdbLog 

EXTRA_DIST +=				src/wdb.mk \
							src/Makefile.am \
							src/Makefile.in

DISTCLEANFILES +=			src/Makefile


#-----------------------------------------------------------------------------
# libwdbtest
#-----------------------------------------------------------------------------

# Library
#-----------------------------------------------------------------------------

EXTRA_DIST +=			src/wdb.mk \
						src/Makefile.am \
						src/Makefile.in

DISTCLEANFILES +=		src/Makefile



if HAS_CPPUNIT

noinst_LTLIBRARIES = 		libwdbTest.la

libwdbTest_la_SOURCES = src/testConfiguration.cpp

pkginclude_HEADERS = 	src/testConfiguration.h

libwdbTest_la_CPPFLAGS = \
						$(AM_CPPFLAGS) -fPIC


endif



# Local Makefile Targets
#-----------------------------------------------------------------------------

src/all: $(WCIPERFTEST_SOURCES:.in.test=.test) \
				    $(WCIPERFTEST_SUPPORT:.in.sh=.sh) \
				    $(WCIPERFTEST_SQL:.in.sql=.sql) \
				    libwdbTest.la \
				    wciPerformanceTest.sh testWrite

src/clean: clean

