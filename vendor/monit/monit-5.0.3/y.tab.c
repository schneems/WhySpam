#include <config.h>
/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IF = 258,
     ELSE = 259,
     THEN = 260,
     OR = 261,
     FAILED = 262,
     SET = 263,
     LOGFILE = 264,
     FACILITY = 265,
     DAEMON = 266,
     SYSLOG = 267,
     MAILSERVER = 268,
     HTTPD = 269,
     ALLOW = 270,
     ADDRESS = 271,
     INIT = 272,
     READONLY = 273,
     CLEARTEXT = 274,
     MD5HASH = 275,
     SHA1HASH = 276,
     CRYPT = 277,
     DELAY = 278,
     PEMFILE = 279,
     ENABLE = 280,
     DISABLE = 281,
     HTTPDSSL = 282,
     CLIENTPEMFILE = 283,
     ALLOWSELFCERTIFICATION = 284,
     IDFILE = 285,
     STATEFILE = 286,
     SEND = 287,
     EXPECT = 288,
     EXPECTBUFFER = 289,
     CYCLE = 290,
     COUNT = 291,
     REMINDER = 292,
     PIDFILE = 293,
     START = 294,
     STOP = 295,
     PATHTOK = 296,
     HOST = 297,
     HOSTNAME = 298,
     PORT = 299,
     TYPE = 300,
     UDP = 301,
     TCP = 302,
     TCPSSL = 303,
     PROTOCOL = 304,
     CONNECTION = 305,
     ALERT = 306,
     NOALERT = 307,
     MAILFORMAT = 308,
     UNIXSOCKET = 309,
     SIGNATURE = 310,
     TIMEOUT = 311,
     RESTART = 312,
     CHECKSUM = 313,
     EVERY = 314,
     DEFAULT = 315,
     HTTP = 316,
     APACHESTATUS = 317,
     FTP = 318,
     SMTP = 319,
     POP = 320,
     IMAP = 321,
     CLAMAV = 322,
     NNTP = 323,
     NTP3 = 324,
     MYSQL = 325,
     DNS = 326,
     SSH = 327,
     DWP = 328,
     LDAP2 = 329,
     LDAP3 = 330,
     RDATE = 331,
     RSYNC = 332,
     TNS = 333,
     PGSQL = 334,
     POSTFIXPOLICY = 335,
     SIP = 336,
     LMTP = 337,
     STRING = 338,
     PATH = 339,
     MAILADDR = 340,
     MAILFROM = 341,
     MAILSUBJECT = 342,
     MAILBODY = 343,
     SERVICENAME = 344,
     STRINGNAME = 345,
     NUMBER = 346,
     PERCENT = 347,
     LOGLIMIT = 348,
     CLOSELIMIT = 349,
     DNSLIMIT = 350,
     KEEPALIVELIMIT = 351,
     REPLYLIMIT = 352,
     REQUESTLIMIT = 353,
     STARTLIMIT = 354,
     WAITLIMIT = 355,
     GRACEFULLIMIT = 356,
     CLEANUPLIMIT = 357,
     REAL = 358,
     CHECKPROC = 359,
     CHECKFILESYS = 360,
     CHECKFILE = 361,
     CHECKDIR = 362,
     CHECKHOST = 363,
     CHECKSYSTEM = 364,
     CHECKFIFO = 365,
     CHECKSTATUS = 366,
     CHILDREN = 367,
     SYSTEM = 368,
     RESOURCE = 369,
     MEMORY = 370,
     TOTALMEMORY = 371,
     LOADAVG1 = 372,
     LOADAVG5 = 373,
     LOADAVG15 = 374,
     MODE = 375,
     ACTIVE = 376,
     PASSIVE = 377,
     MANUAL = 378,
     CPU = 379,
     TOTALCPU = 380,
     CPUUSER = 381,
     CPUSYSTEM = 382,
     CPUWAIT = 383,
     GROUP = 384,
     REQUEST = 385,
     DEPENDS = 386,
     BASEDIR = 387,
     SLOT = 388,
     EVENTQUEUE = 389,
     UID = 390,
     GID = 391,
     MMONIT = 392,
     INSTANCE = 393,
     USERNAME = 394,
     PASSWORD = 395,
     TIMESTAMP = 396,
     CHANGED = 397,
     SECOND = 398,
     MINUTE = 399,
     HOUR = 400,
     DAY = 401,
     SSLAUTO = 402,
     SSLV2 = 403,
     SSLV3 = 404,
     TLSV1 = 405,
     CERTMD5 = 406,
     BYTE = 407,
     KILOBYTE = 408,
     MEGABYTE = 409,
     GIGABYTE = 410,
     INODE = 411,
     SPACE = 412,
     PERMISSION = 413,
     SIZE = 414,
     MATCH = 415,
     NOT = 416,
     IGNORE = 417,
     ACTION = 418,
     EXEC = 419,
     UNMONITOR = 420,
     ICMP = 421,
     ICMPECHO = 422,
     NONEXIST = 423,
     INVALID = 424,
     DATA = 425,
     RECOVERED = 426,
     PASSED = 427,
     SUCCEEDED = 428,
     URL = 429,
     CONTENT = 430,
     PID = 431,
     PPID = 432,
     FSFLAG = 433,
     URLOBJECT = 434,
     TARGET = 435,
     MAXFORWARD = 436,
     NOTEQUAL = 437,
     EQUAL = 438,
     LESS = 439,
     GREATER = 440
   };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define THEN 260
#define OR 261
#define FAILED 262
#define SET 263
#define LOGFILE 264
#define FACILITY 265
#define DAEMON 266
#define SYSLOG 267
#define MAILSERVER 268
#define HTTPD 269
#define ALLOW 270
#define ADDRESS 271
#define INIT 272
#define READONLY 273
#define CLEARTEXT 274
#define MD5HASH 275
#define SHA1HASH 276
#define CRYPT 277
#define DELAY 278
#define PEMFILE 279
#define ENABLE 280
#define DISABLE 281
#define HTTPDSSL 282
#define CLIENTPEMFILE 283
#define ALLOWSELFCERTIFICATION 284
#define IDFILE 285
#define STATEFILE 286
#define SEND 287
#define EXPECT 288
#define EXPECTBUFFER 289
#define CYCLE 290
#define COUNT 291
#define REMINDER 292
#define PIDFILE 293
#define START 294
#define STOP 295
#define PATHTOK 296
#define HOST 297
#define HOSTNAME 298
#define PORT 299
#define TYPE 300
#define UDP 301
#define TCP 302
#define TCPSSL 303
#define PROTOCOL 304
#define CONNECTION 305
#define ALERT 306
#define NOALERT 307
#define MAILFORMAT 308
#define UNIXSOCKET 309
#define SIGNATURE 310
#define TIMEOUT 311
#define RESTART 312
#define CHECKSUM 313
#define EVERY 314
#define DEFAULT 315
#define HTTP 316
#define APACHESTATUS 317
#define FTP 318
#define SMTP 319
#define POP 320
#define IMAP 321
#define CLAMAV 322
#define NNTP 323
#define NTP3 324
#define MYSQL 325
#define DNS 326
#define SSH 327
#define DWP 328
#define LDAP2 329
#define LDAP3 330
#define RDATE 331
#define RSYNC 332
#define TNS 333
#define PGSQL 334
#define POSTFIXPOLICY 335
#define SIP 336
#define LMTP 337
#define STRING 338
#define PATH 339
#define MAILADDR 340
#define MAILFROM 341
#define MAILSUBJECT 342
#define MAILBODY 343
#define SERVICENAME 344
#define STRINGNAME 345
#define NUMBER 346
#define PERCENT 347
#define LOGLIMIT 348
#define CLOSELIMIT 349
#define DNSLIMIT 350
#define KEEPALIVELIMIT 351
#define REPLYLIMIT 352
#define REQUESTLIMIT 353
#define STARTLIMIT 354
#define WAITLIMIT 355
#define GRACEFULLIMIT 356
#define CLEANUPLIMIT 357
#define REAL 358
#define CHECKPROC 359
#define CHECKFILESYS 360
#define CHECKFILE 361
#define CHECKDIR 362
#define CHECKHOST 363
#define CHECKSYSTEM 364
#define CHECKFIFO 365
#define CHECKSTATUS 366
#define CHILDREN 367
#define SYSTEM 368
#define RESOURCE 369
#define MEMORY 370
#define TOTALMEMORY 371
#define LOADAVG1 372
#define LOADAVG5 373
#define LOADAVG15 374
#define MODE 375
#define ACTIVE 376
#define PASSIVE 377
#define MANUAL 378
#define CPU 379
#define TOTALCPU 380
#define CPUUSER 381
#define CPUSYSTEM 382
#define CPUWAIT 383
#define GROUP 384
#define REQUEST 385
#define DEPENDS 386
#define BASEDIR 387
#define SLOT 388
#define EVENTQUEUE 389
#define UID 390
#define GID 391
#define MMONIT 392
#define INSTANCE 393
#define USERNAME 394
#define PASSWORD 395
#define TIMESTAMP 396
#define CHANGED 397
#define SECOND 398
#define MINUTE 399
#define HOUR 400
#define DAY 401
#define SSLAUTO 402
#define SSLV2 403
#define SSLV3 404
#define TLSV1 405
#define CERTMD5 406
#define BYTE 407
#define KILOBYTE 408
#define MEGABYTE 409
#define GIGABYTE 410
#define INODE 411
#define SPACE 412
#define PERMISSION 413
#define SIZE 414
#define MATCH 415
#define NOT 416
#define IGNORE 417
#define ACTION 418
#define EXEC 419
#define UNMONITOR 420
#define ICMP 421
#define ICMPECHO 422
#define NONEXIST 423
#define INVALID 424
#define DATA 425
#define RECOVERED 426
#define PASSED 427
#define SUCCEEDED 428
#define URL 429
#define CONTENT 430
#define PID 431
#define PPID 432
#define FSFLAG 433
#define URLOBJECT 434
#define TARGET 435
#define MAXFORWARD 436
#define NOTEQUAL 437
#define EQUAL 438
#define LESS 439
#define GREATER 440




/* Copy the first part of user declarations.  */
#line 31 "p.y"

  
/*
 * DESCRIPTION
 *   Simple context-free grammar for parsing the control file. 
 *
 *  @author Jan-Henrik Haukeland, <hauk@tildeslash.com>
 *  @author Olivier Beyssac, <ob@r14.freenix.org>
 *  @author Kianusch Sayah Karadji <kianusch.sayah.karadji@sk-tech.net>
 *  @author Martin Pala <martinp@tildeslash.com>
 *  @author Christian Hopp <chopp@iei.tu-clausthal.de>
 *  @author Rory Toma <rory@digeo.com>
 *  @version \$Id: p.y,v 1.300 2009/05/04 21:25:21 martinp Exp $
 */

#include <config.h>

#ifdef HAVE_STDIO_H
#include <stdio.h>
#endif

#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif

#ifdef HAVE_ERRNO_H
#include <errno.h>
#endif 

#ifdef HAVE_CTYPE_H
#include <ctype.h>
#endif 

#ifdef HAVE_PWD_H
#include <pwd.h>
#endif 

#ifdef HAVE_GRP_H
#include <grp.h>
#endif 
  
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
  
#ifdef HAVE_SYS_TIME_H
#include <sys/time.h>
#endif
  
#ifdef HAVE_TIME_H
#include <time.h>
#endif
  
#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif

#ifdef HAVE_ASM_PARAM_H
#include <asm/param.h>
#endif

#ifdef HAVE_STRING_H
#include <string.h>
#endif

#ifdef HAVE_STRINGS_H
#include <strings.h>
#endif

#ifdef HAVE_NETDB_H
#include <netdb.h>
#endif

#ifdef HAVE_SYSLOG_H
#include <syslog.h>
#endif

#ifndef HAVE_SOL_IP
#include <netinet/in_systm.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#endif

#ifdef HAVE_NETINET_IP_ICMP_H
#include <netinet/ip_icmp.h>
#endif

#ifdef HAVE_REGEX_H
#include <regex.h>
#endif
  
#include "net.h"
#include "monitor.h"
#include "protocol.h"
#include "engine.h"
#include "alert.h"
#include "process.h"
#include "ssl.h"
#include "device.h"


/* ------------------------------------------------------------- Definitions */

  struct IHavePrecedence {
    int daemon;
    int logfile;
    int pidfile;
  }; 

  struct myrate {
    unsigned count;
    unsigned cycles;
  }; 

  /* yacc interface */
  void  yyerror(const char *,...);
  void  yyerror2(const char *,...);
  void  yywarning(const char *,...);
  void  yywarning2(const char *,...);

  /* lexer interface */
  int yylex(void);
  extern FILE *yyin;
  extern int lineno;
  extern int arglineno;
  extern char *yytext;
  extern char *argyytext;
  extern char *currentfile;
  extern char *argcurrentfile;
  extern int buffer_stack_ptr;

  /* Local variables */
  static int cfg_errflag = FALSE;
  static Service_T tail = NULL;
  static Service_T current = NULL;
  static unsigned int eventset;
  static Request_T urlrequest = NULL;
  static Command_T command = NULL;
  static Command_T command1 = NULL;
  static Command_T command2 = NULL;
  static Service_T depend_list = NULL;
  static struct mygid gidset;
  static struct myuid uidset;
  static struct myperm permset;
  static struct mysize sizeset;
  static struct mymatch matchset;
  static struct myicmp icmpset;
  static struct mymail mailset;
  static struct myport portset;
  static struct mymailserver mailserverset;
  static struct myfilesystem filesystemset;
  static struct myresource resourceset;
  static struct mychecksum checksumset;
  static struct mytimestamp timestampset;
  static struct IHavePrecedence ihp = {FALSE, FALSE, FALSE};
  static struct myrate rate1 = {1, 1};
  static struct myrate rate2 = {1, 1};
  static char * htpasswd_file = NULL;
  static int    digesttype = DIGEST_CLEARTEXT;
  static int    hassystem = FALSE;

#define BITMAP_MAX (sizeof(long long) * 8)

  
/* -------------------------------------------------------------- Prototypes */

  static void  preparse();
  static void  postparse();
  static void  addservice(Service_T);
  static void  addmail(char *, Mail_T, Mail_T *, unsigned int, unsigned int);
  static void  createservice(int, char *, char *, int (*)(Service_T));
  static void  adddependant(char *);
  static void  addport(Port_T);
  static void  addresource(Resource_T);
  static void  addtimestamp(Timestamp_T, int);
  static void  addsize(Size_T);
  static void  addfilesystem(Filesystem_T);
  static void  addicmp(Icmp_T);
  static void *addprotocol(int);
  static void  addgeneric(Port_T, char*, char*);
  static void  addcommand(int, unsigned);
  static void  addargument(char *);
  static void  addmmonit(URL_T, int, int, char *);
  static void  addmailserver(MailServer_T);
  static int   addcredentials(char *, char *, int, int);
#ifdef HAVE_LIBPAM
  static void  addpamauth(char *, int);
