[![DOI](https://zenodo.org/badge/13996/cmungall/sql_compiler.svg)](https://zenodo.org/badge/latestdoi/13996/cmungall/sql_compiler)

# Translates logic program queries to SQL

This modules is an extension of version 1.1 (Dec 21st 1992) of the Prolog to SQL compiler written by Christoph Draxler of the Univeristy of Munich.

It was modified by Chris Mungall to be compatible with SWI-Prolog and extended to support:

 - MySQL specific column types
 - SELECT DISTINCT
 - query rewriting for optimization
 - additional comparison operators
 - Permission has been granted by the original author to distribute this software using the same license as SWI-Prolog.

A previous iteration of this code existed as part of the blipkit package:

https://github.com/cmungall/blipkit/tree/master/packages/sql

## Installation

Install SWI-Prolog from http://www.swi-prolog.org

    pack_install(sql_compiler)

