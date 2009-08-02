/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

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




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 264 "p.y"
{
  URL_T url;
  float real;
  int   number;
  char *string;
}
/* Line 1489 of yacc.c.  */
#line 426 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