#endif
  static void  addhtpasswdentry(char *, char *, int);
  static uid_t get_uid(char *, uid_t);
  static gid_t get_gid(char *, gid_t);
  static void  addchecksum(Checksum_T);
  static void  addperm(Perm_T);
  static void  addmatch(Match_T, int, int);
  static void  addmatchpath(Match_T, int);
  static void  adduid(Uid_T);
  static void  addgid(Gid_T);
  static void  addeuid(uid_t);
  static void  addegid(gid_t);
  static void  addeventaction(EventAction_T *, int, int);
  static void  seteventaction(EventAction_T *, int, int);
  static void  prepare_urlrequest(URL_T U);
  static void  seturlrequest(int, char *);
  static void  setlogfile(char *);
  static void  setpidfile(char *);
  static void  reset_mailset();
  static void  reset_mailserverset();
  static void  reset_portset();
  static void  reset_resourceset();
  static void  reset_timestampset();
  static void  reset_sizeset();
  static void  reset_checksumset();
  static void  reset_permset();
  static void  reset_uidset();
  static void  reset_gidset();
  static void  reset_filesystemset();
  static void  reset_icmpset();
  static void  reset_rateset();
  static void  check_name(char *);
  static void  check_timeout(int, int);
  static void  check_every(int);
  static int   check_perm(int);
  static void  check_hostname (char *);
  static void  check_exec(char *);
  static int   cleanup_hash_string(char *);
  static void  check_depend();
  static void  setsyslog(char *);
  static void describeAction(Action_T);
  static Command_T copycommand(Command_T);
  static int verifyMaxForward(int);  



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 264 "p.y"
{
  URL_T url;
  float real;
  int   number;
  char *string;
}
/* Line 187 of yacc.c.  */
#line 706 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 719 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  56
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   887

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  190
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  151
/* YYNRULES -- Number of rules.  */
#define YYNRULES  455
/* YYNRULES -- Number of states.  */
#define YYNSTATES  801

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   440

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   188,     2,
       2,     2,     2,     2,   189,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   186,     2,   187,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,   170,   171,   172,   173,   174,
     175,   176,   177,   178,   179,   180,   181,   182,   183,   184,
     185
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     6,     8,    11,    13,    15,    17,
      19,    21,    23,    25,    27,    29,    31,    33,    35,    37,
      40,    43,    46,    49,    52,    55,    58,    61,    62,    65,
      67,    69,    71,    73,    75,    77,    79,    81,    83,    85,
      87,    89,    91,    92,    95,    97,    99,   101,   103,   105,
     107,   109,   111,   113,   115,   117,   119,   121,   123,   125,
     126,   129,   131,   133,   135,   137,   139,   141,   143,   145,
     147,   149,   151,   153,   155,   157,   158,   161,   163,   165,
     167,   169,   171,   173,   175,   177,   179,   181,   183,   185,
     187,   190,   192,   194,   196,   198,   200,   202,   204,   206,
     208,   210,   211,   214,   216,   218,   220,   222,   224,   226,
     227,   230,   232,   234,   236,   238,   240,   242,   244,   246,
     248,   250,   252,   254,   255,   258,   260,   262,   264,   266,
     268,   276,   281,   290,   295,   296,   300,   305,   308,   312,
     316,   322,   327,   334,   339,   343,   347,   351,   355,   357,
     360,   365,   371,   377,   383,   385,   388,   394,   402,   403,
     406,   408,   410,   412,   414,   416,   421,   423,   426,   429,
     432,   435,   439,   443,   446,   448,   450,   453,   456,   459,
     462,   465,   468,   469,   472,   473,   475,   481,   486,   489,
     493,   497,   501,   502,   507,   508,   514,   515,   521,   522,
     528,   531,   533,   536,   538,   539,   541,   546,   551,   556,
     561,   566,   571,   574,   579,   584,   588,   593,   597,   602,
     604,   607,   609,   612,   614,   616,   619,   622,   625,   628,
     629,   632,   635,   636,   639,   640,   643,   655,   666,   677,
     688,   689,   692,   695,   698,   699,   702,   707,   710,   711,
     714,   715,   717,   719,   721,   723,   724,   728,   731,   734,
     737,   740,   744,   747,   750,   753,   756,   759,   764,   767,
     770,   773,   776,   779,   782,   785,   788,   791,   794,   797,
     799,   801,   804,   807,   810,   811,   814,   817,   818,   821,
     822,   825,   830,   832,   836,   841,   846,   851,   856,   861,
     866,   871,   876,   881,   886,   893,   900,   901,   904,   905,
     909,   910,   914,   922,   923,   927,   929,   931,   938,   942,
     950,   952,   955,   958,   960,   963,   965,   967,   969,   971,
     973,   975,   977,   979,   981,   983,   985,   987,   989,   991,
     993,   995,   997,   999,  1001,  1003,  1004,  1009,  1011,  1014,
    1016,  1018,  1020,  1024,  1027,  1030,  1033,  1036,  1039,  1041,
    1044,  1046,  1053,  1055,  1058,  1060,  1062,  1064,  1066,  1073,
    1075,  1078,  1080,  1082,  1084,  1089,  1094,  1099,  1101,  1103,
    1105,  1110,  1115,  1120,  1125,  1129,  1133,  1135,  1137,  1139,
    1141,  1143,  1153,  1160,  1161,  1163,  1165,  1167,  1169,  1171,
    1172,  1174,  1176,  1178,  1180,  1182,  1185,  1189,  1191,  1193,
    1195,  1197,  1199,  1201,  1202,  1205,  1209,  1210,  1213,  1217,
    1218,  1225,  1232,  1239,  1248,  1259,  1267,  1268,  1270,  1272,
    1281,  1291,  1301,  1311,  1318,  1319,  1321,  1323,  1325,  1327,
    1336,  1344,  1352,  1357,  1362,  1363,  1365,  1375,  1382,  1391,
    1400,  1409,  1418,  1421,  1422,  1425
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     191,     0,    -1,    -1,   192,    -1,   193,    -1,   192,   193,
      -1,   210,    -1,   211,    -1,   215,    -1,   216,    -1,   220,
      -1,   223,    -1,   224,    -1,   225,    -1,   219,    -1,   217,
      -1,   218,    -1,   213,    -1,   214,    -1,   248,   194,    -1,
     249,   196,    -1,   250,   198,    -1,   251,   200,    -1,   252,
     202,    -1,   253,   204,    -1,   254,   206,    -1,   255,   208,
      -1,    -1,   194,   195,    -1,   256,    -1,   257,    -1,   282,
      -1,   283,    -1,   265,    -1,   266,    -1,   287,    -1,   290,
      -1,   298,    -1,   299,    -1,   300,    -1,   301,    -1,   304,
      -1,    -1,   196,   197,    -1,   256,    -1,   257,    -1,   318,
      -1,   287,    -1,   298,    -1,   290,    -1,   333,    -1,   337,
      -1,   338,    -1,   327,    -1,   336,    -1,   334,    -1,   299,
      -1,   300,    -1,   301,    -1,    -1,   198,   199,    -1,   256,
      -1,   257,    -1,   287,    -1,   298,    -1,   290,    -1,   333,
      -1,   337,    -1,   338,    -1,   299,    -1,   300,    -1,   301,
      -1,   329,    -1,   330,    -1,   331,    -1,    -1,   200,   201,
      -1,   256,    -1,   257,    -1,   318,    -1,   287,    -1,   298,
      -1,   290,    -1,   333,    -1,   337,    -1,   338,    -1,   299,
      -1,   300,    -1,   301,    -1,   203,    -1,   202,   203,    -1,
     256,    -1,   257,    -1,   265,    -1,   267,    -1,   287,    -1,
     290,    -1,   298,    -1,   299,    -1,   300,    -1,   301,    -1,
      -1,   204,   205,    -1,   287,    -1,   290,    -1,   298,    -1,
     300,    -1,   301,    -1,   307,    -1,    -1,   206,   207,    -1,
     256,    -1,   257,    -1,   318,    -1,   287,    -1,   298,    -1,
     290,    -1,   333,    -1,   337,    -1,   338,    -1,   299,    -1,
     300,    -1,   301,    -1,    -1,   208,   209,    -1,   287,    -1,
     290,    -1,   298,    -1,   300,    -1,   301,    -1,     8,   291,
     186,   293,   187,   295,   340,    -1,     8,   291,   295,   340,
      -1,     8,   291,   161,   186,   293,   187,   295,   340,    -1,
       8,    11,    91,   212,    -1,    -1,    39,    23,    91,    -1,
       8,    34,    91,   332,    -1,     8,    17,    -1,     8,     9,
      84,    -1,     8,     9,    12,    -1,     8,     9,    12,    10,
      83,    -1,     8,   134,   132,    84,    -1,     8,   134,   132,
      84,   133,    91,    -1,     8,   134,   133,    91,    -1,     8,
      30,    84,    -1,     8,    31,    84,    -1,     8,    38,    84,
      -1,     8,   137,   221,    -1,   222,    -1,   221,   222,    -1,
     179,   286,   273,   272,    -1,     8,    13,   226,   286,   264,
      -1,     8,    53,   186,   296,   187,    -1,     8,    14,    44,
      91,   228,    -1,   227,    -1,   226,   227,    -1,    83,   262,
     263,   273,   272,    -1,    83,    44,    91,   262,   263,   273,
     272,    -1,    -1,   228,   229,    -1,   230,    -1,   233,    -1,
     236,    -1,   240,    -1,   232,    -1,   231,   237,   238,   239,
      -1,    27,    -1,    27,    25,    -1,    25,    27,    -1,    27,
      26,    -1,    26,    27,    -1,   232,    24,    84,    -1,   232,
      28,    84,    -1,   232,    29,    -1,   234,    -1,   235,    -1,
      55,    25,    -1,    25,    55,    -1,    55,    26,    -1,    26,
      55,    -1,    16,    83,    -1,    24,    84,    -1,    -1,    28,
      84,    -1,    -1,    29,    -1,    15,    83,   188,    83,   247,
      -1,    15,   189,    83,   247,    -1,    15,    84,    -1,    15,
      19,    84,    -1,    15,    20,    84,    -1,    15,    22,    84,
      -1,    -1,    15,    84,   241,   245,    -1,    -1,    15,    19,
      84,   242,   245,    -1,    -1,    15,    20,    84,   243,   245,
      -1,    -1,    15,    22,    84,   244,   245,    -1,    15,    83,
      -1,   246,    -1,   245,   246,    -1,    83,    -1,    -1,    18,
      -1,   104,    89,    38,    84,    -1,   104,    89,    41,    84,
      -1,   106,    89,    41,    84,    -1,   105,    89,    41,    84,
      -1,   107,    89,    41,    84,    -1,   108,    89,    16,    83,
      -1,   109,    89,    -1,   110,    89,    41,    84,    -1,   111,
      89,    41,    84,    -1,    39,   258,   285,    -1,    39,   258,
     259,   285,    -1,    40,   258,   285,    -1,    40,   258,   259,
     285,    -1,   260,    -1,   258,   260,    -1,   261,    -1,   259,
     261,    -1,    83,    -1,    84,    -1,   135,    83,    -1,   136,
      83,    -1,   135,    91,    -1,   136,    91,    -1,    -1,   139,
      85,    -1,   139,    83,    -1,    -1,   140,    83,    -1,    -1,
      43,    83,    -1,     3,     7,   268,   269,   271,   274,   286,
     324,     5,   322,   326,    -1,     3,     7,   174,   179,   288,
     286,   324,     5,   322,   326,    -1,     3,     7,   270,   271,
     274,   286,   324,     5,   322,   326,    -1,     3,     7,   166,
     339,   284,   286,   324,     5,   322,   326,    -1,    -1,    42,
      83,    -1,    44,    91,    -1,    54,    84,    -1,    -1,    45,
      47,    -1,    45,    48,   273,   272,    -1,    45,    46,    -1,
      -1,   151,    83,    -1,    -1,   148,    -1,   149,    -1,   150,
      -1,   147,    -1,    -1,    49,    62,   280,    -1,    49,    60,
      -1,    49,    71,    -1,    49,    73,    -1,    49,    63,    -1,
      49,    61,   279,    -1,    49,    66,    -1,    49,    67,    -1,
      49,    74,    -1,    49,    75,    -1,    49,    70,    -1,    49,
      81,   277,   278,    -1,    49,    68,    -1,    49,    69,    -1,
      49,    80,    -1,    49,    65,    -1,    49,    64,    -1,    49,
      72,    -1,    49,    76,    -1,    49,    77,    -1,    49,    78,
      -1,    49,    79,    -1,    49,    82,    -1,   275,    -1,   276,
      -1,   275,   276,    -1,    32,    83,    -1,    33,    83,    -1,
      -1,   180,    85,    -1,   180,    83,    -1,    -1,   181,    91,
      -1,    -1,   130,    84,    -1,   130,    84,    58,    83,    -1,
     281,    -1,   280,     6,   281,    -1,    93,   319,    91,    92,
      -1,    94,   319,    91,    92,    -1,    95,   319,    91,    92,
      -1,    96,   319,    91,    92,    -1,    97,   319,    91,    92,
      -1,    98,   319,    91,    92,    -1,    99,   319,    91,    92,
      -1,   100,   319,    91,    92,    -1,   101,   319,    91,    92,
      -1,   102,   319,    91,    92,    -1,     3,   142,   176,   324,
       5,   322,    -1,     3,   142,   177,   324,     5,   322,    -1,
      -1,    36,    91,    -1,    -1,    56,    91,   143,    -1,    -1,
      56,    91,   143,    -1,     3,    91,    57,    91,    35,     5,
      56,    -1,    -1,   175,   289,    83,    -1,   183,    -1,   182,
      -1,   291,   186,   293,   187,   295,   340,    -1,   291,   295,
     340,    -1,   291,   161,   186,   293,   187,   295,   340,    -1,
     292,    -1,    51,    85,    -1,    52,    85,    -1,   294,    -1,
     293,   294,    -1,   163,    -1,    58,    -1,    50,    -1,   175,
      -1,   170,    -1,   164,    -1,   178,    -1,   136,    -1,   166,
      -1,   138,    -1,   169,    -1,   168,    -1,   158,    -1,   176,
      -1,   177,    -1,   114,    -1,   159,    -1,    56,    -1,   141,
      -1,   135,    -1,    -1,    53,   186,   296,   187,    -1,   297,
      -1,   296,   297,    -1,    86,    -1,    87,    -1,    88,    -1,
      59,    91,    35,    -1,   120,   121,    -1,   120,   122,    -1,
     120,   123,    -1,   129,    90,    -1,   131,   302,    -1,   303,
      -1,   302,   303,    -1,    89,    -1,     3,   305,   324,     5,
     322,   326,    -1,   306,    -1,   305,   306,    -1,   310,    -1,
     313,    -1,   314,    -1,   315,    -1,     3,   308,   324,     5,
     322,   326,    -1,   309,    -1,   308,   309,    -1,   315,    -1,
     313,    -1,   311,    -1,   124,   319,    91,    92,    -1,   125,
     319,    91,    92,    -1,   312,   319,    91,    92,    -1,   126,
      -1,   127,    -1,   128,    -1,   115,   319,   317,   332,    -1,
     115,   319,    91,    92,    -1,   116,   319,   317,   332,    -1,
     116,   319,    91,    92,    -1,   112,   319,    91,    -1,   316,
     319,   317,    -1,   117,    -1,   118,    -1,   119,    -1,   103,
      -1,    91,    -1,     3,   141,   319,    91,   320,   324,     5,
     322,   326,    -1,     3,   142,   141,   324,     5,   322,    -1,
      -1,   185,    -1,   184,    -1,   183,    -1,   182,    -1,   142,
      -1,    -1,   143,    -1,   144,    -1,   145,    -1,   146,    -1,
      51,    -1,   164,   258,    -1,   164,   258,   259,    -1,    57,
      -1,    39,    -1,    40,    -1,   165,    -1,   321,    -1,   321,
      -1,    -1,    91,    35,    -1,    91,    91,    35,    -1,    -1,
      91,    35,    -1,    91,    91,    35,    -1,    -1,     4,     3,
     171,   325,     5,   323,    -1,     4,     3,   172,   325,     5,
     323,    -1,     4,     3,   173,   325,     5,   323,    -1,     3,
       7,   328,    58,   324,     5,   322,   326,    -1,     3,     7,
     328,    58,    33,    83,   324,     5,   322,   326,    -1,     3,
     142,   328,    58,   324,     5,   322,    -1,    -1,    20,    -1,
      21,    -1,     3,   156,   319,    91,   324,     5,   322,   326,
      -1,     3,   156,   319,    91,    92,   324,     5,   322,   326,
      -1,     3,   157,   319,   317,   332,   324,     5,   322,   326,
      -1,     3,   157,   319,    91,    92,   324,     5,   322,   326,
      -1,     3,   142,   178,   324,     5,   322,    -1,    -1,   152,
      -1,   153,    -1,   154,    -1,   155,    -1,     3,     7,   158,
      91,   324,     5,   322,   326,    -1,     3,   335,   160,    84,
     324,     5,   322,    -1,     3,   335,   160,    83,   324,     5,
     322,    -1,   162,   335,   160,    84,    -1,   162,   335,   160,
      83,    -1,    -1,   161,    -1,     3,   159,   319,    91,   332,
     324,     5,   322,   326,    -1,     3,   142,   159,   324,     5,
     322,    -1,     3,     7,   135,    83,   324,     5,   322,   326,
      -1,     3,     7,   135,    91,   324,     5,   322,   326,    -1,
       3,     7,   136,    83,   324,     5,   322,   326,    -1,     3,
       7,   136,    91,   324,     5,   322,   326,    -1,    45,   167,
      -1,    -1,    37,    91,    -1,    37,    91,    35,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   308,   308,   309,   312,   313,   316,   317,   318,   319,
     320,   321,   322,   323,   324,   325,   326,   327,   328,   329,
     330,   331,   332,   333,   334,   335,   336,   339,   340,   343,
     344,   345,   346,   347,   348,   349,   350,   351,   352,   353,
     354,   355,   358,   359,   362,   363,   364,   365,   366,   367,
     368,   369,   370,   371,   372,   373,   374,   375,   376,   379,
     380,   383,   384,   385,   386,   387,   388,   389,   390,   391,
     392,   393,   394,   395,   396,   399,   400,   403,   404,   405,
     406,   407,   408,   409,   410,   411,   412,   413,   414,   417,
     418,   421,   422,   423,   424,   425,   426,   427,   428,   429,
     430,   433,   434,   437,   438,   439,   440,   441,   442,   445,
     446,   449,   450,   451,   452,   453,   454,   455,   456,   457,
     458,   459,   460,   463,   464,   467,   468,   469,   470,   471,
     474,   477,   480,   485,   495,   496,   499,   504,   509,   517,
     520,   525,   528,   532,   538,   543,   548,   556,   559,   560,
     563,   569,   575,   583,   589,   590,   593,   612,   631,   632,
     635,   636,   637,   638,   641,   642,   649,   650,   651,   654,
     655,   656,   657,   658,   661,   662,   665,   666,   669,   670,
     673,   676,   683,   684,   692,   696,   702,   705,   713,   717,
     721,   725,   729,   729,   736,   736,   743,   743,   750,   750,
     757,   765,   766,   769,   773,   774,   777,   781,   787,   793,
     799,   805,   812,   819,   825,   831,   834,   839,   842,   847,
     848,   851,   852,   855,   856,   859,   860,   861,   862,   865,
     866,   867,   870,   871,   874,   875,   878,   884,   893,   901,
     911,   917,   920,   923,   928,   931,   934,   942,   947,   948,
     951,   952,   953,   954,   955,   958,   961,   964,   967,   970,
     973,   976,   979,   982,   985,   988,   991,   994,   997,  1000,
    1004,  1007,  1010,  1013,  1016,  1019,  1022,  1025,  1028,  1031,
    1036,  1037,  1040,  1041,  1044,  1045,  1048,  1053,  1054,  1059,
    1060,  1064,  1071,  1072,  1075,  1079,  1083,  1087,  1091,  1095,
    1099,  1103,  1107,  1111,  1117,  1122,  1127,  1130,  1135,  1138,
    1143,  1146,  1151,  1159,  1160,  1166,  1167,  1170,  1173,  1176,
    1179,  1184,  1187,  1190,  1191,  1194,  1195,  1196,  1197,  1198,
    1199,  1200,  1201,  1202,  1203,  1204,  1205,  1206,  1207,  1208,
    1209,  1210,  1211,  1212,  1213,  1216,  1217,  1220,  1221,  1224,
    1225,  1226,  1229,  1236,  1239,  1242,  1248,  1252,  1255,  1256,
    1259,  1262,  1268,  1269,  1272,  1273,  1274,  1275,  1278,  1284,
    1285,  1288,  1289,  1290,  1293,  1298,  1305,  1312,  1313,  1314,
    1317,  1322,  1327,  1332,  1339,  1346,  1353,  1354,  1355,  1358,
    1359,  1362,  1369,  1376,  1377,  1378,  1379,  1380,  1381,  1384,
    1385,  1386,  1387,  1388,  1391,  1392,  1393,  1394,  1395,  1396,
    1397,  1400,  1409,  1418,  1419,  1425,  1435,  1436,  1442,  1452,
    1455,  1458,  1461,  1466,  1470,  1476,  1482,  1483,  1484,  1487,
    1494,  1503,  1512,  1521,  1526,  1527,  1528,  1529,  1530,  1533,
    1540,  1547,  1553,  1560,  1568,  1571,  1577,  1583,  1590,  1596,
    1603,  1609,  1616,  1619,  1620,  1621
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IF", "ELSE", "THEN", "OR", "FAILED",
  "SET", "LOGFILE", "FACILITY", "DAEMON", "SYSLOG", "MAILSERVER", "HTTPD",
  "ALLOW", "ADDRESS", "INIT", "READONLY", "CLEARTEXT", "MD5HASH",
  "SHA1HASH", "CRYPT", "DELAY", "PEMFILE", "ENABLE", "DISABLE", "HTTPDSSL",
  "CLIENTPEMFILE", "ALLOWSELFCERTIFICATION", "IDFILE", "STATEFILE", "SEND",
  "EXPECT", "EXPECTBUFFER", "CYCLE", "COUNT", "REMINDER", "PIDFILE",
  "START", "STOP", "PATHTOK", "HOST", "HOSTNAME", "PORT", "TYPE", "UDP",
  "TCP", "TCPSSL", "PROTOCOL", "CONNECTION", "ALERT", "NOALERT",
  "MAILFORMAT", "UNIXSOCKET", "SIGNATURE", "TIMEOUT", "RESTART",
  "CHECKSUM", "EVERY", "DEFAULT", "HTTP", "APACHESTATUS", "FTP", "SMTP",
  "POP", "IMAP", "CLAMAV", "NNTP", "NTP3", "MYSQL", "DNS", "SSH", "DWP",
  "LDAP2", "LDAP3", "RDATE", "RSYNC", "TNS", "PGSQL", "POSTFIXPOLICY",
  "SIP", "LMTP", "STRING", "PATH", "MAILADDR", "MAILFROM", "MAILSUBJECT",
  "MAILBODY", "SERVICENAME", "STRINGNAME", "NUMBER", "PERCENT", "LOGLIMIT",
  "CLOSELIMIT", "DNSLIMIT", "KEEPALIVELIMIT", "REPLYLIMIT", "REQUESTLIMIT",
  "STARTLIMIT", "WAITLIMIT", "GRACEFULLIMIT", "CLEANUPLIMIT", "REAL",
  "CHECKPROC", "CHECKFILESYS", "CHECKFILE", "CHECKDIR", "CHECKHOST",
  "CHECKSYSTEM", "CHECKFIFO", "CHECKSTATUS", "CHILDREN", "SYSTEM",
  "RESOURCE", "MEMORY", "TOTALMEMORY", "LOADAVG1", "LOADAVG5", "LOADAVG15",
  "MODE", "ACTIVE", "PASSIVE", "MANUAL", "CPU", "TOTALCPU", "CPUUSER",
  "CPUSYSTEM", "CPUWAIT", "GROUP", "REQUEST", "DEPENDS", "BASEDIR", "SLOT",
  "EVENTQUEUE", "UID", "GID", "MMONIT", "INSTANCE", "USERNAME", "PASSWORD",
  "TIMESTAMP", "CHANGED", "SECOND", "MINUTE", "HOUR", "DAY", "SSLAUTO",
  "SSLV2", "SSLV3", "TLSV1", "CERTMD5", "BYTE", "KILOBYTE", "MEGABYTE",
  "GIGABYTE", "INODE", "SPACE", "PERMISSION", "SIZE", "MATCH", "NOT",
  "IGNORE", "ACTION", "EXEC", "UNMONITOR", "ICMP", "ICMPECHO", "NONEXIST",
  "INVALID", "DATA", "RECOVERED", "PASSED", "SUCCEEDED", "URL", "CONTENT",
  "PID", "PPID", "FSFLAG", "URLOBJECT", "TARGET", "MAXFORWARD", "NOTEQUAL",
  "EQUAL", "LESS", "GREATER", "'{'", "'}'", "':'", "'@'", "$accept",
  "cfgfile", "statement_list", "statement", "optproclist", "optproc",
  "optfilelist", "optfile", "optfilesyslist", "optfilesys", "optdirlist",
  "optdir", "opthostlist", "opthost", "optsystemlist", "optsystem",
  "optfifolist", "optfifo", "optstatuslist", "optstatus", "setalert",
  "setdaemon", "startdelay", "setexpectbuffer", "setinit", "setlog",
  "seteventqueue", "setidfile", "setstatefile", "setpid", "setmmonits",
  "mmonitlist", "mmonit", "setmailservers", "setmailformat", "sethttpd",
  "mailserverlist", "mailserver", "httpdlist", "httpdoption", "ssl",
  "sslenable", "ssldisable", "signature", "sigenable", "sigdisable",
  "bindaddress", "pemfile", "clientpemfile", "allowselfcert", "allow",
  "@1", "@2", "@3", "@4", "allowuserlist", "allowuser", "readonly",
  "checkproc", "checkfile", "checkfilesys", "checkdir", "checkhost",
  "checksystem", "checkfifo", "checkstatus", "start", "stop",
  "argumentlist", "useroptionlist", "argument", "useroption", "username",
  "password", "hostname", "connection", "connectionunix", "icmp", "host",
  "port", "unixsocket", "type", "certmd5", "sslversion", "protocol",
  "sendexpectlist", "sendexpect", "target", "maxforward", "request",
  "apache_stat_list", "apache_stat", "pid", "ppid", "icmpcount",
  "exectimeout", "nettimeout", "timeout", "urloption", "urloperator",
  "alert", "alertmail", "noalertmail", "eventoptionlist", "eventoption",
  "formatlist", "formatoptionlist", "formatoption", "every", "mode",
  "group", "depend", "dependlist", "dependant", "resourceprocess",
  "resourceprocesslist", "resourceprocessopt", "resourcesystem",
  "resourcesystemlist", "resourcesystemopt", "resourcecpuproc",
  "resourcecpu", "resourcecpuid", "resourcemem", "resourcechild",
  "resourceload", "resourceloadavg", "value", "timestamp", "operator",
  "time", "action", "action1", "action2", "rate1", "rate2", "recovery",
  "checksum", "hashtype", "inode", "space", "fsflag", "unit", "permission",
  "match", "matchflagnot", "size", "uid", "gid", "icmptype", "reminder", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385,   386,   387,   388,   389,   390,   391,   392,   393,   394,
     395,   396,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417,   418,   419,   420,   421,   422,   423,   424,
     425,   426,   427,   428,   429,   430,   431,   432,   433,   434,
     435,   436,   437,   438,   439,   440,   123,   125,    58,    64
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   190,   191,   191,   192,   192,   193,   193,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   193,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   194,   194,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   196,   196,   197,   197,   197,   197,   197,   197,
     197,   197,   197,   197,   197,   197,   197,   197,   197,   198,
     198,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   200,   200,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   202,
     202,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   204,   204,   205,   205,   205,   205,   205,   205,   206,
     206,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   208,   208,   209,   209,   209,   209,   209,
     210,   210,   210,   211,   212,   212,   213,   214,   215,   215,
     215,   216,   216,   216,   217,   218,   219,   220,   221,   221,
     222,   223,   224,   225,   226,   226,   227,   227,   228,   228,
     229,   229,   229,   229,   230,   230,   231,   231,   231,   232,
     232,   232,   232,   232,   233,   233,   234,   234,   235,   235,
     236,   237,   238,   238,   239,   239,   240,   240,   240,   240,
     240,   240,   241,   240,   242,   240,   243,   240,   244,   240,
     240,   245,   245,   246,   247,   247,   248,   248,   249,   250,
     251,   252,   253,   254,   255,   256,   256,   257,   257,   258,
     258,   259,   259,   260,   260,   261,   261,   261,   261,   262,
     262,   262,   263,   263,   264,   264,   265,   265,   266,   267,
     268,   268,   269,   270,   271,   271,   271,   271,   272,   272,
     273,   273,   273,   273,   273,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     275,   275,   276,   276,   277,   277,   277,   278,   278,   279,
     279,   279,   280,   280,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   282,   283,   284,   284,   285,   285,
     286,   286,   287,   288,   288,   289,   289,   290,   290,   290,
     290,   291,   292,   293,   293,   294,   294,   294,   294,   294,
     294,   294,   294,   294,   294,   294,   294,   294,   294,   294,
     294,   294,   294,   294,   294,   295,   295,   296,   296,   297,
     297,   297,   298,   299,   299,   299,   300,   301,   302,   302,
     303,   304,   305,   305,   306,   306,   306,   306,   307,   308,
     308,   309,   309,   309,   310,   310,   311,   312,   312,   312,
     313,   313,   313,   313,   314,   315,   316,   316,   316,   317,
     317,   318,   318,   319,   319,   319,   319,   319,   319,   320,
     320,   320,   320,   320,   321,   321,   321,   321,   321,   321,
     321,   322,   323,   324,   324,   324,   325,   325,   325,   326,
     326,   326,   326,   327,   327,   327,   328,   328,   328,   329,
     329,   330,   330,   331,   332,   332,   332,   332,   332,   333,
     334,   334,   334,   334,   335,   335,   336,   336,   337,   337,
     338,   338,   339,   340,   340,   340
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       2,     2,     2,     2,     2,     2,     2,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     2,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     1,     1,     1,     1,
       7,     4,     8,     4,     0,     3,     4,     2,     3,     3,
       5,     4,     6,     4,     3,     3,     3,     3,     1,     2,
       4,     5,     5,     5,     1,     2,     5,     7,     0,     2,
       1,     1,     1,     1,     1,     4,     1,     2,     2,     2,
       2,     3,     3,     2,     1,     1,     2,     2,     2,     2,
       2,     2,     0,     2,     0,     1,     5,     4,     2,     3,
       3,     3,     0,     4,     0,     5,     0,     5,     0,     5,
       2,     1,     2,     1,     0,     1,     4,     4,     4,     4,
       4,     4,     2,     4,     4,     3,     4,     3,     4,     1,
       2,     1,     2,     1,     1,     2,     2,     2,     2,     0,
       2,     2,     0,     2,     0,     2,    11,    10,    10,    10,
       0,     2,     2,     2,     0,     2,     4,     2,     0,     2,
       0,     1,     1,     1,     1,     0,     3,     2,     2,     2,
       2,     3,     2,     2,     2,     2,     2,     4,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     2,     2,     2,     0,     2,     2,     0,     2,     0,
       2,     4,     1,     3,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     6,     6,     0,     2,     0,     3,
       0,     3,     7,     0,     3,     1,     1,     6,     3,     7,
       1,     2,     2,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     4,     1,     2,     1,
       1,     1,     3,     2,     2,     2,     2,     2,     1,     2,
       1,     6,     1,     2,     1,     1,     1,     1,     6,     1,
       2,     1,     1,     1,     4,     4,     4,     1,     1,     1,
       4,     4,     4,     4,     3,     3,     1,     1,     1,     1,
       1,     9,     6,     0,     1,     1,     1,     1,     1,     0,
       1,     1,     1,     1,     1,     2,     3,     1,     1,     1,
       1,     1,     1,     0,     2,     3,     0,     2,     3,     0,
       6,     6,     6,     8,    10,     7,     0,     1,     1,     8,
       9,     9,     9,     6,     0,     1,     1,     1,     1,     8,
       7,     7,     4,     4,     0,     1,     9,     6,     8,     8,
       8,     8,     2,     0,     2,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     6,     7,    17,    18,     8,     9,    15,
      16,    14,    10,    11,    12,    13,    27,    42,    59,    75,
       0,   101,   109,   123,     0,     0,     0,     0,   137,     0,
       0,     0,     0,     0,     0,     0,     0,   345,     0,     0,
       0,     0,     0,   212,     0,     0,     1,     5,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     0,     0,     0,
      23,    89,    91,    92,    93,    94,    95,    96,   345,   320,
      97,    98,    99,   100,    24,    25,    26,   139,   138,   134,
     229,   310,   154,     0,   144,   145,   434,   146,   321,     0,
       0,     0,   310,   147,   148,     0,     0,     0,   453,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,    29,
      30,    33,    34,    31,    32,    35,    36,    37,    38,    39,
      40,    41,   444,   444,    43,    44,    45,    47,    49,    48,
      56,    57,    58,    46,    53,    50,    55,    54,    51,    52,
       0,    60,    61,    62,    63,    65,    64,    69,    70,    71,
      72,    73,    74,    66,    67,    68,     0,    76,    77,    78,
      80,    82,    81,    86,    87,    88,    79,    83,    84,    85,
     240,     0,   223,   224,   308,   219,   308,   322,     0,   353,
     354,   355,   356,   360,   357,   358,    90,     0,     0,   453,
       0,   102,   103,   104,   105,   106,   107,   108,   110,   111,
     112,   114,   116,   115,   120,   121,   122,   113,   117,   118,
     119,     0,   124,   125,   126,   127,   128,   129,     0,     0,
     133,     0,     0,   232,     0,   155,   234,   158,   435,   436,
     437,   438,   136,   349,   350,   351,     0,   347,   141,   143,
     250,   149,     0,     0,   327,   342,   326,   340,   344,   332,
     334,   343,   337,   341,   325,   330,   333,   336,   335,   329,
     328,   338,   339,   331,     0,   323,     0,   131,   206,   207,
     209,   208,   210,   211,   213,   214,   240,   393,   393,   393,
     386,   387,   388,   393,   393,     0,   413,   362,   364,   365,
     366,   367,   393,   426,   393,   426,   393,   445,     0,     0,
       0,     0,   393,   393,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   308,   220,   221,   215,   308,   217,   352,
     359,     0,     0,   318,   377,   378,   379,   413,   369,   373,
     393,   372,   371,   140,     0,   229,   231,   230,     0,   250,
       0,     0,   151,   153,   152,   348,     0,   254,   251,   252,
     253,   248,     0,     0,   345,   324,   454,     0,   244,   398,
     397,   396,   395,   394,     0,     0,     0,     0,     0,   413,
     413,     0,   363,     0,     0,   427,   428,     0,     0,     0,
       0,     0,   413,   413,     0,     0,     0,     0,   413,     0,
       0,   241,     0,   306,   313,     0,   244,     0,     0,   225,
     227,   226,   228,   222,   216,   218,     0,   345,   370,     0,
       0,   135,   232,   233,   248,   311,   235,     0,     0,     0,
       0,   166,     0,   159,   160,     0,   164,   161,   174,   175,
     162,   163,   142,     0,   150,   346,   345,   453,   455,   243,
       0,   255,   384,   390,   389,   434,   390,   434,     0,     0,
       0,     0,   414,     0,     0,   390,   385,   413,   413,   413,
     413,   413,   413,   399,     0,     0,   413,   434,   413,   413,
     443,   442,     0,   413,   390,   434,   452,     0,   310,     0,
     310,   242,   255,     0,   309,   345,   453,     0,     0,   250,
     156,     0,     0,     0,   200,   188,     0,   180,   168,   177,
     170,   179,   167,   169,   176,   178,     0,   182,     0,     0,
     173,   249,   453,   130,   247,   245,   250,     0,     0,     0,
     310,   279,   280,   381,   380,   383,   382,   374,   375,     0,
       0,   415,   408,   409,   404,   407,     0,   410,   411,   419,
       0,     0,     0,     0,     0,     0,     0,   400,   401,   402,
     403,   413,     0,     0,     0,   413,     0,     0,     0,   413,
       0,   413,   413,   307,   413,   316,   315,     0,   413,   310,
       0,   453,   317,   419,   376,   248,   189,   190,   191,     0,
       0,   204,   181,     0,   184,   171,   172,   132,   248,   282,
     283,   257,   289,     0,   260,   272,   271,   262,   263,   268,
     269,   266,   258,   273,   259,   264,   265,   274,   275,   276,
     277,   270,   284,   278,   413,   281,   304,   305,   405,     0,
     361,     0,     0,     0,     0,     0,   413,     0,     0,   392,
     447,     0,     0,     0,     0,   433,     0,     0,     0,     0,
       0,   314,     0,   413,   312,   319,   368,   157,     0,     0,
       0,   204,   203,   193,   201,   205,   187,   183,   185,   165,
     246,     0,   261,   393,   393,   393,   393,   393,   393,   393,
     393,   393,   393,   256,   292,     0,   287,     0,   406,     0,
     419,   419,   419,   419,   419,     0,   419,     0,   425,     0,
     441,   440,     0,   419,     0,     0,     0,     0,     0,   195,
     197,   199,   186,   202,   290,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   286,   285,     0,   267,
       0,   416,   416,   416,   448,   449,   450,   451,   439,     0,
     423,   419,   419,   419,   429,   419,   419,   419,   419,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   293,   288,   419,     0,     0,     0,     0,   419,   391,
     446,   430,   432,   431,   239,   237,   419,   291,   294,   295,
     296,   297,   298,   299,   300,   301,   302,   303,   238,   417,
       0,     0,     0,     0,   424,   236,   418,   412,   420,   421,
     422
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    10,    11,    12,    58,   118,    59,   134,    60,   151,
      61,   167,    70,    71,    84,   201,    85,   208,    86,   222,
      13,    14,   230,    15,    16,    17,    18,    19,    20,    21,
      22,   103,   104,    23,    24,    25,    91,    92,   353,   433,
     434,   435,   436,   437,   438,   439,   440,   517,   594,   669,
     441,   590,   658,   659,   660,   663,   664,   666,    26,    27,
      28,    29,    30,    31,    32,    33,    72,    73,   184,   323,
     185,   325,   233,   349,   352,    74,   122,    75,   318,   406,
     368,   451,   444,   361,   530,   531,   532,   686,   729,   672,
     683,   684,   123,   124,   488,   326,   236,    76,   490,   577,
      77,    78,    79,   274,   275,   108,   246,   247,    80,    81,
      82,    83,   194,   195,   131,   296,   297,   207,   337,   338,
     298,   339,   340,   299,   300,   301,   302,   455,   143,   374,
     561,   548,   549,   798,   383,   765,   630,   144,   390,   160,
     161,   162,   242,   145,   146,   308,   147,   148,   149,   403,
     277
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -566
static const yytype_int16 yypact[] =
{
     115,   505,   -32,    -1,    21,    41,    47,    57,    81,   106,
     114,   115,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
     527,  -566,  -566,  -566,    51,   110,   125,   170,  -566,   143,
     152,   177,   159,   161,    99,   132,   109,   -14,    67,   262,
     266,   295,   324,  -566,   305,   327,  -566,  -566,   550,    30,
     593,   609,    29,   229,   229,   287,   310,   242,   298,   314,
     527,  -566,  -566,  -566,  -566,  -566,  -566,  -566,     7,  -566,
    -566,  -566,  -566,  -566,   210,   609,   273,   399,  -566,   398,
     -17,   -16,  -566,   374,  -566,  -566,   321,  -566,  -566,   346,
     383,   386,   434,   109,  -566,   306,   318,   459,   476,   437,
     450,   456,   464,   468,   471,   473,   475,   162,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,    12,   394,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
      18,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,    76,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
      33,   511,  -566,  -566,   183,  -566,   183,  -566,   536,  -566,
    -566,  -566,  -566,  -566,   314,  -566,  -566,   391,   459,   476,
     243,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,   489,  -566,  -566,  -566,  -566,  -566,  -566,   508,   562,
    -566,   497,   199,   452,   507,  -566,   556,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,    25,  -566,   474,  -566,
     349,  -566,   346,   459,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,   179,  -566,   517,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,     5,    88,    88,    88,
    -566,  -566,  -566,    88,    88,   208,   547,  -566,  -566,  -566,
    -566,  -566,    88,    70,    88,    -4,    88,  -566,   451,   466,
      96,   432,    88,    88,   483,   548,   595,   462,   599,   555,
     559,   -40,   158,   -18,  -566,  -566,  -566,   -18,  -566,  -566,
    -566,   459,   272,  -566,  -566,  -566,  -566,   353,  -566,  -566,
      88,  -566,  -566,  -566,   560,   518,  -566,  -566,   584,   349,
     526,   594,  -566,   274,  -566,  -566,   587,  -566,  -566,  -566,
    -566,   529,    46,   325,   639,  -566,   658,   610,   650,  -566,
    -566,  -566,  -566,  -566,   605,   172,   230,   606,   607,   611,
     611,     6,  -566,   698,   232,  -566,  -566,   215,   225,   613,
     647,   616,   611,   611,   648,   617,   322,   328,   611,   618,
     276,  -566,   543,   675,   537,   623,   650,   680,   573,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,   406,   639,  -566,   712,
     627,  -566,   452,  -566,   529,  -566,  -566,    15,   636,    17,
      22,   389,   395,  -566,  -566,   696,    50,  -566,  -566,  -566,
    -566,  -566,  -566,   638,  -566,  -566,   639,   476,  -566,  -566,
     439,   278,  -566,   631,  -566,   321,   633,   321,   634,   635,
     723,   725,  -566,   697,    45,  -566,  -566,   611,   611,   611,
     611,   611,     9,   470,   726,   728,   611,   321,   611,   611,
    -566,  -566,   729,   332,   643,   321,  -566,   645,   434,   275,
     434,  -566,   278,   732,  -566,   639,   476,    45,   672,   349,
    -566,   655,   682,   683,   577,   685,   686,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,   687,   742,   688,   689,
    -566,  -566,   476,  -566,  -566,  -566,   349,   691,   692,   681,
     434,   422,  -566,  -566,  -566,  -566,  -566,  -566,  -566,    45,
      45,  -566,  -566,  -566,  -566,  -566,   229,  -566,  -566,   772,
     773,   774,   775,   776,   777,   694,   778,  -566,  -566,  -566,
    -566,   611,    45,    45,   779,   611,   780,   781,    45,   611,
     782,   611,   611,  -566,   611,  -566,  -566,   705,   611,   434,
     733,   476,  -566,   772,  -566,   529,   707,   708,   709,   710,
     711,   783,  -566,   713,   766,  -566,  -566,  -566,   529,  -566,
    -566,  -566,   666,   589,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,   619,  -566,   611,  -566,  -566,  -566,   -29,   795,
    -566,    45,    45,    45,    45,    45,   611,    45,   797,  -566,
    -566,    45,   798,    45,    45,  -566,   799,    45,   800,   801,
     802,  -566,   803,   611,  -566,  -566,  -566,  -566,   711,   711,
     711,   783,  -566,   711,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,   716,  -566,    88,    88,    88,    88,    88,    88,    88,
      88,    88,    88,   804,  -566,   297,   628,   806,   375,   356,
     772,   772,   772,   772,   772,   807,   772,    45,  -566,    45,
    -566,  -566,    45,   772,    45,    45,    45,    45,   808,   711,
     711,   711,  -566,  -566,   756,   724,   727,   730,   731,   734,
     735,   736,   737,   738,   739,   589,  -566,  -566,   740,  -566,
      45,   741,   741,   741,  -566,  -566,  -566,  -566,  -566,    45,
    -566,   772,   772,   772,  -566,   772,   772,   772,   772,    45,
     750,   743,   744,   745,   746,   747,   748,   749,   751,   752,
     753,  -566,  -566,   772,    10,   811,   812,   814,   772,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,   772,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
     785,    45,    45,    45,  -566,  -566,  -566,  -566,  -566,  -566,
    -566
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -566,  -566,  -566,   813,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,   764,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,   720,  -566,  -566,  -566,  -566,   755,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,   -39,  -415,   181,  -566,  -566,
    -566,  -566,  -566,  -566,  -566,  -566,   358,   502,   -64,  -183,
    -182,  -314,   503,   425,  -566,   791,  -566,  -566,  -566,  -566,
    -566,   444,  -396,  -335,   359,  -566,   323,  -566,  -566,  -566,
    -566,   127,  -566,  -566,  -566,  -165,  -101,   292,  -566,  -566,
     367,   852,  -566,  -166,  -259,   -73,   603,  -223,   447,   545,
     465,   615,  -566,   662,  -566,  -566,   561,  -566,  -566,   521,
    -566,  -566,  -566,  -174,  -566,  -171,  -566,  -320,    63,  -282,
    -566,  -138,  -447,  -255,  -327,  -187,  -565,  -566,   554,  -566,
    -566,  -566,  -409,     1,  -566,   754,  -566,    34,   155,  -566,
    -191
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -199
static const yytype_int16 yytable[] =
{
     186,   250,   324,   327,   324,   199,   375,   376,   333,   413,
     419,   377,   378,   413,   424,   365,   385,   386,   656,   303,
     384,   328,   391,   355,   395,   310,   341,   231,   500,   342,
     399,   400,   332,   132,   501,   502,   180,   503,   320,   105,
     234,   462,   555,   409,   508,   789,   534,   315,   536,   510,
     583,   410,   460,   461,   182,   183,   457,    48,   420,   367,
     105,   163,   177,    87,   466,   474,   475,    90,   565,    63,
      64,   482,   509,   365,   518,   315,   572,   511,   519,   520,
     485,    43,    65,   310,   542,   543,   218,   363,    49,    66,
     385,   386,   626,   627,   164,   178,   544,   463,   504,   505,
     381,   790,   545,   181,   365,   109,   321,   322,   110,   181,
      50,   243,   244,   245,    56,   639,   640,   321,   322,   219,
     181,   645,   232,     1,   176,   734,   735,   736,   737,   738,
      51,   740,   243,   244,   245,    88,    52,   392,   744,   355,
     550,   551,   552,   553,   554,   556,    53,   106,   217,   564,
      67,   566,   567,   304,   305,   393,   570,   365,   414,    68,
     311,    69,   415,   341,   585,   416,   342,   181,   197,   286,
      54,   306,   107,   307,   312,   313,   769,   770,   771,   317,
     772,   773,   774,   775,   690,   691,   692,   693,   694,   657,
     696,   598,   133,   198,   698,    55,   700,   701,   788,   316,
     703,    89,   670,   794,   506,   387,   388,   317,    90,   546,
     547,   795,   354,   200,    93,   165,   179,   304,   314,     2,
       3,     4,     5,     6,     7,     8,     9,    94,   389,   254,
     369,   387,   388,   445,   638,   255,    95,   256,   642,   320,
     220,   411,   646,    97,   648,   649,    98,   650,   713,   412,
     741,   652,   742,   181,   389,   743,   523,   745,   746,   747,
     748,    43,    65,   453,   100,   101,   182,   183,    96,    66,
     370,   371,   372,   373,   287,   454,   221,   288,   289,   290,
     291,   292,   346,   763,   347,    99,   293,   294,   102,   427,
     428,   447,   768,   257,   713,   713,   713,   687,   467,   429,
     430,   431,   776,   111,   295,   582,   468,   112,   469,   695,
     527,   528,   182,   183,   258,   259,   470,   260,   321,   322,
     261,   456,   254,   465,    43,    65,   708,   529,   255,   432,
     256,   597,    66,   454,   181,   454,   113,   262,   263,    68,
     114,    69,   264,   265,   496,   266,   115,   267,   268,   269,
     125,   137,   154,   170,   270,   271,   272,   273,   288,   289,
     290,   291,   292,   189,   190,   191,   364,   484,   116,   334,
     335,   336,   187,   522,   413,   254,   202,   211,   223,   454,
     726,   255,   727,   256,   379,   380,   257,   574,   192,   578,
     655,   715,   716,   717,   718,   719,   720,   721,   722,   723,
     724,   188,    68,   193,    69,   478,   479,   258,   259,   228,
     260,   480,   481,   261,   512,   513,   119,   135,   152,   168,
     514,   515,   581,   381,   569,   126,   138,   155,   171,   624,
     262,   263,   243,   244,   245,   264,   265,   229,   266,   257,
     267,   268,   269,   209,   381,   688,   324,   270,   271,   272,
     273,   203,   212,   224,   527,   528,   254,   575,   576,   417,
     258,   259,   255,   260,   256,   237,   261,   248,   288,   289,
     290,   291,   292,   238,   239,   240,   241,   249,   653,   334,
     335,   336,   628,   262,   263,   524,   525,   526,   264,   265,
     234,   266,   252,   267,   268,   269,   357,   358,   359,   360,
     270,   271,   272,   273,   253,   127,   139,   156,   172,   254,
     321,   322,   446,   276,    34,   255,    35,   256,    36,    37,
     257,   278,    38,   129,   141,   158,   174,   731,   732,   733,
      62,   204,   213,   225,   279,    39,    40,   799,   800,    41,
     280,   258,   259,    42,   260,   766,   767,   261,   281,   205,
     215,   226,   282,   117,   283,   307,    43,   284,    44,   285,
     120,   136,   153,   169,   262,   263,    63,    64,   319,   264,
     265,   329,   266,   257,   267,   268,   269,   331,    43,    65,
     181,   270,   271,   272,   273,   344,    66,   210,   345,    63,
      64,   343,   348,   495,   258,   259,   150,   260,   350,   351,
     261,    43,    65,   128,   140,   157,   173,   356,   366,    66,
     398,   396,   166,   557,   558,   559,   560,   262,   263,   709,
     710,   711,   264,   265,   392,   266,   397,   267,   268,   269,
     214,   401,    63,    64,   270,   271,   272,   273,   381,    45,
     402,   404,    46,   405,    43,    65,   407,    67,    63,    64,
     408,   421,    66,   797,   797,   797,    68,   232,    69,   287,
      43,    65,   288,   289,   290,   291,   292,   423,    66,   425,
      67,   293,   294,   130,   142,   159,   175,   426,   442,    68,
     443,    69,   673,   674,   675,   676,   677,   678,   679,   680,
     681,   682,   105,   448,   449,   450,   452,   458,   459,   206,
     216,   227,   381,   464,   471,   472,   476,   473,   477,   483,
     486,   487,   489,    67,   491,   493,   494,   497,   498,   507,
     516,   521,    68,   533,    69,   535,   537,   538,   539,    67,
     540,   562,   541,   563,   568,   571,   573,   580,    68,   586,
      69,   601,   602,   603,   604,   605,   606,   607,   608,   609,
     610,   611,   612,   613,   614,   615,   616,   617,   618,   619,
     620,   621,   622,   623,   584,   589,   587,   588,  -192,   591,
     593,   592,   595,   596,   599,   600,   629,   636,   631,   632,
     633,   634,   635,   637,   641,   643,   644,   647,   651,   654,
    -194,  -196,  -198,   661,   662,   668,   671,   667,   689,   685,
     714,   665,   697,   699,   702,   704,   705,   706,   707,   728,
     725,   730,   739,   749,   750,   751,   791,   792,   752,   793,
     796,   753,   754,   251,    57,   755,   756,   757,   758,   759,
     760,   762,   764,   777,   196,   778,   779,   780,   781,   782,
     783,   784,   712,   785,   786,   787,   235,   499,   422,   121,
     492,   579,   761,    47,   625,   362,   330,   382,   418,   394,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   309
};

static const yytype_int16 yycheck[] =
{
      64,   102,   184,   186,   186,    78,   288,   289,   199,   323,
     337,   293,   294,   327,   349,   274,    20,    21,   583,     7,
     302,   186,   304,   246,   306,     7,   200,    44,   424,   200,
     312,   313,   198,     3,    19,    20,     7,    22,    56,    53,
      56,    35,    33,    83,    27,    35,   455,    42,   457,    27,
     497,    91,   379,   380,    83,    84,   376,    89,   340,    54,
      53,    60,    61,    12,   384,   392,   393,    83,   477,    39,
      40,   398,    55,   332,    24,    42,   485,    55,    28,    29,
     400,    51,    52,     7,    39,    40,    85,   253,    89,    59,
      20,    21,   539,   540,    60,    61,    51,    91,    83,    84,
      91,    91,    57,    91,   363,    38,   135,   136,    41,    91,
      89,    86,    87,    88,     0,   562,   563,   135,   136,    85,
      91,   568,   139,     8,    61,   690,   691,   692,   693,   694,
      89,   696,    86,    87,    88,    84,    89,   141,   703,   362,
     467,   468,   469,   470,   471,   472,    89,   161,    85,   476,
     120,   478,   479,   141,   142,   159,   483,   416,   323,   129,
     142,   131,   327,   337,   499,   331,   337,    91,   161,     7,
      89,   159,   186,   161,   156,   157,   741,   742,   743,   174,
     745,   746,   747,   748,   631,   632,   633,   634,   635,   585,
     637,   526,   162,   186,   641,    89,   643,   644,   763,   166,
     647,    91,   598,   768,   189,   135,   136,   174,    83,   164,
     165,   776,   187,     3,    44,    60,    61,   141,   142,   104,
     105,   106,   107,   108,   109,   110,   111,    84,   158,    50,
     142,   135,   136,   187,   561,    56,    84,    58,   565,    56,
      85,    83,   569,    84,   571,   572,    85,   574,   663,    91,
     697,   578,   699,    91,   158,   702,   447,   704,   705,   706,
     707,    51,    52,    91,   132,   133,    83,    84,    91,    59,
     182,   183,   184,   185,   112,   103,     3,   115,   116,   117,
     118,   119,    83,   730,    85,   186,   124,   125,   179,    15,
      16,   364,   739,   114,   709,   710,   711,   624,    83,    25,
      26,    27,   749,    41,   142,   496,    91,    41,    83,   636,
      32,    33,    83,    84,   135,   136,    91,   138,   135,   136,
     141,    91,    50,    91,    51,    52,   653,    49,    56,    55,
      58,   522,    59,   103,    91,   103,    41,   158,   159,   129,
      16,   131,   163,   164,   417,   166,    41,   168,   169,   170,
      58,    59,    60,    61,   175,   176,   177,   178,   115,   116,
     117,   118,   119,   121,   122,   123,   187,    91,    41,   126,
     127,   128,    85,   446,   688,    50,    84,    85,    86,   103,
      83,    56,    85,    58,   176,   177,   114,   488,    90,   490,
     581,   673,   674,   675,   676,   677,   678,   679,   680,   681,
     682,    91,   129,    89,   131,    83,    84,   135,   136,    10,
     138,    83,    84,   141,    25,    26,    58,    59,    60,    61,
      25,    26,   495,    91,    92,    58,    59,    60,    61,   530,
     158,   159,    86,    87,    88,   163,   164,    39,   166,   114,
     168,   169,   170,    85,    91,   628,   628,   175,   176,   177,
     178,    84,    85,    86,    32,    33,    50,   182,   183,   187,
     135,   136,    56,   138,    58,    91,   141,    84,   115,   116,
     117,   118,   119,   152,   153,   154,   155,    91,   579,   126,
     127,   128,   546,   158,   159,    46,    47,    48,   163,   164,
      56,   166,   186,   168,   169,   170,   147,   148,   149,   150,
     175,   176,   177,   178,   186,    58,    59,    60,    61,    50,
     135,   136,   187,    37,     9,    56,    11,    58,    13,    14,
     114,    84,    17,    58,    59,    60,    61,   171,   172,   173,
       3,    84,    85,    86,    84,    30,    31,   792,   793,    34,
      84,   135,   136,    38,   138,   732,   733,   141,    84,    84,
      85,    86,    84,     3,    83,   161,    51,    84,    53,    84,
      58,    59,    60,    61,   158,   159,    39,    40,    57,   163,
     164,    35,   166,   114,   168,   169,   170,   186,    51,    52,
      91,   175,   176,   177,   178,    23,    59,    85,    91,    39,
      40,    83,   140,   187,   135,   136,     3,   138,    91,    43,
     141,    51,    52,    58,    59,    60,    61,   133,    91,    59,
     178,   160,     3,   143,   144,   145,   146,   158,   159,   658,
     659,   660,   163,   164,   141,   166,   160,   168,   169,   170,
      85,    83,    39,    40,   175,   176,   177,   178,    91,   134,
      45,   179,   137,    44,    51,    52,    91,   120,    39,    40,
      91,    91,    59,   791,   792,   793,   129,   139,   131,   112,
      51,    52,   115,   116,   117,   118,   119,    83,    59,   143,
     120,   124,   125,    58,    59,    60,    61,    83,    91,   129,
     151,   131,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,    53,    35,    84,    45,    91,    91,    91,    84,
      85,    86,    91,     5,    91,    58,    58,    91,    91,    91,
     167,    36,   175,   120,    91,    35,   143,     5,    91,    83,
      24,    83,   129,    92,   131,    92,    92,    92,     5,   120,
       5,     5,    35,     5,     5,    92,    91,     5,   129,    84,
     131,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    92,   188,    84,    84,    83,    83,
      28,    84,    84,    84,    83,    83,     4,    83,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,    83,    56,
      83,    83,    83,    83,    83,    29,   130,    84,     3,   180,
      84,    18,     5,     5,     5,     5,     5,     5,     5,   181,
       6,     5,     5,     5,    58,    91,     5,     5,    91,     5,
      35,    91,    91,   103,    11,    91,    91,    91,    91,    91,
      91,    91,    91,    83,    70,    92,    92,    92,    92,    92,
      92,    92,   661,    92,    92,    92,    91,   422,   345,    58,
     406,   492,   725,     1,   531,   252,   194,   296,   337,   305,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   133
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     8,   104,   105,   106,   107,   108,   109,   110,   111,
     191,   192,   193,   210,   211,   213,   214,   215,   216,   217,
     218,   219,   220,   223,   224,   225,   248,   249,   250,   251,
     252,   253,   254,   255,     9,    11,    13,    14,    17,    30,
      31,    34,    38,    51,    53,   134,   137,   291,    89,    89,
      89,    89,    89,    89,    89,    89,     0,   193,   194,   196,
     198,   200,     3,    39,    40,    52,    59,   120,   129,   131,
     202,   203,   256,   257,   265,   267,   287,   290,   291,   292,
     298,   299,   300,   301,   204,   206,   208,    12,    84,    91,
      83,   226,   227,    44,    84,    84,    91,    84,    85,   186,
     132,   133,   179,   221,   222,    53,   161,   186,   295,    38,
      41,    41,    41,    41,    16,    41,    41,     3,   195,   256,
     257,   265,   266,   282,   283,   287,   290,   298,   299,   300,
     301,   304,     3,   162,   197,   256,   257,   287,   290,   298,
     299,   300,   301,   318,   327,   333,   334,   336,   337,   338,
       3,   199,   256,   257,   287,   290,   298,   299,   300,   301,
     329,   330,   331,   333,   337,   338,     3,   201,   256,   257,
     287,   290,   298,   299,   300,   301,   318,   333,   337,   338,
       7,    91,    83,    84,   258,   260,   258,    85,    91,   121,
     122,   123,    90,    89,   302,   303,   203,   161,   186,   295,
       3,   205,   287,   290,   298,   300,   301,   307,   207,   256,
     257,   287,   290,   298,   299,   300,   301,   318,   333,   337,
     338,     3,   209,   287,   290,   298,   300,   301,    10,    39,
     212,    44,   139,   262,    56,   227,   286,    91,   152,   153,
     154,   155,   332,    86,    87,    88,   296,   297,    84,    91,
     286,   222,   186,   186,    50,    56,    58,   114,   135,   136,
     138,   141,   158,   159,   163,   164,   166,   168,   169,   170,
     175,   176,   177,   178,   293,   294,    37,   340,    84,    84,
      84,    84,    84,    83,    84,    84,     7,   112,   115,   116,
     117,   118,   119,   124,   125,   142,   305,   306,   310,   313,
     314,   315,   316,     7,   141,   142,   159,   161,   335,   335,
       7,   142,   156,   157,   142,    42,   166,   174,   268,    57,
      56,   135,   136,   259,   260,   261,   285,   259,   285,    35,
     303,   186,   293,   340,   126,   127,   128,   308,   309,   311,
     312,   313,   315,    83,    23,    91,    83,    85,   140,   263,
      91,    43,   264,   228,   187,   297,   133,   147,   148,   149,
     150,   273,   296,   293,   187,   294,    91,    54,   270,   142,
     182,   183,   184,   185,   319,   319,   319,   319,   319,   176,
     177,    91,   306,   324,   319,    20,    21,   135,   136,   158,
     328,   319,   141,   159,   328,   319,   160,   160,   178,   319,
     319,    83,    45,   339,   179,    44,   269,    91,    91,    83,
      91,    83,    91,   261,   285,   285,   293,   187,   309,   324,
     319,    91,   262,    83,   273,   143,    83,    15,    16,    25,
      26,    27,    55,   229,   230,   231,   232,   233,   234,   235,
     236,   240,    91,   151,   272,   187,   187,   295,    35,    84,
      45,   271,    91,    91,   103,   317,    91,   317,    91,    91,
     324,   324,    35,    91,     5,    91,   317,    83,    91,    83,
      91,    91,    58,    91,   324,   324,    58,    91,    83,    84,
      83,    84,   324,    91,    91,   317,   167,    36,   284,   175,
     288,    91,   271,    35,   143,   187,   295,     5,    91,   263,
     272,    19,    20,    22,    83,    84,   189,    83,    27,    55,
      27,    55,    25,    26,    25,    26,    24,   237,    24,    28,
      29,    83,   295,   340,    46,    47,    48,    32,    33,    49,
     274,   275,   276,    92,   332,    92,   332,    92,    92,     5,
       5,    35,    39,    40,    51,    57,   164,   165,   321,   322,
     324,   324,   324,   324,   324,    33,   324,   143,   144,   145,
     146,   320,     5,     5,   324,   332,   324,   324,     5,    92,
     324,    92,   332,    91,   286,   182,   183,   289,   286,   274,
       5,   295,   340,   322,    92,   273,    84,    84,    84,   188,
     241,    83,    84,    28,   238,    84,    84,   340,   273,    83,
      83,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,   286,   276,   322,   322,   258,     4,
     326,     5,     5,     5,     5,     5,    83,     5,   324,   322,
     322,     5,   324,     5,     5,   322,   324,     5,   324,   324,
     324,    83,   324,   286,    56,   340,   326,   272,   242,   243,
     244,    83,    83,   245,   246,    18,   247,    84,    29,   239,
     272,   130,   279,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   280,   281,   180,   277,   324,   259,     3,
     322,   322,   322,   322,   322,   324,   322,     5,   322,     5,
     322,   322,     5,   322,     5,     5,     5,     5,   324,   245,
     245,   245,   247,   246,    84,   319,   319,   319,   319,   319,
     319,   319,   319,   319,   319,     6,    83,    85,   181,   278,
       5,   171,   172,   173,   326,   326,   326,   326,   326,     5,
     326,   322,   322,   322,   326,   322,   322,   322,   322,     5,
      58,    91,    91,    91,    91,    91,    91,    91,    91,    91,
      91,   281,    91,   322,    91,   325,   325,   325,   322,   326,
     326,   326,   326,   326,   326,   326,   322,    83,    92,    92,
      92,    92,    92,    92,    92,    92,    92,    92,   326,    35,
      91,     5,     5,     5,   326,   326,    35,   321,   323,   323,
     323
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 130:
#line 474 "p.y"
    {
                    addmail((yyvsp[(2) - (7)].string), &mailset, &Run.maillist, eventset, (yyvsp[(7) - (7)].number));
                  }
    break;

  case 131:
#line 477 "p.y"
    {
                    addmail((yyvsp[(2) - (4)].string), &mailset, &Run.maillist, EVENT_ALL, (yyvsp[(4) - (4)].number));
                  }
    break;

  case 132:
#line 480 "p.y"
    {
                   addmail((yyvsp[(2) - (8)].string), &mailset, &Run.maillist, ~eventset, (yyvsp[(8) - (8)].number));
                  }
    break;

  case 133:
#line 485 "p.y"
    {
                    if (!Run.isdaemon || ihp.daemon) {
                      ihp.daemon     = TRUE;
                      Run.isdaemon   = TRUE;
                      Run.polltime   = (yyvsp[(3) - (4)].number);
                      Run.startdelay = (yyvsp[(4) - (4)].number);
                    }
                  }
    break;

  case 134:
#line 495 "p.y"
    { (yyval.number) = START_DELAY; }
    break;

  case 135:
#line 496 "p.y"
    { (yyval.number) = (yyvsp[(3) - (3)].number); }
    break;

  case 136:
#line 499 "p.y"
    {
                    Run.expectbuffer = (yyvsp[(3) - (4)].number) * (yyvsp[(4) - (4)].number);
                  }
    break;

  case 137:
#line 504 "p.y"
    {
                    Run.init = TRUE;
                  }
    break;

  case 138:
#line 509 "p.y"
    {
                   if (!Run.logfile || ihp.logfile) {
                     ihp.logfile = TRUE;
                     setlogfile((yyvsp[(3) - (3)].string));
                     Run.use_syslog = FALSE;
                     Run.dolog =TRUE;
                   }
                  }
    break;

  case 139:
#line 517 "p.y"
    {
                    setsyslog(NULL);
                  }
    break;

  case 140:
#line 520 "p.y"
    {
                    setsyslog((yyvsp[(5) - (5)].string)); FREE((yyvsp[(5) - (5)].string));
                  }
    break;

  case 141:
#line 525 "p.y"
    {
                    Run.eventlist_dir = (yyvsp[(4) - (4)].string);
                  }
    break;

  case 142:
#line 528 "p.y"
    {
                    Run.eventlist_dir = (yyvsp[(4) - (6)].string);
                    Run.eventlist_slots = (yyvsp[(6) - (6)].number);
                  }
    break;

  case 143:
#line 532 "p.y"
    {
                    Run.eventlist_dir = xstrdup(MYEVENTLISTBASE);
                    Run.eventlist_slots = (yyvsp[(4) - (4)].number);
                  }
    break;

  case 144:
#line 538 "p.y"
    {
                    Run.idfile = (yyvsp[(3) - (3)].string);
                  }
    break;

  case 145:
#line 543 "p.y"
    {
                    Run.statefile = (yyvsp[(3) - (3)].string);
                  }
    break;

  case 146:
#line 548 "p.y"
    {
                   if (!Run.pidfile || ihp.pidfile) {
                     ihp.pidfile = TRUE;
                     setpidfile((yyvsp[(3) - (3)].string));
                   }
                 }
    break;

  case 150:
#line 563 "p.y"
    {
                    check_hostname(((yyvsp[(1) - (4)].url))->hostname);
                    addmmonit((yyvsp[(1) - (4)].url), (yyvsp[(2) - (4)].number), (yyvsp[(3) - (4)].number), (yyvsp[(4) - (4)].string)); 
                  }
    break;

  case 151:
#line 569 "p.y"
    {
                   Run.mailserver_timeout = (yyvsp[(4) - (5)].number);
                   Run.mail_hostname = (yyvsp[(5) - (5)].string);
                  }
    break;

  case 152:
#line 575 "p.y"
    {
                   Run.MailFormat.from    = mailset.from    ?  mailset.from    : xstrdup(ALERT_FROM);
                   Run.MailFormat.subject = mailset.subject ?  mailset.subject : xstrdup(ALERT_SUBJECT);
                   Run.MailFormat.message = mailset.message ?  mailset.message : xstrdup(ALERT_MESSAGE);
                   reset_mailset();
                 }
    break;

  case 153:
#line 583 "p.y"
    {
                   Run.dohttpd = TRUE;
                   Run.httpdport = (yyvsp[(4) - (5)].number);
                 }
    break;

  case 156:
#line 593 "p.y"
    {
                    /* Restore the current text overriden by lookahead */
                    FREE(argyytext);
                    argyytext = xstrdup((yyvsp[(1) - (5)].string));

                    check_hostname((yyvsp[(1) - (5)].string));
                    mailserverset.host = (yyvsp[(1) - (5)].string);
                    mailserverset.username = (yyvsp[(2) - (5)].string);
                    mailserverset.password = (yyvsp[(3) - (5)].string);
                    mailserverset.ssl.version = (yyvsp[(4) - (5)].number);
                    if (mailserverset.ssl.version != SSL_VERSION_NONE) {
                      mailserverset.ssl.use_ssl = TRUE;
                      if (mailserverset.ssl.version == SSL_VERSION_SSLV2 ||
                         mailserverset.ssl.version == SSL_VERSION_SSLV3)
                         mailserverset.port = PORT_SMTPS;
                      mailserverset.ssl.certmd5 = (yyvsp[(5) - (5)].string);
                    }
                    addmailserver(&mailserverset);
                  }
    break;

  case 157:
#line 612 "p.y"
    {
                    /* Restore the current text overriden by lookahead */
                    FREE(argyytext);
                    argyytext = xstrdup((yyvsp[(1) - (7)].string));

                    check_hostname((yyvsp[(1) - (7)].string));
                    mailserverset.host = (yyvsp[(1) - (7)].string);
                    mailserverset.port = (yyvsp[(3) - (7)].number);
                    mailserverset.username = (yyvsp[(4) - (7)].string);
                    mailserverset.password = (yyvsp[(5) - (7)].string);
                    mailserverset.ssl.version = (yyvsp[(6) - (7)].number);
                    if (mailserverset.ssl.version != SSL_VERSION_NONE) {
                      mailserverset.ssl.use_ssl = TRUE;
                      mailserverset.ssl.certmd5 = (yyvsp[(7) - (7)].string);
                    }
                    addmailserver(&mailserverset);
                  }
    break;

  case 164:
#line 641 "p.y"
    { Run.httpdssl = FALSE; }
    break;

  case 165:
#line 642 "p.y"
    { 
                    Run.httpdssl = TRUE;                   
                    if (!have_ssl())
                      yyerror("SSL is not supported");
                  }
    break;

  case 171:
#line 656 "p.y"
    { FREE((yyvsp[(3) - (3)].string)); }
    break;

  case 172:
#line 657 "p.y"
    { FREE((yyvsp[(3) - (3)].string)); }
    break;

  case 174:
#line 661 "p.y"
    { Run.httpdsig = TRUE; }
    break;

  case 175:
#line 662 "p.y"
    { Run.httpdsig = FALSE; }
    break;

  case 180:
#line 673 "p.y"
    { Run.bind_addr = (yyvsp[(2) - (2)].string); }
    break;

  case 181:
#line 676 "p.y"
    {
                    Run.httpsslpem = (yyvsp[(2) - (2)].string);
                    if (!File_checkStat(Run.httpsslpem, "SSL server PEM file", S_IRWXU))
                      yyerror2("SSL server PEM file has too loose permissions");
                  }
    break;

  case 183:
#line 684 "p.y"
    {
                    Run.httpsslclientpem = (yyvsp[(2) - (2)].string); 
                    Run.clientssl = TRUE;
                    if (!File_checkStat(Run.httpsslclientpem, "SSL client PEM file", S_IRWXU | S_IRGRP | S_IROTH))
                      yyerror2("SSL client PEM file has too loose permissions");
                  }
    break;

  case 184:
#line 692 "p.y"
    { 
                   Run.allowselfcert = FALSE; 
                   config_ssl(Run.allowselfcert); 
                 }
    break;

  case 185:
#line 696 "p.y"
    {   
                    Run.allowselfcert = TRUE;
                    config_ssl(Run.allowselfcert); 
                  }
    break;

  case 186:
#line 702 "p.y"
    {
                    addcredentials((yyvsp[(2) - (5)].string),(yyvsp[(4) - (5)].string), DIGEST_CLEARTEXT, (yyvsp[(5) - (5)].number));
                  }
    break;

  case 187:
#line 705 "p.y"
    {
#ifdef HAVE_LIBPAM
                    addpamauth((yyvsp[(3) - (4)].string), (yyvsp[(4) - (4)].number));
#else
                    yyerror("PAM is not supported");
                    FREE((yyvsp[(3) - (4)].string));
#endif
                  }
    break;

  case 188:
#line 713 "p.y"
    {
                    addhtpasswdentry((yyvsp[(2) - (2)].string), NULL, DIGEST_CLEARTEXT);
                    FREE((yyvsp[(2) - (2)].string));
                  }
    break;

  case 189:
#line 717 "p.y"
    {
                    addhtpasswdentry((yyvsp[(3) - (3)].string), NULL, DIGEST_CLEARTEXT);
                    FREE((yyvsp[(3) - (3)].string));
                  }
    break;

  case 190:
#line 721 "p.y"
    {
                    addhtpasswdentry((yyvsp[(3) - (3)].string), NULL, DIGEST_MD5);
                    FREE((yyvsp[(3) - (3)].string));
                  }
    break;

  case 191:
#line 725 "p.y"
    {
                    addhtpasswdentry((yyvsp[(3) - (3)].string), NULL, DIGEST_CRYPT);
                    FREE((yyvsp[(3) - (3)].string));
                  }
    break;

  case 192:
#line 729 "p.y"
    {
                    htpasswd_file = (yyvsp[(2) - (2)].string);
                    digesttype = CLEARTEXT;
                  }
    break;

  case 193:
#line 733 "p.y"
    {
                    FREE(htpasswd_file);
                  }
    break;

  case 194:
#line 736 "p.y"
    {
                    htpasswd_file = (yyvsp[(3) - (3)].string);
                    digesttype = DIGEST_CLEARTEXT;
                  }
    break;

  case 195:
#line 740 "p.y"
    {
                    FREE(htpasswd_file);
                  }
    break;

  case 196:
#line 743 "p.y"
    {
                    htpasswd_file = (yyvsp[(3) - (3)].string);
                    digesttype = DIGEST_MD5;
                  }
    break;

  case 197:
#line 747 "p.y"
    {
                    FREE(htpasswd_file);
                  }
    break;

  case 198:
#line 750 "p.y"
    {
                    htpasswd_file = (yyvsp[(3) - (3)].string);
                    digesttype = DIGEST_CRYPT;
                  }
    break;

  case 199:
#line 754 "p.y"
    {
                    FREE(htpasswd_file);
                  }
    break;

  case 200:
#line 757 "p.y"
    {
                    if (! (add_net_allow((yyvsp[(2) - (2)].string)) || add_host_allow((yyvsp[(2) - (2)].string)))) {
                      yyerror2("erroneous network or host identifier %s", (yyvsp[(2) - (2)].string)); 
                    }
                    FREE((yyvsp[(2) - (2)].string));
                  }
    break;

  case 203:
#line 769 "p.y"
    { addhtpasswdentry(htpasswd_file, (yyvsp[(1) - (1)].string), digesttype);
                           FREE((yyvsp[(1) - (1)].string)); }
    break;

  case 204:
#line 773 "p.y"
    { (yyval.number) = FALSE; }
    break;

  case 205:
#line 774 "p.y"
    { (yyval.number) = TRUE; }
    break;

  case 206:
#line 777 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_PROCESS, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_process);
                  }
    break;

  case 207:
#line 781 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_PROCESS, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_process);
                  }
    break;

  case 208:
