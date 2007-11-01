The ff package (README.txt)
===========================

Handling Very Large Datasets using Memory-Mapped binary Flat Files.

Introduction
------------
A current limitation of R is that it can only address objects that fit in the 
available virtual memory space, currently 2-4 GB on 32-bit systems. 
Consequently the theoretical maximium length of a vector is 2^31-1.
The constraints on 64-bit systems are less severe (8 GB) but still limited, 
and cannot cope with very large data sets. 

The ff package is designed to overcome this limitation. 
It extends the R system by making use of a new container type in which data is 
stored on native binary "flat files" in persistent storage (hard disk, CD, DVD, 
etc.) rather than in the main memory.
The package enables one to work on several very large data files 
simulataneously.
In effect it allows one to address very large vectors or arrays which do not fit
in R runtime environment. 
The idea is that one can read from and write to the flat files, and operate on
the parts that have been loaded into R. 
From the user's point of view the ff objects appear to be ordinary R 
vectors or arrays that are accessed using the usual index operators, despite the
fact that the full ff object is not resident in memory. 
The exchange of data between virtual memory and the storage device is achieved
via memory mapped pages of binary files.

Status
------
This version has been released to the useR 2007 programming competition.

Portability
-----------
This package makes use of a operating system specific features
that are implemented in C++.
The package has been ported to all major R platforms including
Windows, Linux, Mac OS X 10.4 and FreeBSD (other BSD derivates have not
been tested so far, but are expected to work).  

Windows notes:
--------------
  This package has been designed for Windows 2000 Professional and above 
  (Server,XP).
  The package requires GetFileSizeEx() instead of GetFileSize() from the
  Microsoft Platform API to work.

Tested Platforms:
-----------------

  OS version          | R version| Compiler    | Filesystems
  --------------------+----------+-------------+------------
  Windows XP/SP 2     | R 2.4.1  | gcc 3.4.2-5 | NTFS
                      | R 2.5.1  | gcc 3.4.5   | NTFS
  Mac OS X 10.4.8 ppc | R 2.4.1  | gcc 4.0.1   | HFS
  Gentoo Linux 2.6.17 | R 2.2.1  | gcc 3.4.5   | Ext3
  FreeBSD 5.0 R1      | R 1.7.0  | gcc 3.2.1   | UFS 

ChangeLog
=========

0.1
- initial release (ports: Windows and OS X)

0.2
- start by index 1 instead 0
- sample with replace

0.3
- linux port
- error on device full, file already in use, file not existing
- multi-dimensional arrays (ffm)

0.4
- checking bounds
- ff read/write of linear chunks
- ffm index sequences

0.5
- exposed option: pagesize 
- exact vector length 
- checking index bounds are greater than 0 
- new option: readonly
- added attributes: path, pagesize, readonly
- bugfix: evaluation of index arguments in the parent frame  

0.6
- bugfix: removed length and dim wrappers, as they are already generic
- performance boost through using sequences and ff.read/ff.write
- ff.write now uses a size attribute not length of value vector to be written

0.7
- unix: mmap: exact vector length and readonly
- resync with os x and linux from 0.3
- [.ffm returns matrix
- sequence packer and sequence read/writes
- unix: autoconf configure 
- add package vignette
- check boundings on sequence read/writes
- makes file-system tests in R and better error reporting
- if file is originally read-only, flag as read-only

0.8
- seqpack exported
- print.ff and print.ffm
- using GetFileSizeEx again, check compilation for windows  
- getrange reused
- bugfix: evalmindex2 (my old version) works now using ffdataframe
- exposed runique
- optimized sample
- bug: crash if file is not existing due to non-existing directory in path
- ffm: add readonly and pagesize and file-system tests
- rename ffdataframe -> ff.data.frame
- changed namespace exports to S3 method exports where possible
- [.ffm: add value as an argument
- dataframe

0.9
- C++ source cleanup
- new test: create read-only file will stop and give error message
- support for ff C++ error codes in R API 

0.9-1
- critical bugfix: ffm.doset did not use env to eval
- uses error code from C++ now
- ff.data.frame -> ffm.data.frame

1.0
- critical bugfix: getrange now works
- initial public release

1.0-1
- some minor fixes for R 2.6.0 package check
- read-only protected ffm objects failed to open

Todo
====
- use doubles as indices (53 bit resolution)
- recycling assignment in C++
  e.g
    res <- ffm("bla", c(2,2048^2*4))
    res[1,] <- 1
    unable to allocate vector

Futher planed improvements
==========================
- support for multiple types: byte, integer, logical, float and complex
- resizing/truncating of containers
- flush-back optimization in memory mapped files
- scratch objects: temporary files that gets deleted when destroyed (scratch ff objects)
- connection to databases
- splitting the framework in caching/storage policy classes
- splitting the files for file-systems with limitations on filesizes
- support doubles as indices to a certain degree (up to length of double mantisa)

Open Questions
==============
- initialize with NA's - is this platform-dependant portable between fortran,R and C?
- overload ffm<- to release and reinitialize an object
- shutdown: detach package should remove all objects or deny
- conditionals in vectors []

