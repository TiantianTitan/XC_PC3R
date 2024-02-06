#!/usr/bin/perl

while (<>) {
      if (m!/\* result! .. m!/end result \*/!) {
	  print unless m!result!;
      }
}