#line 787 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string)); 
                    createservice(TYPE_FILE, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_file);
                  }
    break;

  case 209:
#line 793 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_FILESYSTEM, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_filesystem);
                  }
    break;

  case 210:
#line 799 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_DIRECTORY, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_directory);
                  }
    break;

  case 211:
#line 805 "p.y"
    {
                    check_hostname((yyvsp[(4) - (4)].string)); 
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_HOST, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_remote_host);
                  }
    break;

  case 212:
#line 812 "p.y"
    {
                    check_name((yyvsp[(2) - (2)].string));
                    createservice(TYPE_SYSTEM, (yyvsp[(2) - (2)].string), xstrdup(""), check_system);
                    hassystem = TRUE;
                  }
    break;

  case 213:
#line 819 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_FIFO, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_fifo);
                  }
    break;

  case 214:
#line 825 "p.y"
    {
                    check_name((yyvsp[(2) - (4)].string));
                    createservice(TYPE_STATUS, (yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].string), check_status);
                  }
    break;

  case 215:
#line 831 "p.y"
    {
                    addcommand(START, (yyvsp[(3) - (3)].number));
                  }
    break;

  case 216:
#line 834 "p.y"
    {
                    addcommand(START, (yyvsp[(4) - (4)].number));
                  }
    break;

  case 217:
#line 839 "p.y"
    {
                    addcommand(STOP, (yyvsp[(3) - (3)].number));
                  }
    break;

  case 218:
#line 842 "p.y"
    {
                    addcommand(STOP, (yyvsp[(4) - (4)].number));
                  }
    break;

  case 223:
#line 855 "p.y"
    { addargument((yyvsp[(1) - (1)].string)); }
    break;

  case 224:
#line 856 "p.y"
    { addargument((yyvsp[(1) - (1)].string)); }
    break;

  case 225:
#line 859 "p.y"
    { addeuid( get_uid((yyvsp[(2) - (2)].string), 0) ); FREE((yyvsp[(2) - (2)].string)); }
    break;

  case 226:
#line 860 "p.y"
    { addegid( get_gid((yyvsp[(2) - (2)].string), 0) ); FREE((yyvsp[(2) - (2)].string)); }
    break;

  case 227:
#line 861 "p.y"
    { addeuid( get_uid(NULL, (yyvsp[(2) - (2)].number)) ); }
    break;

  case 228:
#line 862 "p.y"
    { addegid( get_gid(NULL, (yyvsp[(2) - (2)].number)) ); }
    break;

  case 229:
#line 865 "p.y"
    { (yyval.string) = NULL; }
    break;

  case 230:
#line 866 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 231:
#line 867 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 232:
#line 870 "p.y"
    { (yyval.string) = NULL; }
    break;

  case 233:
#line 871 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 234:
#line 874 "p.y"
    { (yyval.string) = NULL; }
    break;

  case 235:
#line 875 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 236:
#line 879 "p.y"
    {
                    portset.timeout = (yyvsp[(7) - (11)].number);
                    addeventaction(&(portset).action, (yyvsp[(10) - (11)].number), (yyvsp[(11) - (11)].number));
                    addport(&portset);
                  }
    break;

  case 237:
#line 885 "p.y"
    { 
                    prepare_urlrequest((yyvsp[(4) - (10)].url));
                    portset.timeout = (yyvsp[(6) - (10)].number);
                    addeventaction(&(portset).action, (yyvsp[(9) - (10)].number), (yyvsp[(10) - (10)].number));
                    addport(&portset);
                  }
    break;

  case 238:
#line 894 "p.y"
    {
                   portset.timeout = (yyvsp[(6) - (10)].number);
                   addeventaction(&(portset).action, (yyvsp[(9) - (10)].number), (yyvsp[(10) - (10)].number));
                   addport(&portset);
                  }
    break;

  case 239:
#line 902 "p.y"
    {
                   icmpset.type = (yyvsp[(4) - (10)].number);
                   icmpset.count = (yyvsp[(5) - (10)].number);
                   icmpset.timeout = (yyvsp[(6) - (10)].number);
                   addeventaction(&(icmpset).action, (yyvsp[(9) - (10)].number), (yyvsp[(10) - (10)].number));
                   addicmp(&icmpset);
                  }
    break;

  case 240:
#line 911 "p.y"
    {
                    if (current->type == TYPE_HOST)
                      portset.hostname = xstrdup(current->path);
                    else
                      portset.hostname = xstrdup(LOCALHOST);
                  }
    break;

  case 241:
#line 917 "p.y"
    { check_hostname((yyvsp[(2) - (2)].string)); portset.hostname = (yyvsp[(2) - (2)].string); }
    break;

  case 242:
#line 920 "p.y"
    { portset.port = (yyvsp[(2) - (2)].number); portset.family = AF_INET; }
    break;

  case 243:
#line 923 "p.y"
    {
                    portset.pathname = (yyvsp[(2) - (2)].string); portset.family = AF_UNIX;
                  }
    break;

  case 244:
#line 928 "p.y"
    {
                    portset.type = SOCK_STREAM;
                  }
    break;

  case 245:
#line 931 "p.y"
    {
                    portset.type = SOCK_STREAM;
                  }
    break;

  case 246:
#line 934 "p.y"
    {
                    portset.type = SOCK_STREAM;
                    portset.SSL.use_ssl = TRUE;
                    portset.SSL.version = (yyvsp[(3) - (4)].number);
                    if (portset.SSL.version == SSL_VERSION_NONE)
                      portset.SSL.version = SSL_VERSION_AUTO;
                    portset.SSL.certmd5 = (yyvsp[(4) - (4)].string);
                  }
    break;

  case 247:
#line 942 "p.y"
    {
                    portset.type = SOCK_DGRAM;
                  }
    break;

  case 248:
#line 947 "p.y"
    { (yyval.string) = NULL; }
    break;

  case 249:
#line 948 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 250:
#line 951 "p.y"
    { (yyval.number) = SSL_VERSION_NONE; }
    break;

  case 251:
#line 952 "p.y"
    { (yyval.number) = SSL_VERSION_SSLV2; }
    break;

  case 252:
#line 953 "p.y"
    { (yyval.number) = SSL_VERSION_SSLV3; }
    break;

  case 253:
#line 954 "p.y"
    { (yyval.number) = SSL_VERSION_TLS; }
    break;

  case 254:
#line 955 "p.y"
    { (yyval.number) = SSL_VERSION_AUTO; }
    break;

  case 255:
#line 958 "p.y"
    {
                    portset.protocol = addprotocol(P_DEFAULT);
                  }
    break;

  case 256:
#line 961 "p.y"
    {
                    portset.protocol = addprotocol(P_APACHESTATUS);
                  }
    break;

  case 257:
#line 964 "p.y"
    {
                    portset.protocol = addprotocol(P_DEFAULT);
                  }
    break;

  case 258:
#line 967 "p.y"
    {
                    portset.protocol = addprotocol(P_DNS);
                  }
    break;

  case 259:
#line 970 "p.y"
    {
                    portset.protocol = addprotocol(P_DWP);
                  }
    break;

  case 260:
#line 973 "p.y"
    {
                    portset.protocol = addprotocol(P_FTP);
                  }
    break;

  case 261:
#line 976 "p.y"
    {
                    portset.protocol = addprotocol(P_HTTP);
                  }
    break;

  case 262:
#line 979 "p.y"
    {
                    portset.protocol = addprotocol(P_IMAP);
                  }
    break;

  case 263:
#line 982 "p.y"
    {
                    portset.protocol = addprotocol(P_CLAMAV);
                  }
    break;

  case 264:
#line 985 "p.y"
    {
                    portset.protocol = addprotocol(P_LDAP2);
                  }
    break;

  case 265:
#line 988 "p.y"
    {
                    portset.protocol = addprotocol(P_LDAP3);
                  }
    break;

  case 266:
#line 991 "p.y"
    {
                    portset.protocol = addprotocol(P_MYSQL);
                  }
    break;

  case 267:
#line 994 "p.y"
    {
                    portset.protocol = addprotocol(P_SIP);
                  }
    break;

  case 268:
#line 997 "p.y"
    {
                    portset.protocol = addprotocol(P_NNTP);
                  }
    break;

  case 269:
#line 1000 "p.y"
    {
                    portset.protocol = addprotocol(P_NTP3);
                    portset.type = SOCK_DGRAM;
                  }
    break;

  case 270:
#line 1004 "p.y"
    {
                    portset.protocol = addprotocol(P_POSTFIXPOLICY);
                  }
    break;

  case 271:
#line 1007 "p.y"
    {
                    portset.protocol = addprotocol(P_POP);
                  }
    break;

  case 272:
#line 1010 "p.y"
    {
                    portset.protocol = addprotocol(P_SMTP);
                  }
    break;

  case 273:
#line 1013 "p.y"
    {
                    portset.protocol = addprotocol(P_SSH);
                  }
    break;

  case 274:
#line 1016 "p.y"
    {
                    portset.protocol = addprotocol(P_RDATE);
                  }
    break;

  case 275:
#line 1019 "p.y"
    {
                    portset.protocol = addprotocol(P_RSYNC);
                  }
    break;

  case 276:
#line 1022 "p.y"
    {
                    portset.protocol = addprotocol(P_TNS);
                  }
    break;

  case 277:
#line 1025 "p.y"
    {
                    portset.protocol = addprotocol(P_PGSQL);
                  }
    break;

  case 278:
#line 1028 "p.y"
    {
                    portset.protocol = addprotocol(P_LMTP);
                  }
    break;

  case 279:
#line 1031 "p.y"
    {
                    portset.protocol = addprotocol(P_GENERIC);
                  }
    break;

  case 282:
#line 1040 "p.y"
    { addgeneric(&portset, (yyvsp[(2) - (2)].string), NULL); FREE((yyvsp[(2) - (2)].string));}
    break;

  case 283:
#line 1041 "p.y"
    { addgeneric(&portset, NULL, (yyvsp[(2) - (2)].string)); FREE((yyvsp[(2) - (2)].string));}
    break;

  case 285:
#line 1045 "p.y"
    {
                    portset.request = (yyvsp[(2) - (2)].string);
                  }
    break;

  case 286:
#line 1048 "p.y"
    {
                    portset.request = (yyvsp[(2) - (2)].string);
                  }
    break;

  case 288:
#line 1054 "p.y"
    {
                     portset.maxforward = verifyMaxForward((yyvsp[(2) - (2)].number)); 
                   }
    break;

  case 290:
#line 1060 "p.y"
    { 
                    portset.request = Util_urlEncode((yyvsp[(2) - (2)].string)); 
                    FREE((yyvsp[(2) - (2)].string)); 
                  }
    break;

  case 291:
#line 1064 "p.y"
    {
                    portset.request = Util_urlEncode((yyvsp[(2) - (4)].string));
                    FREE((yyvsp[(2) - (4)].string));
                    portset.request_checksum = (yyvsp[(4) - (4)].string);
                  }
    break;

  case 294:
#line 1075 "p.y"
    { 
                    portset.ApacheStatus.loglimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.loglimit = (int)(yyvsp[(3) - (4)].number); 
                  }
    break;

  case 295:
#line 1079 "p.y"
    { 
                    portset.ApacheStatus.closelimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.closelimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 296:
#line 1083 "p.y"
    { 
                    portset.ApacheStatus.dnslimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.dnslimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 297:
#line 1087 "p.y"
    { 
                    portset.ApacheStatus.keepalivelimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.keepalivelimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 298:
#line 1091 "p.y"
    { 
                    portset.ApacheStatus.replylimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.replylimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 299:
#line 1095 "p.y"
    { 
                    portset.ApacheStatus.requestlimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.requestlimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 300:
#line 1099 "p.y"
    { 
                    portset.ApacheStatus.startlimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.startlimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 301:
#line 1103 "p.y"
    { 
                    portset.ApacheStatus.waitlimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.waitlimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 302:
#line 1107 "p.y"
    { 
                    portset.ApacheStatus.gracefullimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.gracefullimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 303:
#line 1111 "p.y"
    { 
                    portset.ApacheStatus.cleanuplimitOP = (yyvsp[(2) - (4)].number); 
                    portset.ApacheStatus.cleanuplimit = (int)((yyvsp[(3) - (4)].number)); 
                  }
    break;

  case 304:
#line 1117 "p.y"
    {
                    seteventaction(&(current)->action_PID, (yyvsp[(6) - (6)].number), ACTION_IGNORE);
                  }
    break;

  case 305:
#line 1122 "p.y"
    {
                    seteventaction(&(current)->action_PPID, (yyvsp[(6) - (6)].number), ACTION_IGNORE);
                  }
    break;

  case 306:
#line 1127 "p.y"
    {
                   (yyval.number) = ICMP_ATTEMPT_COUNT;
                  }
    break;

  case 307:
#line 1130 "p.y"
    {    
                   (yyval.number) = (yyvsp[(2) - (2)].number);
                  }
    break;

  case 308:
#line 1135 "p.y"
    {
                   (yyval.number) = EXEC_TIMEOUT;
                  }
    break;

  case 309:
#line 1138 "p.y"
    {
                   (yyval.number) = (yyvsp[(2) - (3)].number);
                  }
    break;

  case 310:
#line 1143 "p.y"
    {
                   (yyval.number) = NET_TIMEOUT;
                  }
    break;

  case 311:
#line 1146 "p.y"
    {
                   (yyval.number) = (yyvsp[(2) - (3)].number);
                  }
    break;

  case 312:
#line 1151 "p.y"
    {
                   check_timeout((yyvsp[(2) - (7)].number), (yyvsp[(4) - (7)].number));
                   current->def_timeout = TRUE;
                   current->to_start = (yyvsp[(2) - (7)].number);
                   current->to_cycle = (yyvsp[(4) - (7)].number);
                 }
    break;

  case 314:
#line 1160 "p.y"
    {
                    seturlrequest((yyvsp[(2) - (3)].number), (yyvsp[(3) - (3)].string));
                    FREE((yyvsp[(3) - (3)].string));
                  }
    break;

  case 315:
#line 1166 "p.y"
    { (yyval.number) = OPERATOR_EQUAL; }
    break;

  case 316:
#line 1167 "p.y"
    { (yyval.number) = OPERATOR_NOTEQUAL; }
    break;

  case 317:
#line 1170 "p.y"
    {
                   addmail((yyvsp[(1) - (6)].string), &mailset, &current->maillist, eventset, (yyvsp[(6) - (6)].number));
                  }
    break;

  case 318:
#line 1173 "p.y"
    {
                   addmail((yyvsp[(1) - (3)].string), &mailset, &current->maillist, EVENT_ALL, (yyvsp[(3) - (3)].number));
                  }
    break;

  case 319:
#line 1176 "p.y"
    {
                   addmail((yyvsp[(1) - (7)].string), &mailset, &current->maillist, ~eventset, (yyvsp[(7) - (7)].number));
                  }
    break;

  case 320:
#line 1179 "p.y"
    {
                   addmail((yyvsp[(1) - (1)].string), &mailset, &current->maillist, EVENT_NULL, 0);
                  }
    break;

  case 321:
#line 1184 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 322:
#line 1187 "p.y"
    { (yyval.string) = (yyvsp[(2) - (2)].string); }
    break;

  case 325:
#line 1194 "p.y"
    { eventset |= EVENT_ACTION; }
    break;

  case 326:
#line 1195 "p.y"
    { eventset |= EVENT_CHECKSUM; }
    break;

  case 327:
#line 1196 "p.y"
    { eventset |= EVENT_CONNECTION; }
    break;

  case 328:
#line 1197 "p.y"
    { eventset |= EVENT_CONTENT; }
    break;

  case 329:
#line 1198 "p.y"
    { eventset |= EVENT_DATA; }
    break;

  case 330:
#line 1199 "p.y"
    { eventset |= EVENT_EXEC; }
    break;

  case 331:
#line 1200 "p.y"
    { eventset |= EVENT_FSFLAG; }
    break;

  case 332:
#line 1201 "p.y"
    { eventset |= EVENT_GID; }
    break;

  case 333:
#line 1202 "p.y"
    { eventset |= EVENT_ICMP; }
    break;

  case 334:
#line 1203 "p.y"
    { eventset |= EVENT_INSTANCE; }
    break;

  case 335:
#line 1204 "p.y"
    { eventset |= EVENT_INVALID; }
    break;

  case 336:
#line 1205 "p.y"
    { eventset |= EVENT_NONEXIST; }
    break;

  case 337:
#line 1206 "p.y"
    { eventset |= EVENT_PERMISSION; }
    break;

  case 338:
#line 1207 "p.y"
    { eventset |= EVENT_PID; }
    break;

  case 339:
#line 1208 "p.y"
    { eventset |= EVENT_PPID; }
    break;

  case 340:
#line 1209 "p.y"
    { eventset |= EVENT_RESOURCE; }
    break;

  case 341:
#line 1210 "p.y"
    { eventset |= EVENT_SIZE; }
    break;

  case 342:
#line 1211 "p.y"
    { eventset |= EVENT_TIMEOUT; }
    break;

  case 343:
#line 1212 "p.y"
    { eventset |= EVENT_TIMESTAMP; }
    break;

  case 344:
#line 1213 "p.y"
    { eventset |= EVENT_UID; }
    break;

  case 349:
#line 1224 "p.y"
    { mailset.from = (yyvsp[(1) - (1)].string); }
    break;

  case 350:
#line 1225 "p.y"
    { mailset.subject = (yyvsp[(1) - (1)].string); }
    break;

  case 351:
#line 1226 "p.y"
    { mailset.message = (yyvsp[(1) - (1)].string); }
    break;

  case 352:
#line 1229 "p.y"
    {
                   check_every((yyvsp[(2) - (3)].number));
                   current->def_every = TRUE;
                   current->every = (yyvsp[(2) - (3)].number);
                 }
    break;

  case 353:
#line 1236 "p.y"
    {
                    current->mode = MODE_ACTIVE;
                  }
    break;

  case 354:
#line 1239 "p.y"
    {
                    current->mode = MODE_PASSIVE;
                  }
    break;

  case 355:
#line 1242 "p.y"
    {
                    current->mode = MODE_MANUAL;
                    current->monitor = MONITOR_NOT;
                  }
    break;

  case 356:
#line 1248 "p.y"
    { current->group = (yyvsp[(2) - (2)].string); }
    break;

  case 360:
#line 1259 "p.y"
    { adddependant((yyvsp[(1) - (1)].string)); }
    break;

  case 361:
#line 1262 "p.y"
    {
                     addeventaction(&(resourceset).action, (yyvsp[(5) - (6)].number), (yyvsp[(6) - (6)].number));
                     addresource(&resourceset);
                   }
    break;

  case 368:
#line 1278 "p.y"
    {
                     addeventaction(&(resourceset).action, (yyvsp[(5) - (6)].number), (yyvsp[(6) - (6)].number));
                     addresource(&resourceset);
                   }
    break;

  case 374:
#line 1293 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_CPU_PERCENT;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = ((yyvsp[(3) - (4)].number) * 10); 
                  }
    break;

  case 375:
#line 1298 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_TOTAL_CPU_PERCENT;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = ((yyvsp[(3) - (4)].number) * 10); 
                  }
    break;

  case 376:
#line 1305 "p.y"
    {
                    resourceset.resource_id = (yyvsp[(1) - (4)].number);
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = ((yyvsp[(3) - (4)].number) * 10); 
                  }
    break;

  case 377:
#line 1312 "p.y"
    { (yyval.number) = RESOURCE_ID_CPUUSER; }
    break;

  case 378:
#line 1313 "p.y"
    { (yyval.number) = RESOURCE_ID_CPUSYSTEM; }
    break;

  case 379:
#line 1314 "p.y"
    { (yyval.number) = RESOURCE_ID_CPUWAIT; }
    break;

  case 380:
#line 1317 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_MEM_KBYTE;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = (int) ((yyvsp[(3) - (4)].real) * ((yyvsp[(4) - (4)].number) / 1024.0)); 
                  }
    break;

  case 381:
#line 1322 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_MEM_PERCENT;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = ((yyvsp[(3) - (4)].number) * 10); 
                  }
    break;

  case 382:
#line 1327 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_TOTAL_MEM_KBYTE;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = (int) ((yyvsp[(3) - (4)].real) * ((yyvsp[(4) - (4)].number) / 1024.0));
                  }
    break;

  case 383:
#line 1332 "p.y"
    {
                    resourceset.resource_id = RESOURCE_ID_TOTAL_MEM_PERCENT;
                    resourceset.operator = (yyvsp[(2) - (4)].number);
                    resourceset.limit = ((yyvsp[(3) - (4)].number) * 10);
                  }
    break;

  case 384:
#line 1339 "p.y"
    { 
                    resourceset.resource_id = RESOURCE_ID_CHILDREN;
                    resourceset.operator = (yyvsp[(2) - (3)].number);
                    resourceset.limit = (int) (yyvsp[(3) - (3)].number); 
                  }
    break;

  case 385:
#line 1346 "p.y"
    { 
                    resourceset.resource_id = (yyvsp[(1) - (3)].number);
                    resourceset.operator = (yyvsp[(2) - (3)].number);
                    resourceset.limit = (int) ((yyvsp[(3) - (3)].real) * 10.0); 
                  }
    break;

  case 386:
#line 1353 "p.y"
    { (yyval.number) = RESOURCE_ID_LOAD1; }
    break;

  case 387:
#line 1354 "p.y"
    { (yyval.number) = RESOURCE_ID_LOAD5; }
    break;

  case 388:
#line 1355 "p.y"
    { (yyval.number) = RESOURCE_ID_LOAD15; }
    break;

  case 389:
#line 1358 "p.y"
    { (yyval.real) = (yyvsp[(1) - (1)].real); }
    break;

  case 390:
#line 1359 "p.y"
    { (yyval.real) = (float) (yyvsp[(1) - (1)].number); }
    break;

  case 391:
#line 1363 "p.y"
    {
                    timestampset.operator = (yyvsp[(3) - (9)].number);
                    timestampset.time = ((yyvsp[(4) - (9)].number) * (yyvsp[(5) - (9)].number));
                    addeventaction(&(timestampset).action, (yyvsp[(8) - (9)].number), (yyvsp[(9) - (9)].number));
                    addtimestamp(&timestampset, FALSE);
                  }
    break;

  case 392:
#line 1369 "p.y"
    {
                    timestampset.test_changes = TRUE;
                    addeventaction(&(timestampset).action, (yyvsp[(6) - (6)].number), ACTION_IGNORE);
                    addtimestamp(&timestampset, TRUE);
                  }
    break;

  case 393:
#line 1376 "p.y"
    { (yyval.number) = OPERATOR_EQUAL; }
    break;

  case 394:
#line 1377 "p.y"
    { (yyval.number) = OPERATOR_GREATER; }
    break;

  case 395:
#line 1378 "p.y"
    { (yyval.number) = OPERATOR_LESS; }
    break;

  case 396:
#line 1379 "p.y"
    { (yyval.number) = OPERATOR_EQUAL; }
    break;

  case 397:
#line 1380 "p.y"
    { (yyval.number) = OPERATOR_NOTEQUAL; }
    break;

  case 398:
#line 1381 "p.y"
    { (yyval.number) = OPERATOR_NOTEQUAL; }
    break;

  case 399:
#line 1384 "p.y"
    { (yyval.number) = TIME_SECOND; }
    break;

  case 400:
#line 1385 "p.y"
    { (yyval.number) = TIME_SECOND; }
    break;

  case 401:
#line 1386 "p.y"
    { (yyval.number) = TIME_MINUTE; }
    break;

  case 402:
#line 1387 "p.y"
    { (yyval.number) = TIME_HOUR; }
    break;

  case 403:
#line 1388 "p.y"
    { (yyval.number) = TIME_DAY; }
    break;

  case 404:
#line 1391 "p.y"
    { (yyval.number) = ACTION_ALERT; }
    break;

  case 405:
#line 1392 "p.y"
    { (yyval.number) = ACTION_EXEC; }
    break;

  case 406:
#line 1393 "p.y"
    { (yyval.number) = ACTION_EXEC; }
    break;

  case 407:
#line 1394 "p.y"
    { (yyval.number) = ACTION_RESTART; }
    break;

  case 408:
#line 1395 "p.y"
    { (yyval.number) = ACTION_START; }
    break;

  case 409:
#line 1396 "p.y"
    { (yyval.number) = ACTION_STOP; }
    break;

  case 410:
#line 1397 "p.y"
    { (yyval.number) = ACTION_UNMONITOR; }
    break;

  case 411:
#line 1400 "p.y"
    {
                    (yyval.number) = (yyvsp[(1) - (1)].number);
                    if ((yyvsp[(1) - (1)].number) == ACTION_EXEC && command) {
                      command1 = command;
                      command = NULL;
                    }
                  }
    break;

  case 412:
#line 1409 "p.y"
    {
                    (yyval.number) = (yyvsp[(1) - (1)].number);
                    if ((yyvsp[(1) - (1)].number) == ACTION_EXEC && command) {
                      command2 = command;
                      command = NULL;
                    }
                  }
    break;

  case 414:
#line 1419 "p.y"
    {
                    rate1.count  = (yyvsp[(1) - (2)].number);
                    rate1.cycles = (yyvsp[(1) - (2)].number);
                    if (rate1.cycles < 1 || rate1.cycles > BITMAP_MAX)
                      yyerror2("the number of cycles must be between 1 and %d", BITMAP_MAX);
                  }
    break;

  case 415:
#line 1425 "p.y"
    {
                    rate1.count  = (yyvsp[(1) - (3)].number);
                    rate1.cycles = (yyvsp[(2) - (3)].number);
                    if (rate1.cycles < 1 || rate1.cycles > BITMAP_MAX)
                      yyerror2("the number of cycles must be between 1 and %d", BITMAP_MAX);
                    if (rate1.count < 1 || rate1.count > rate1.cycles)
                      yyerror2("the number of events must be bigger then 0 and less than poll cycles");
                  }
    break;

  case 417:
#line 1436 "p.y"
    {
                    rate2.count  = (yyvsp[(1) - (2)].number);
                    rate2.cycles = (yyvsp[(1) - (2)].number);
                    if (rate2.cycles < 1 || rate2.cycles > BITMAP_MAX)
                      yyerror2("the number of cycles must be between 1 and %d", BITMAP_MAX);
                  }
    break;

  case 418:
#line 1442 "p.y"
    {
                    rate2.count  = (yyvsp[(1) - (3)].number);
                    rate2.cycles = (yyvsp[(2) - (3)].number);
                    if (rate2.cycles < 1 || rate2.cycles > BITMAP_MAX)
                      yyerror2("the number of cycles must be between 1 and %d", BITMAP_MAX);
                    if (rate2.count < 1 || rate2.count > rate2.cycles)
                      yyerror2("the number of events must be bigger then 0 and less than poll cycles");
                  }
    break;

  case 419:
#line 1452 "p.y"
    {
                    (yyval.number) = ACTION_ALERT;
                  }
    break;

  case 420:
#line 1455 "p.y"
    {
                    (yyval.number) = (yyvsp[(6) - (6)].number);
                  }
    break;

  case 421:
#line 1458 "p.y"
    {
                    (yyval.number) = (yyvsp[(6) - (6)].number);
                  }
    break;

  case 422:
#line 1461 "p.y"
    {
                    (yyval.number) = (yyvsp[(6) - (6)].number);
                  }
    break;

  case 423:
#line 1466 "p.y"
    {
                    addeventaction(&(checksumset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    addchecksum(&checksumset);
                  }
    break;

  case 424:
#line 1471 "p.y"
    {
                    checksumset.hash = (yyvsp[(6) - (10)].string);
                    addeventaction(&(checksumset).action, (yyvsp[(9) - (10)].number), (yyvsp[(10) - (10)].number));
                    addchecksum(&checksumset);
                  }
    break;

  case 425:
#line 1476 "p.y"
    {
                    checksumset.test_changes = TRUE;
                    addeventaction(&(checksumset).action, (yyvsp[(7) - (7)].number), ACTION_IGNORE);
                    addchecksum(&checksumset);
                  }
    break;

  case 426:
#line 1482 "p.y"
    { checksumset.type = HASH_UNKNOWN; }
    break;

  case 427:
#line 1483 "p.y"
    { checksumset.type = HASH_MD5; }
    break;

  case 428:
#line 1484 "p.y"
    { checksumset.type = HASH_SHA1; }
    break;

  case 429:
#line 1487 "p.y"
    {
                    filesystemset.resource = RESOURCE_ID_INODE;
                    filesystemset.operator = (yyvsp[(3) - (8)].number);
                    filesystemset.limit_absolute = (yyvsp[(4) - (8)].number);
                    addeventaction(&(filesystemset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    addfilesystem(&filesystemset);
                  }
    break;

  case 430:
#line 1494 "p.y"
    {
                    filesystemset.resource = RESOURCE_ID_INODE;
                    filesystemset.operator = (yyvsp[(3) - (9)].number);
                    filesystemset.limit_percent = (int)((yyvsp[(4) - (9)].number) * 10);
                    addeventaction(&(filesystemset).action, (yyvsp[(8) - (9)].number), (yyvsp[(9) - (9)].number));
                    addfilesystem(&filesystemset);
                  }
    break;

  case 431:
#line 1503 "p.y"
    {
                    if (!filesystem_usage(current->inf, current->path))
                      yyerror2("cannot read usage of filesystem %s", current->path);
                    filesystemset.resource = RESOURCE_ID_SPACE;
                    filesystemset.operator = (yyvsp[(3) - (9)].number);
                    filesystemset.limit_absolute = (int)((float)(yyvsp[(4) - (9)].real) / (float)current->inf->f_bsize * (float)(yyvsp[(5) - (9)].number));
                    addeventaction(&(filesystemset).action, (yyvsp[(8) - (9)].number), (yyvsp[(9) - (9)].number));
                    addfilesystem(&filesystemset);
                  }
    break;

  case 432:
#line 1512 "p.y"
    {
                    filesystemset.resource = RESOURCE_ID_SPACE;
                    filesystemset.operator = (yyvsp[(3) - (9)].number);
                    filesystemset.limit_percent = (int)((yyvsp[(4) - (9)].number) * 10);
                    addeventaction(&(filesystemset).action, (yyvsp[(8) - (9)].number), (yyvsp[(9) - (9)].number));
                    addfilesystem(&filesystemset);
                  }
    break;

  case 433:
#line 1521 "p.y"
    {
                    seteventaction(&(current)->action_FSFLAG, (yyvsp[(6) - (6)].number), ACTION_IGNORE);
                  }
    break;

  case 434:
#line 1526 "p.y"
    { (yyval.number) = UNIT_BYTE; }
    break;

  case 435:
#line 1527 "p.y"
    { (yyval.number) = UNIT_BYTE; }
    break;

  case 436:
#line 1528 "p.y"
    { (yyval.number) = UNIT_KILOBYTE; }
    break;

  case 437:
#line 1529 "p.y"
    { (yyval.number) = UNIT_MEGABYTE; }
    break;

  case 438:
#line 1530 "p.y"
    { (yyval.number) = UNIT_GIGABYTE; }
    break;

  case 439:
#line 1533 "p.y"
    {
                    permset.perm = check_perm((yyvsp[(4) - (8)].number));
                    addeventaction(&(permset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    addperm(&permset);
                  }
    break;

  case 440:
#line 1540 "p.y"
    {
                    matchset.ignore = FALSE;
                    matchset.match_path = (yyvsp[(4) - (7)].string);
                    matchset.match_string = NULL;
                    addmatchpath(&matchset, (yyvsp[(7) - (7)].number));
                    FREE((yyvsp[(4) - (7)].string)); 
                  }
    break;

  case 441:
#line 1547 "p.y"
    {
                    matchset.ignore = FALSE;
                    matchset.match_path = NULL;
                    matchset.match_string = xstrdup((yyvsp[(4) - (7)].string));
                    addmatch(&matchset, (yyvsp[(7) - (7)].number), 0);
                  }
    break;

  case 442:
#line 1553 "p.y"
    {
                    matchset.ignore = TRUE;
                    matchset.match_path = (yyvsp[(4) - (4)].string);
                    matchset.match_string = NULL;
                    addmatchpath(&matchset, ACTION_IGNORE);
                    FREE((yyvsp[(4) - (4)].string)); 
                  }
    break;

  case 443:
#line 1560 "p.y"
    {
                    matchset.ignore = TRUE;
                    matchset.match_path = NULL;
                    matchset.match_string = xstrdup((yyvsp[(4) - (4)].string));
                    addmatch(&matchset, ACTION_IGNORE, 0);
                  }
    break;

  case 444:
#line 1568 "p.y"
    {
                    matchset.not = FALSE;
                  }
    break;

  case 445:
#line 1571 "p.y"
    {
                    matchset.not = TRUE;
                  }
    break;

  case 446:
#line 1577 "p.y"
    {
                    sizeset.operator = (yyvsp[(3) - (9)].number);
                    sizeset.size = ((unsigned long long)(yyvsp[(4) - (9)].number) * (yyvsp[(5) - (9)].number));
                    addeventaction(&(sizeset).action, (yyvsp[(8) - (9)].number), (yyvsp[(9) - (9)].number));
                    addsize(&sizeset);
                  }
    break;

  case 447:
#line 1583 "p.y"
    {
                    sizeset.test_changes = TRUE;
                    addeventaction(&(sizeset).action, (yyvsp[(6) - (6)].number), ACTION_IGNORE);
                    addsize(&sizeset);
                  }
    break;

  case 448:
#line 1590 "p.y"
    {
                    uidset.uid = get_uid((yyvsp[(4) - (8)].string), 0);
                    addeventaction(&(uidset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    adduid(&uidset);
                    FREE((yyvsp[(4) - (8)].string));
                  }
    break;

  case 449:
#line 1596 "p.y"
    {
                    uidset.uid = get_uid(NULL, (yyvsp[(4) - (8)].number));
                    addeventaction(&(uidset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    adduid(&uidset);
                  }
    break;

  case 450:
#line 1603 "p.y"
    {
                    gidset.gid = get_gid((yyvsp[(4) - (8)].string), 0);
                    addeventaction(&(gidset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    addgid(&gidset);
                    FREE((yyvsp[(4) - (8)].string));
                  }
    break;

  case 451:
#line 1609 "p.y"
    {
                    gidset.gid = get_gid(NULL, (yyvsp[(4) - (8)].number));
                    addeventaction(&(gidset).action, (yyvsp[(7) - (8)].number), (yyvsp[(8) - (8)].number));
                    addgid(&gidset);
                  }
    break;

  case 452:
#line 1616 "p.y"
    { (yyval.number) = ICMP_ECHO; }
    break;

  case 453:
#line 1619 "p.y"
    { (yyval.number) = 0; }
    break;

  case 454:
#line 1620 "p.y"
    { (yyval.number) = (yyvsp[(2) - (2)].number); }
    break;

  case 455:
#line 1621 "p.y"
    { (yyval.number) = (yyvsp[(2) - (3)].number); }
    break;


/* Line 1267 of yacc.c.  */
#line 4662 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 1624 "p.y"



/* -------------------------------------------------------- Parser interface */


/**
 * Syntactic error routine
 *
 * This routine is automatically called by the lexer!
 */
void yyerror(const char *s, ...) {
  
  long len;
  va_list ap;
  char *msg = NULL;

  ASSERT(s);
  
  va_start(ap,s);
  msg = Util_formatString(s, ap, &len);
  va_end(ap);
  
  LogError("%s:%i: Error: %s '%s'\n", currentfile, lineno, msg, yytext);
  cfg_errflag++;
 
  FREE(msg);
  
}

/**
 * Syntactical warning routine
 */
void yywarning(const char *s, ...) {
  
  long len;
  va_list ap;
  char *msg = NULL;

  ASSERT(s);
  
  va_start(ap,s);
  msg = Util_formatString(s, ap, &len);
  va_end(ap);
  
  LogWarning("%s:%i: Warning: %s '%s'\n", currentfile, lineno, msg, yytext);
 
  FREE(msg);
  
}

/**
 * Argument error routine
 */
void yyerror2(const char *s, ...) {
  
  long len;
  va_list ap;
  char *msg = NULL;

  ASSERT(s);
  
  va_start(ap,s);
  msg = Util_formatString(s, ap, &len);
  va_end(ap);
  
  LogError("%s:%i: Error: %s '%s'\n", argcurrentfile, arglineno, msg, argyytext);
  cfg_errflag++;
 
  FREE(msg);
  
}

/**
 * Argument warning routine
 */
void yywarning2(const char *s, ...) {
  
  long len;
  va_list ap;
  char *msg = NULL;

  ASSERT(s);
  
  va_start(ap,s);
  msg = Util_formatString(s, ap, &len);
  va_end(ap);
  
  LogWarning("%s:%i: Warning: %s '%s'\n", argcurrentfile, arglineno, msg, argyytext);
 
  FREE(msg);
  
}

/*
 * The Parser hook - start parsing the control file
 * Returns TRUE if parsing succeeded, otherwise FALSE
 */
int parse(char *controlfile) {

  ASSERT(controlfile);

  servicelist = tail = current = NULL;

  /*
   * Secure check the monitrc file. The run control file must have the
   * same uid as the REAL uid of this process, it must have permissions
   * no greater than 700 and it must not be a symbolic link.
   */
  if (! File_checkStat(controlfile, "control file", S_IRUSR|S_IWUSR|S_IXUSR))
    return FALSE;

  if ((yyin = fopen(controlfile,"r")) == (FILE *)NULL) {
    LogError("%s: Error: cannot open the control file '%s' -- %s\n", prog, controlfile, STRERROR);
    return FALSE;
  }

  currentfile = xstrdup(controlfile);

  /* 
   * Creation of the global service list is synchronized  
   */
  LOCK(Run.mutex)
    preparse();
    yyparse();
    fclose(yyin);
    /* Add the default general system service if not specified explicitly */
    if (!hassystem)
      createservice(TYPE_SYSTEM, xstrdup(Run.localhostname), xstrdup(""), check_system);
    /* If defined - add the last service to the service list */
    if (current) {
      addservice(current);
      FREE(current);
    }
    postparse();
  END_LOCK;

  FREE(currentfile);

  if (argyytext != NULL)
    FREE(argyytext);

  return(cfg_errflag == 0);
}


/* ----------------------------------------------------------------- Private */


/**
 * Initialize objects used by the parser.
 */
static void preparse() {
  int i;
  char localhost[STRLEN];

  /*
   * Get the localhost name
   */
  if (gethostname(localhost, sizeof(localhost)) < 0)
    snprintf(localhost, STRLEN, "%s", LOCALHOST);

  /* Set instance incarnation ID */
  time(&Run.incarnation);
  /* Reset lexer */
  buffer_stack_ptr       = 0;
  lineno                 = 1;
  arglineno              = 1;
  argcurrentfile         = NULL;
  argyytext              = NULL;
  /* Reset parser */
  Run.stopped            = FALSE;
  Run.dolog              = FALSE;
  Run.dohttpd            = FALSE;
  Run.doaction           = FALSE;
  Run.httpdsig           = TRUE;
  Run.credentials        = NULL;
  Run.httpdssl           = FALSE;
  Run.httpsslpem         = NULL;
  Run.httpsslclientpem   = NULL;
  Run.clientssl          = FALSE;
  Run.mailserver_timeout = NET_TIMEOUT;
  Run.bind_addr          = NULL;
  Run.eventlist          = NULL;
  Run.eventlist_dir      = NULL;
  Run.eventlist_slots    = -1;
  Run.system             = NULL;
  Run.expectbuffer       = STRLEN;
  Run.maillist           = NULL;
  Run.mailservers        = NULL;
  Run.MailFormat.from    = NULL;
  Run.MailFormat.subject = NULL;
  Run.MailFormat.message = NULL;
  Run.localhostname      = xstrdup(localhost);
  depend_list            = NULL;
  Run.handler_init       = TRUE;
  for (i = 0; i <= HANDLER_MAX; i++)
    Run.handler_queue[i] = 0;
  /* 
   * Initialize objects
   */
  reset_uidset();
  reset_gidset();
  reset_sizeset();
  reset_mailset();
  reset_mailserverset();
  reset_portset();
  reset_permset();
  reset_icmpset();
  reset_rateset();
  reset_filesystemset();
  reset_resourceset();
  reset_checksumset();
  reset_timestampset();
}


/*
 * Check that values are reasonable after parsing
 */
static void postparse() {
  Service_T s;

  if (cfg_errflag || ! servicelist)
    return;

  /* Check the sanity of any dependency graph */
  check_depend();

  /* Check that we do not start monit in daemon mode without having a
   * poll time */
  if (!Run.polltime && (Run.isdaemon || Run.init)) {
    LogError("%s: Error: Poll time not defined. Please define poll time in the\n control file or use the -d option when starting monit\n", prog);
    cfg_errflag++;
  }

  if (Run.logfile)
    Run.dolog = TRUE;

  for (s = servicelist; s; s = s->next) {
    /* Set the general system service shortcut */
    if (s->type == TYPE_SYSTEM)
      Run.system = s;
    if (s->type != TYPE_HOST)
	continue;
    /* Verify that a remote service has a port or an icmp list */
    if (!s->portlist && !s->icmplist) {
      LogError("%s: Error: 'check host' statement is incomplete; Please specify a port number to test\n or an icmp test at the remote host: '%s'\n", prog, s->name);
      cfg_errflag++;
    }
  }
}


/*
 * Create a new service object and add any current objects to the
 * service list.
 */
static void createservice(int type, char *name, char *value, int (*check)(Service_T s)) {

  ASSERT(name);
  ASSERT(value);

  if (current)
    addservice(current);
  else
    NEW(current);

  /* Reset the current object */
  memset(current, 0, sizeof(*current));

  NEW(current->inf);
  Util_resetInfo(current);

  /* Set default values */
  current->monitor = MONITOR_INIT;
  current->mode    = MODE_ACTIVE;
  current->name    = name;
  current->type    = type;
  current->check   = check;
  current->path    = value;

  /* Initialize general event handlers */
  addeventaction(&(current)->action_DATA,     ACTION_ALERT,     ACTION_ALERT);
  addeventaction(&(current)->action_EXEC,     ACTION_ALERT,     ACTION_ALERT);
  addeventaction(&(current)->action_INVALID,  ACTION_RESTART,   ACTION_ALERT);
  addeventaction(&(current)->action_NONEXIST, ACTION_RESTART,   ACTION_ALERT);
  addeventaction(&(current)->action_TIMEOUT,  ACTION_UNMONITOR, ACTION_ALERT);
  addeventaction(&(current)->action_PID,      ACTION_ALERT,     ACTION_IGNORE);
  addeventaction(&(current)->action_PPID,     ACTION_ALERT,     ACTION_IGNORE);
  addeventaction(&(current)->action_FSFLAG,   ACTION_ALERT,     ACTION_IGNORE);

  /* Initialize internal event handlers */
  addeventaction(&(current)->action_MONIT_START,  ACTION_START, ACTION_IGNORE);
  addeventaction(&(current)->action_MONIT_STOP,   ACTION_STOP,  ACTION_IGNORE);
  addeventaction(&(current)->action_MONIT_RELOAD, ACTION_START, ACTION_IGNORE);
  addeventaction(&(current)->action_ACTION,       ACTION_ALERT, ACTION_IGNORE);
  
  pthread_mutex_init(&current->mutex, NULL);

  gettimeofday(&current->collected, NULL);

}


/*
 * Add a service object to the servicelist
 */
static void addservice(Service_T s) {
  Service_T n;

  ASSERT(s);
 
  NEW(n);
  memcpy(n, s, sizeof(*s));
  /* Add the service to the end of the service list */
  if (tail != NULL) {
    tail->next = n;
    tail->next_conf = n;
  } else {
    servicelist = n;
    servicelist_conf = n;
  }
  tail = n;
}


/* 
 * Add a dependant entry to the current service dependant list
 *
 */
static void adddependant(char *dependant) {
  Dependant_T d; 

  ASSERT(dependant);
  
  NEW(d);
  
  if (current->dependantlist != NULL)
    d->next = current->dependantlist;

  d->dependant = dependant;
  current->dependantlist = d;

}


/*
 * Add the given mailaddress with the apropriate alert notification
 * values and mail attributes to the given mailinglist.
 */
static void addmail(char *mailto, Mail_T f, Mail_T *l, unsigned int events, unsigned int reminder) {
  Mail_T m;

  ASSERT(mailto);

  NEW(m);
  m->events   = events;
  m->to       = mailto;
  m->from     = f->from;
  m->subject  = f->subject;
  m->message  = f->message;
  m->reminder = reminder;
  
  m->next = *l;
  *l = m;

  reset_mailset();
}


/*
 * Add the given portset to the current service's portlist
 */
static void addport(Port_T port) {
  Port_T p;
  char address[STRLEN];
  
  ASSERT(port);

  NEW(p);
  p->port             = port->port;
  p->type             = port->type;
  p->socket           = port->socket;
  p->family           = port->family;
  p->action           = port->action;
  p->timeout          = port->timeout;
  p->request          = port->request;
  p->generic          = port->generic;
  p->protocol         = port->protocol;
  p->pathname         = port->pathname;
  p->hostname         = port->hostname;
  p->url_request      = port->url_request;
  p->request_checksum = port->request_checksum;
  memcpy(&p->ApacheStatus, &port->ApacheStatus, sizeof(struct apache_status));

  if (p->request_checksum) {
    cleanup_hash_string(p->request_checksum);
    if (strlen(p->request_checksum) == 32)
      p->request_hashtype = HASH_MD5;
    else if (strlen(p->request_checksum) == 40)
      p->request_hashtype = HASH_SHA1;
    else
      yyerror2("invalid checksum [%s]", p->request_checksum);
  } else
    p->request_hashtype = 0;

  if (port->family == AF_INET)
    snprintf(address, STRLEN, "INET[%s:%d]", port->hostname, port->port);
  else if (port->family == AF_UNIX)
    snprintf(address, STRLEN, "UNIX[%s]", port->pathname);
  else
    address[0] = 0;
  p->address = xstrdup(address);
  
  if (port->SSL.use_ssl == TRUE) {
    if (!have_ssl()) {
      yyerror("ssl check cannot be activated. SSL is not supported");
    } else {
      if (port->SSL.certmd5 != NULL) {
	p->SSL.certmd5 = port->SSL.certmd5;
	cleanup_hash_string(p->SSL.certmd5);
      }
      p->SSL.use_ssl = TRUE;
      p->SSL.version = port->SSL.version;
    }
  }
  p->maxforward = port->maxforward;
  p->next = current->portlist;
  current->portlist = p;
  
  reset_portset();

}


/*
 * Add a new resource object to the current service resource list
 */
static void addresource(Resource_T rr) {
  Resource_T r;

  ASSERT(rr);

  NEW(r);
  if (! Run.doprocess)
    yyerror("Cannot activate service check. The process status engine was disabled. On certain systems you must run monit as root to utilize this feature)\n");
  r->resource_id = rr->resource_id;
  r->limit       = rr->limit;
  r->action      = rr->action;
  r->operator    = rr->operator;
  r->next        = current->resourcelist;

  current->resourcelist = r;
  reset_resourceset();
}


/*
 * Add a new file object to the current service timestamp list
 */
static void addtimestamp(Timestamp_T ts, int notime) {
  Timestamp_T t;

  ASSERT(ts);

  NEW(t);
  t->operator     = ts->operator;
  t->time         = ts->time;
  t->action       = ts->action;
  t->test_changes = ts->test_changes;
  
  if (t->test_changes || notime) {
    if (! File_exist(current->path)) {
      DEBUG("%s: Debug: the path '%s' used in the TIMESTAMP statement refer to a non-existing object\n", prog, current->path);
    } else if (!(t->timestamp = File_getTimestamp(current->path, S_IFDIR|S_IFREG))) {
      yyerror2("cannot get the timestamp for '%s'", current->path);
    }
  }
  
  t->next = current->timestamplist;
  current->timestamplist = t;

  reset_timestampset();

}


/*
 * Add a new Size object to the current service size list
 */
static void addsize(Size_T ss) {
  Size_T s;
  struct stat buf;

  ASSERT(ss);

  NEW(s);
  s->operator     = ss->operator;
  s->size         = ss->size;
  s->action       = ss->action;
  s->test_changes = ss->test_changes;
  /* Get the initial size for future comparision, if the file exists */
  if (s->test_changes) {
    s->test_changes_ok = !stat(current->path, &buf);
    if (s->test_changes_ok)
      s->size = (unsigned long long)buf.st_size;
  }
 
  s->next = current->sizelist;
  current->sizelist = s;

  reset_sizeset();
}


/*
 * Set Checksum object in the current service
 */
static void addchecksum(Checksum_T cs) {

  int len;
  Checksum_T c;

  ASSERT(cs);

  cs->test_changes_ok = TRUE;

  if (!cs->hash) {
    if (cs->type == HASH_UNKNOWN)
      cs->type = DEFAULT_HASH;
    if ( !(cs->hash = Util_getChecksum(current->path, cs->type))) {
      if (cs->test_changes == TRUE) {
        /* If the file doesn't exist and we're checking for checksum changes, set dummy value */
        cs->test_changes_ok = FALSE;
        cs->hash = xstrdup("00000000000000000000000000000000");
      } else {
        yyerror2("cannot compute a checksum for file %s", current->path);
        reset_checksumset();
        return;
      }
    }
  }

  len = cleanup_hash_string(cs->hash);

  if (cs->type == HASH_UNKNOWN) {
    if (len == 32) {
      cs->type = HASH_MD5;
    } else if (len == 40) {
      cs->type = HASH_SHA1;
    } else {
      yyerror2("invalid checksum [%s] for file %s", cs->hash, current->path);
      reset_checksumset();
      return;
    }
  } else if (( cs->type == HASH_MD5 && len!=32 ) || ( cs->type == HASH_SHA1 && len != 40 )) {
    yyerror2("invalid checksum [%s] for file %s", cs->hash, current->path);
    reset_checksumset();
    return;
  }

  NEW(c);

  c->type            = cs->type;
  c->hash            = cs->hash;
  c->test_changes    = cs->test_changes;
  c->test_changes_ok = cs->test_changes_ok;
  c->action          = cs->action;
 
  current->checksum = c;

  reset_checksumset();

}


/*
 * Set Perm object in the current service
 */
static void addperm(Perm_T ps) {
  Perm_T p;

  ASSERT(ps);

  NEW(p);
  p->perm       = ps->perm;
  p->action     = ps->action;
  current->perm = p;
  reset_permset();

}

/*
 * Set Match object in the current service
 */
static void addmatch(Match_T ms, int actionnumber, int linenumber) {
  Match_T m;
  Match_T ml;
  int     reg_return;
  
  ASSERT(ms);

  NEW(m);
#ifdef HAVE_REGEX_H
  NEW(m->regex_comp);
#endif

  m->match_string = ms->match_string;
  m->match_path   = ms->match_path ? xstrdup(ms->match_path) : NULL;
  m->action       = ms->action;
  m->not          = ms->not;
  m->ignore       = ms->ignore;
  m->next         = NULL;

  addeventaction(&(m->action), actionnumber, ACTION_IGNORE);

#ifdef HAVE_REGEX_H
  reg_return = regcomp(m->regex_comp, ms->match_string, REG_NOSUB|REG_EXTENDED);

  if (reg_return != 0) {
    char errbuf[STRLEN];
    regerror(reg_return, ms->regex_comp, errbuf, STRLEN);
    if (m->match_path != NULL) 
      yyerror2("regex parsing error:%s on line %i of", errbuf, linenumber);
    else
      yyerror2("regex parsing error:%s", errbuf);
  }
#endif

  if (current->matchlist) {
    /* Find the end of the list */
    for (ml = current->matchlist; ml->next; ml = ml->next)
      ;

    ml->next = m;
    
  } else
    current->matchlist = m;
}


static void addmatchpath(Match_T ms, int actionnumber) {

  FILE *handle;
  Command_T savecommand = NULL;
  char buf[2048];
  int linenumber = 0;

  ASSERT(ms->match_path);

  handle = fopen(ms->match_path, "r");
  if (handle == NULL) {
    yyerror2("cannot read regex match file (%s)", ms->match_path);
    return;
  }
  
  while (!feof(handle)) {
    int len;

    linenumber++;
    
    if (! fgets(buf, 2048, handle))
      continue;

    len = strlen(buf);

    if (len == 0 || buf[0] == '\n')
      continue;

    if (buf[len-1] == '\n')
      buf[len-1] = 0;

    ms->match_string = xstrdup(buf);

    /* The addeventaction() called from addmatch() will reset the
     * command1 to NULL, but we need to duplicate the command for
     * each line, thus need to save it here */
    if (actionnumber == ACTION_EXEC) {
      if (command1 == NULL) {
        ASSERT(savecommand);
        command1 = savecommand;
      }
      savecommand = copycommand(command1);
    }

    addmatch(ms, actionnumber, linenumber);
  }

  if (actionnumber == ACTION_EXEC && savecommand)
    gccmd(&savecommand);

  fclose(handle);
}


/*
 * Set Uid object in the current service
 */
static void adduid(Uid_T us) {
  Uid_T u;

  ASSERT(us);

  NEW(u);
  u->uid       = us->uid;
  u->action    = us->action;
  current->uid = u;
  reset_uidset();
}


/*
 * Set Gid object in the current service
 */
static void addgid(Gid_T gs) {
  Gid_T g;

  ASSERT(gs);

  NEW(g);
  g->gid       = gs->gid;
  g->action    = gs->action;
  current->gid = g;
  reset_gidset();
}


/*
 * Add a new filesystem to the current service's filesystem list
 */
static void addfilesystem(Filesystem_T ds) {
  Filesystem_T dev;

  ASSERT(ds);
  
  NEW(dev);
  dev->resource           = ds->resource;
  dev->operator           = ds->operator;
  dev->limit_absolute     = ds->limit_absolute;
  dev->limit_percent      = ds->limit_percent;
  dev->action             = ds->action;

  dev->next               = current->filesystemlist;
  current->filesystemlist = dev;

  reset_filesystemset();

}


/*
 * Add a new icmp object to the current service's icmp list
 */
static void addicmp(Icmp_T is) {
  if (!getuid()) {
    Icmp_T icmp;

    ASSERT(is);

    NEW(icmp);
    icmp->type         = is->type;      
    icmp->count        = is->count > ICMP_MAX_COUNT ? ICMP_MAX_COUNT : is->count;     
    icmp->timeout      = is->timeout;
    icmp->action       = is->action;
    icmp->is_available = FALSE;
    icmp->response     = -1;
  
    icmp->next         = current->icmplist;
    current->icmplist  = icmp;
  } else
    yyerror("icmp statements must be run as root");
  reset_icmpset();
}


/*
 * Set EventAction object
 */
static void addeventaction(EventAction_T *_ea, int failed, int succeeded) {
  EventAction_T ea;

  ASSERT(_ea);

  NEW(ea);
  NEW(ea->failed);
  NEW(ea->succeeded);

  ea->failed->id     = failed;
  ea->failed->count  = rate1.count;
  ea->failed->cycles = rate1.cycles;
  if (failed == ACTION_EXEC) {
    ASSERT(command1);
    ea->failed->exec = command1;
    command1 = NULL;
  }
  describeAction(ea->failed);

  ea->succeeded->id     = succeeded;
  ea->succeeded->count  = rate2.count;
  ea->succeeded->cycles = rate2.cycles;
  if (succeeded == ACTION_EXEC) {
    ASSERT(command2);
    ea->succeeded->exec = command2;
    command2 = NULL;
  }
  describeAction(ea->succeeded);
  *_ea = ea;
  reset_rateset();
}


/*
 * Redefine EventAction object (used for default action overloading)
 */
static void seteventaction(EventAction_T *_ea, int failed, int succeeded) {
  EventAction_T ea = *_ea;

  ASSERT(ea);
  ASSERT(ea->failed);
  ASSERT(ea->succeeded);

  ea->failed->id     = failed;
  ea->failed->count  = rate1.count;
  ea->failed->cycles = rate1.cycles;
  if (failed == ACTION_EXEC) {
    ASSERT(command1);
    ea->failed->exec = command1;
    command1 = NULL;
  }
  describeAction(ea->failed);

  ea->succeeded->id     = succeeded;
  ea->succeeded->count  = rate2.count;
  ea->succeeded->cycles = rate2.cycles;
  if (succeeded == ACTION_EXEC) {
    ASSERT(command2);
    ea->succeeded->exec = command2;
    command2 = NULL;
  }
  describeAction(ea->succeeded);
}


/*
 * Return a protocol object for the given protocol
 */
static void *addprotocol(int protocol) {

  switch (protocol) {
  case P_APACHESTATUS:  return create_apache_status();
  case P_DNS:           return create_dns();
  case P_DWP:           return create_dwp();
  case P_FTP:           return create_ftp();
  case P_GENERIC:       return create_generic();
  case P_HTTP:          return create_http();
  case P_IMAP:          return create_imap();
  case P_CLAMAV:        return create_clamav();
  case P_LDAP2:         return create_ldap2();
  case P_LDAP3:         return create_ldap3();
  case P_MYSQL:         return create_mysql();
  case P_NNTP:          return create_nntp();
  case P_NTP3:          return create_ntp3();
  case P_POSTFIXPOLICY: return create_postfix_policy();
  case P_POP:           return create_pop();
  case P_SMTP:          return create_smtp();
  case P_SSH:           return create_ssh();
  case P_RDATE:         return create_rdate();
  case P_RSYNC:         return create_rsync();
  case P_TNS:           return create_tns();
  case P_PGSQL:         return create_pgsql();
  case P_SIP:           return create_sip();
  case P_LMTP:          return create_lmtp();
  }

  return create_default();
   
}


/*
 * Add a generic protocol handler to 
 */
static void addgeneric(Port_T port, char *send, char *expect) {
  Generic_T g = port->generic;
  
  if (g == NULL) {
    NEW(g);
    port->generic = g;
  } else {
    while (g->next != NULL)
      g = g->next;
    NEW(g->next);
    g = g->next;
  }
  
  if (send != NULL) {
    g->send = xstrdup(send);
    g->expect = NULL;
  } else if (expect != NULL) {
#ifdef HAVE_REGEX_H
    
    int   reg_return;
    NEW(g->expect);
    reg_return = regcomp(g->expect, expect, REG_NOSUB|REG_EXTENDED);
    if (reg_return != 0) {
      char errbuf[STRLEN];
      regerror(reg_return, g->expect, errbuf, STRLEN);
      yyerror2("regex parsing error:%s", errbuf);
    }
#else
    g->expect = xstrdup(expect);
#endif
    g->send = NULL;
  } 
}


/*
 * Add the current command object to the current service object's
 * start or stop program.
 */
static void addcommand(int what, unsigned timeout) {

  switch(what) {
  case START: current->start = command; break;
  case STOP:  current->stop = command; break;
  }

  command->timeout = timeout;
  
  command = NULL;
  
}

  
/*
 * Add a new argument to the argument list
 */
static void addargument(char *argument) {

  ASSERT(argument);

  if (! command) {
    
    NEW(command);
    check_exec(argument);
    
  }
  
  command->arg[command->length++] = argument;
  command->arg[command->length] = NULL;
  
  if (command->length >= ARGMAX)
    yyerror("exceeded maximum number of program arguments");
  
}


/*
 * Setup a url request for the current port object
 */
static void prepare_urlrequest(URL_T U) {

  ASSERT(U);
  
  portset.protocol = addprotocol(P_HTTP);

  if (urlrequest == NULL)
    NEW(urlrequest);
  urlrequest->url = U;
  portset.hostname = xstrdup(U->hostname);
  check_hostname(portset.hostname);
  portset.port = U->port;
  portset.url_request = urlrequest;
  portset.type = SOCK_STREAM;
  portset.request = Util_getString("%s%s%s", U->path, U->query ? "?" : "", U->query ? U->query : "");
  /* Only the HTTP protocol is supported for URLs.
     See also the lexer if this is to be changed in
     the future */
  portset.protocol = addprotocol(P_HTTP);
  if (IS(U->protocol, "https"))
    portset.SSL.use_ssl = TRUE;
  
}


/*
 * Set the url request for a port
 */
static void  seturlrequest(int operator, char *regex) {
  
  ASSERT(regex);

  if (! urlrequest)
    NEW(urlrequest);
  urlrequest->operator = operator;
#ifdef HAVE_REGEX_H
  {    
    int reg_return;
    NEW(urlrequest->regex);
    reg_return = regcomp(urlrequest->regex, regex, REG_NOSUB|REG_EXTENDED);
    if (reg_return != 0) {
      char errbuf[STRLEN];
      regerror(reg_return, urlrequest->regex, errbuf, STRLEN);
      yyerror2("regex parsing error: %s", errbuf);
    }
  }
#else
  urlrequest->regex = xstrdup(regex);
#endif

}


/*
 * Add a new data recipient server to the mmonit server list
 */
static void addmmonit(URL_T url, int timeout, int sslversion, char *certmd5) {
  Mmonit_T c;
  
  ASSERT(url);

  NEW(c);
  c->url = url;
  if (!strcmp(c->url->protocol, "https")) {
    if (!have_ssl()) {
      yyerror("ssl check cannot be activated. SSL is not supported");
    } else {
      c->ssl.use_ssl = TRUE;
      c->ssl.version = sslversion;
      if (certmd5) {
	c->ssl.certmd5 = certmd5;
	cleanup_hash_string(c->ssl.certmd5);
      }
    }
  }
  c->timeout = timeout;
  c->next = NULL;

  if (Run.mmonits) {
    Mmonit_T C;
    for (C = Run.mmonits; C->next; C = C->next)
      /* Empty */ ;
    C->next = c;
  } else {
    Run.mmonits = c;
  }
}


/*
 * Add a new smtp server to the mail server list
 */
static void addmailserver(MailServer_T mailserver) {

  MailServer_T s;
  
  ASSERT(mailserver->host);

  NEW(s);
  s->host        = mailserver->host;
  s->port        = mailserver->port;
  s->username    = mailserver->username;
  s->password    = mailserver->password;
  s->ssl.use_ssl = mailserver->ssl.use_ssl;
  s->ssl.version = mailserver->ssl.version;
  s->ssl.certmd5 = mailserver->ssl.certmd5;

  s->next = NULL;

  if (Run.mailservers) {
    MailServer_T l;
    for (l = Run.mailservers; l->next; l = l->next) /* empty */;
    l->next = s;
  } else {
    Run.mailservers = s;
  }
  
  reset_mailserverset();
}


/*
 * Return uid if found on the system. If the parameter user is NULL
 * the uid parameter is used for looking up the user id on the system,
 * otherwise the user parameter is used.
 */
static uid_t get_uid(char *user, uid_t uid) {
  struct passwd *pwd;

  if (user) {
    pwd = getpwnam(user);

    if (pwd == NULL) {
      yyerror2("requested user not found on the system");
      return(0);
    }

  } else {

    if ( (pwd = getpwuid(uid)) == NULL ) {
      yyerror2("requested uid not found on the system");
      return(0);
    }
  }

  return(pwd->pw_uid);

}


/*
 * Return gid if found on the system. If the parameter group is NULL
 * the gid parameter is used for looking up the group id on the system,
 * otherwise the group parameter is used.
 */
static gid_t get_gid(char *group, gid_t gid) {
  struct group *grd;

  if (group) {
    grd = getgrnam(group);

    if (grd == NULL) {
      yyerror2("requested group not found on the system");
      return(0);
    }

  } else {

    if ( (grd = getgrgid(gid)) == NULL ) {
      yyerror2("requested gid not found on the system");
      return(0);
    }

  }

  return(grd->gr_gid);

}


/*
 * Add a new user id to the current command object.
 */
static void addeuid(uid_t uid) {
  if (!getuid()) {
    command->has_uid = TRUE;
    command->uid = uid;
  } else
    yyerror("uid statement requires root privileges");
}


/*
 * Add a new group id to the current command object.
 */
static void addegid(gid_t gid) {
  if (!getuid()) {
    command->has_gid = TRUE;
    command->gid = gid;
  } else
    yyerror("gid statement requires root privileges");
}


/*
 * Reset the logfile if changed
 */
static void setlogfile(char *logfile) {
  if (Run.logfile) {
    if (IS(Run.logfile, logfile)) {
      FREE(logfile);
      return;
    } else
      FREE(Run.logfile);
  }
  Run.logfile = logfile;
}


/*
 * Reset the pidfile if changed
 */
static void setpidfile(char *pidfile) {
  if (Run.pidfile) {
    if (IS(Run.pidfile, pidfile)) {
      FREE(pidfile);
      return;
    } else
      FREE(Run.pidfile);
  }
  Run.pidfile = pidfile;
}


/*
 * Read a apache htpasswd file and add credentials found for username
 */
static void addhtpasswdentry(char *filename, char *username, int dtype) {
  char *ht_username = NULL;
  char *ht_passwd = NULL;
  char buf[STRLEN];
  FILE *handle = NULL;
  int credentials_added = 0;
  
  ASSERT(filename);

  handle = fopen(filename, "r");

  if ( handle == NULL ) {
    if (username != NULL)
      yyerror2("cannot read htpasswd (%s)", filename);
    else
      yyerror2("cannot read htpasswd", filename);
    return;
  }
  
  while (!feof(handle)) {
    char *colonindex = NULL;
    int i;
    
    if (! fgets(buf, STRLEN, handle))
      continue;

    /* strip trailing non visible characters */
    for (i = strlen(buf)-1; i >= 0; i--) {
      if ( buf[i] == ' '  || buf[i] == '\r' || buf[i] == '\n' || buf[i] == '\t' )
        buf[i] ='\0';
      else
        break;
    }

    if ( NULL == (colonindex = strchr(buf, ':')))
      continue;

    ht_passwd = xstrdup(colonindex+1);
    *colonindex = '\0';

    /* In case we have a file in /etc/passwd or /etc/shadow style we
     *  want to remove ":.*$" and Crypt and MD5 hashed dont have a colon
     */ 
    
    if ( (NULL != (colonindex = strchr(ht_passwd, ':'))) && ( dtype != DIGEST_CLEARTEXT) )
      *colonindex = '\0';

    ht_username = xstrdup(buf);

    if (username == NULL) {
      if (addcredentials(ht_username, ht_passwd, dtype, FALSE))
        credentials_added++;
    } else if (strcmp(username, ht_username) == 0)  {
      if (addcredentials(ht_username, ht_passwd, dtype, FALSE))
        credentials_added++;
    } else {
      FREE(ht_passwd);
      FREE(ht_username);
    }
  }

  if (credentials_added == 0) {
    if ( username == NULL )
      yywarning2("htpasswd file (%s) has no usable credentials", filename);
    else
      yywarning2("htpasswd file (%s) has no usable credentials for user %s", filename, username);
  }
  fclose(handle);
}


#ifdef HAVE_LIBPAM
static void addpamauth(char* groupname, int readonly) {
  Auth_T c = NULL;
  Auth_T prev = NULL;

  ASSERT(groupname);

  if (Run.credentials == NULL)
    NEW(Run.credentials);

  c = Run.credentials;
  do {
    if (c->groupname != NULL && IS(c->groupname, groupname)) {
      yywarning2("PAM group %s was added already, entry ignored", groupname);
      FREE(groupname);
      return;
    }
    prev = c;
    c = c->next;
  } while (c != NULL);

  NEW(prev->next);
  c = prev->next;

  c->next        = NULL;
  c->uname       = NULL;
  c->passwd      = NULL;
  c->groupname   = groupname;
  c->digesttype  = DIGEST_PAM;
  c->is_readonly = readonly;
  
  DEBUG("%s: Adding PAM group '%s'.\n", prog, groupname); 

  return;
}
#endif


/*
 * Add Basic Authentication credentials
 */
static int addcredentials(char *uname, char *passwd, int dtype, int readonly) {
  Auth_T c;

  ASSERT(uname);
  ASSERT(passwd);

  if (Run.credentials == NULL) {
    NEW(Run.credentials);
    c = Run.credentials;
  } else {

    if (Util_getUserCredentials(uname) != NULL) {
      yywarning2("credentials for user %s were already added, entry ignored", uname);
      FREE(uname);
      FREE(passwd);
      return FALSE;
    }

    c = Run.credentials;

    while ( c->next != NULL )
      c = c->next;

    NEW(c->next);
    c = c->next;
        
  }
  
  c->next        = NULL;
  c->uname       = uname;
  c->passwd      = passwd;
  c->groupname   = NULL;
  c->digesttype  = dtype;
  c->is_readonly = readonly;
  
  DEBUG("%s: Debug: Adding credentials for user '%s'.\n", prog, uname); 
  
  return TRUE;
  
}


/*
 * Set the syslog and the facilities to be used
 */
static void setsyslog(char *facility) {

  if (!Run.logfile || ihp.logfile) {
    ihp.logfile = TRUE;
    setlogfile(xstrdup("syslog"));
    Run.use_syslog = TRUE;
    Run.dolog = TRUE;
  }

  if (facility) {
    if (IS(facility,"log_local0"))
      Run.facility = LOG_LOCAL0;
    else if (IS(facility, "log_local1"))
      Run.facility = LOG_LOCAL1;
    else if (IS(facility, "log_local2"))
      Run.facility = LOG_LOCAL2;
    else if (IS(facility, "log_local3"))
      Run.facility = LOG_LOCAL3;
    else if (IS(facility, "log_local4"))
      Run.facility = LOG_LOCAL4;
    else if (IS(facility, "log_local5"))
      Run.facility = LOG_LOCAL5;
    else if (IS(facility, "log_local6"))
      Run.facility = LOG_LOCAL6;
    else if (IS(facility, "log_local7"))
      Run.facility = LOG_LOCAL7;
    else if (IS(facility, "log_daemon"))
      Run.facility = LOG_DAEMON;
    else
      yyerror2("invalid syslog facility");
  } else {
    Run.facility = LOG_USER;
  }
  
}


/*
 * Reset the current mailset, eventset and reminder for reuse
 */
static void reset_mailset() {
  memset(&mailset, 0, sizeof(struct mymail));
  eventset = EVENT_NULL;
}


/*
 * Reset the mailserver set to default values
 */
static void reset_mailserverset() {
  memset(&mailserverset, 0, sizeof(struct mymailserver));
  mailserverset.port = PORT_SMTP;
  mailserverset.ssl.use_ssl = FALSE;
  mailserverset.ssl.version = SSL_VERSION_AUTO;
}


/*
 * Reset the Port set to default values
 */
static void reset_portset() {
  memset(&portset, 0, sizeof(struct myport));
  portset.socket = -1;
  portset.type = SOCK_STREAM;
  portset.family = AF_INET;
  portset.SSL.version = SSL_VERSION_AUTO;
  portset.timeout = NET_TIMEOUT;
  portset.maxforward = 70;
  urlrequest = NULL;
}


/*
 * Reset the Proc set to default values
 */
static void reset_resourceset() {
  resourceset.resource_id = 0;
  resourceset.limit = 0;
  resourceset.action = NULL;
  resourceset.operator = OPERATOR_EQUAL;
}


/*
 * Reset the Timestamp set to default values
 */
static void reset_timestampset() {
  timestampset.operator = OPERATOR_EQUAL;
  timestampset.time = 0;
  timestampset.test_changes = FALSE;
  timestampset.action = NULL;
}


/*
 * Reset the Size set to default values
 */
static void reset_sizeset() {
  sizeset.operator = OPERATOR_EQUAL;
  sizeset.size = 0;
  sizeset.test_changes = FALSE;
  sizeset.action = NULL;
}


/*
 * Reset the Checksum set to default values
 */
static void reset_checksumset() {
  checksumset.type = HASH_UNKNOWN;
  checksumset.hash = NULL;
  checksumset.test_changes = FALSE;
  checksumset.action = NULL;
}


/*
 * Reset the Perm set to default values
 */
static void reset_permset() {
  permset.perm = 0;
  permset.action = NULL;
}


/*
 * Reset the Uid set to default values
 */
static void reset_uidset() {
  uidset.uid = 0;
  uidset.action = NULL;
}


/*
 * Reset the Gid set to default values
 */
static void reset_gidset() {
  gidset.gid = 0;
  gidset.action = NULL;
}


/*
 * Reset the Filesystem set to default values
 */
static void reset_filesystemset() {
  filesystemset.resource = 0;
  filesystemset.operator = OPERATOR_EQUAL;
  filesystemset.limit_absolute = -1;
  filesystemset.limit_percent = -1;
  filesystemset.action = NULL;
}


/*
 * Reset the ICMP set to default values
 */
static void reset_icmpset() {
  icmpset.type = ICMP_ECHO;
  icmpset.count = ICMP_ATTEMPT_COUNT;
  icmpset.timeout = NET_TIMEOUT;
  icmpset.action = NULL;
}


/*
 * Reset the Rate set to default values
 */
static void reset_rateset() {
  rate1.count  = 1;
  rate1.cycles = 1;

  rate2.count  = 1;
  rate2.cycles = 1;
}


/* ---------------------------------------------------------------- Checkers */


/*
 * Check for unique service name
 */
static void check_name(char *name) {

  ASSERT(name);

  if (Util_existService(name) || (current && IS(name, current->name)))
    yyerror2("service name conflict, %s already defined", name);
  if (name && *name == '/')
    yyerror2("service name must not start with '/' -- ", name);
  
}


/*
 * Permission statement semantic check
 */
static int check_perm(int perm) {
  long result;
  char *status;
  char buf[STRLEN];

  snprintf(buf, STRLEN, "%d", perm);

  result = strtol(buf, &status, 8);

  if ( *status != '\0' || result < 0 || result > 07777 )
    yyerror2("permission statements must have an octal value between 0 and 7777");

  return result;
}


/*
 * Timeout statement semantic check
 */
static void check_timeout(int s, int c) {
  if (s > c)
    yyerror2("the number of restarts must be less than poll cycles");
  if (s <= 0 || c <= 0)
    yyerror2("zero or negative values not allowed in a timeout statement");
}


/*
 * Every statement semantic check
 */
static void check_every(int every) {
  if (every <= 1)
    yyerror2("an EVERY statement must have a value greater than 1");
}


/*
 * Check hostname 
 */
static void check_hostname(char *hostname) {

  ASSERT(hostname);

  if (!check_host(hostname))
    yywarning2("hostname did not resolve");
}

/*
 * Check the dependency graph for errors
 * by doing a topological sort, thereby finding any cycles.
 * Assures that graph is a Directed Acyclic Graph (DAG).
 */
static void check_depend() {
  Service_T s;
  Service_T depends_on = NULL;
  Service_T* dlt = &depend_list; /* the current tail of it                                 */
  int done;                      /* no unvisited nodes left?                               */
  int found_some;                /* last iteration found anything new ?                    */
  depend_list = NULL;            /* depend_list will be the topological sorted servicelist */

  do { 
    done = TRUE;
    found_some = FALSE; 
    for (s = servicelist; s; s = s->next) {
        Dependant_T d;
      if (s->visited)
	  continue;
      done = FALSE; // still unvisited nodes
      depends_on = NULL;
      for (d = s->dependantlist; d; d = d->next) {
        Service_T dp = Util_getService(d->dependant);
        if (!dp) {
          LogError("%s: Error: Depend service '%s' is not defined in the control file\n", prog, d->dependant);
          exit(1);
        }
        if (!dp->visited) {
          depends_on = dp;
        }
      }

      if (!depends_on) {
        s->visited = TRUE;
        found_some = TRUE;
        *dlt = s;
        dlt = &s->next_depend;
      }
    }
  } while (found_some && !done);
	
  if (!done) {
        ASSERT(depends_on);
	LogError("%s: Error: Found a depend loop in the control file involving the service '%s'\n", prog, depends_on->name);
	exit(1);
   } 

  ASSERT(depend_list);
  servicelist = depend_list;
    
  for (s = depend_list; s; s = s->next_depend)
    s->next = s->next_depend;
    
  reset_depend();
}


/*
 * Check if the executable exist
 */
static void check_exec(char *exec) {
  if (! File_exist(exec))
    yywarning2("the executable does not exist");
}
 
 
/* Return a valid max forward value for SIP header */
static int verifyMaxForward(int mf) { 
  int max = 70;
  
  if (mf >= 0 && mf <= 255)
    max = mf;
  else
    yywarning2("SIP max forward is outside the range [0..255]. Setting max forward to 70");
  
  return max;
}


/* -------------------------------------------------------------------- Misc */


/*
 * Cleans up an md5 string, tolower and remove byte separators
 */
static int cleanup_hash_string(char *hashstring) {
  int i = 0, j = 0;

  ASSERT(hashstring);

  while (hashstring[i] != '\0') {
    if (isxdigit((int) hashstring[i])) {
      hashstring[j] = tolower((int)hashstring[i]);
      j++;
    } 
    i++;
  }
  hashstring[j] = '\0';
  return j;
}


static void describeAction(Action_T A) {
  #define BUF_CURSOR    (A->description + strlen(A->description))
  #define BUF_AVAILABLE (sizeof(A->description) - strlen(A->description))
  snprintf(BUF_CURSOR, BUF_AVAILABLE, "%s", actionnames[A->id]);
  if (A->id == ACTION_EXEC) {
    int i = 0;
    Command_T C = A->exec;

    while (C->arg[i]) {
      snprintf(BUF_CURSOR, BUF_AVAILABLE, "%s%s", i ? " " : " '", C->arg[i]);
      i++;
    }
    snprintf(BUF_CURSOR, BUF_AVAILABLE, "'");
    if (C->has_uid)
      snprintf(BUF_CURSOR, BUF_AVAILABLE, " as uid %d", C->uid);
    if (C->has_gid)
      snprintf(BUF_CURSOR, BUF_AVAILABLE, " as gid %d", C->gid);
    snprintf(BUF_CURSOR, BUF_AVAILABLE, " timeout %d cycle(s)", C->timeout);
  }
  #undef BUF_CURSOR
  #undef BUF_AVAILABLE
}


/* Return deep copy of the command */
static Command_T copycommand(Command_T source) {
  int i;
  Command_T copy = NULL;

  NEW(copy);
  copy->length = source->length;
  copy->has_uid = source->has_uid;
  copy->uid = source->uid;
  copy->has_gid = source->has_gid;
  copy->gid = source->gid;
  copy->timeout = source->timeout;
  for (i = 0; i < copy->length; i++)
     copy->arg[i] = xstrdup(source->arg[i]);
  copy->arg[copy->length] = NULL;

  return copy;
}


