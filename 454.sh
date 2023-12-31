#! /bin/sh
# This is a shell archive, meaning:
# 1. Remove everything above the #! /bin/sh line.
# 2. Save the resulting text in a file.
# 3. Execute the file with /bin/sh (not csh) to create the files:
#	Fortran/
#	Fortran/Sp/
#	Fortran/Sp/Drivers/
#	Fortran/Sp/Drivers/Makefile
#	Fortran/Sp/Drivers/driver1.f
#	Fortran/Sp/Drivers/driver2.f
#	Fortran/Sp/Drivers/driver3.f
#	Fortran/Sp/Drivers/res1
#	Fortran/Sp/Drivers/res2
#	Fortran/Sp/Drivers/res3
#	Fortran/Sp/Src/
#	Fortran/Sp/Src/src.f
# This archive created: Fri Mar 10 09:34:00 2006
export PATH; PATH=/bin:$PATH
if test ! -d 'Fortran'
then
	mkdir 'Fortran'
fi
cd 'Fortran'
if test ! -d 'Sp'
then
	mkdir 'Sp'
fi
cd 'Sp'
if test ! -d 'Drivers'
then
	mkdir 'Drivers'
fi
cd 'Drivers'
if test -f 'Makefile'
then
	echo shar: will not over-write existing file "'Makefile'"
else
cat << "SHAR_EOF" > 'Makefile'
all: Res

src.o: src.f
	$(F77) $(F77OPTS) -c src.f

driver1.o: driver1.f
	$(F77) $(F77OPTS) -c driver1.f

driver2.o: driver2.f
	$(F77) $(F77OPTS) -c driver2.f

driver3.o: driver3.f
	$(F77) $(F77OPTS) -c driver3.f

DRIVERS= driver1 driver2 driver3
RESULTS= Res1 Res2 Res3

Objs1= driver1.o src.o
Objs2= driver2.o src.o
Objs3= driver3.o src.o

driver1: $(Objs1)
	$(F77) $(F77OPTS) -o driver1 $(Objs1) $(SRCLIBS)

driver2: $(Objs2)
	$(F77) $(F77OPTS) -o driver2 $(Objs2) $(SRCLIBS)

driver3: $(Objs3)
	$(F77) $(F77OPTS) -o driver3 $(Objs3) $(SRCLIBS)

Res: driver1 driver2 driver3 
	./driver1 >Res1
	./driver2 >Res2
	./driver3 >Res3

diffres:Res1 Res2 Res3 res1 res2 res3
	echo "Differences in results from driver"
	$(DIFF) Res1 res1
	$(DIFF) Res2 res2
	$(DIFF) Res3 res3

clean: 
	rm -rf *.o $(DRIVERS) $(CLEANUP) $(RESULTS)
SHAR_EOF
fi # end of overwriting check
if test -f 'driver1.f'
then
	echo shar: will not over-write existing file "'driver1.f'"
else
cat << "SHAR_EOF" > 'driver1.f'
      program main

c***********************************************************************
c      ALGORITHM 454, COLLECTED ALGORITHMS FROM ACM.
c      THIS WORK PUBLISHED IN COMMUNICATIONS OF THE ACM
c      VOL. 16, NO. 8, August, 1973, PP.487--489.
c
c
cc TOMS454_PRB1 tests JCONSX, ACM TOMS algorithm 454.
c
c  Modified:
c
c    23 January 2006
c
c  Author:
c
c    John Burkardt
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      parameter ( k = 4 )
      parameter ( l = 3 )
      parameter ( m = 3 )
      parameter ( n = 2 )

      real alpha
      real beta
      real delta
      real f(k)
      real g(m)
      integer gamma
      real h(m)
      integer i
      integer iev2
      integer it
      integer itmax
      integer j
      integer k0
      real r(k,n)
      real rn
      integer seed
      real x(k,l)
      real xc(n)

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB1'
      write ( *, '(a)' ) '  Test TOMS algorithm 454, which'
      write ( *, '(a)' ) '  implements the complex method of'
      write ( *, '(a)' ) '  constrained optimization.'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  Here we consider the Box problem.'

      itmax = 100
      alpha = 1.3E+00
      beta = 0.001E+00
      gamma = 5
      delta = 0.0001E+00
      k0 = 6

      x(1,1) = 1.0E+00
      x(1,2) = 0.5E+00
      x(1,3) = x(1,1) + sqrt ( 3.0E+00 ) * x(1,2)

      do i = 2, k
        do j = 1, l
          x(i,j) = 0.0E+00
        end do
      end do

      seed = 123456789

      do i = 1, k
        do j = 1, n
          r(i,j) = rn ( seed )
        end do
      end do

      call jconsx ( n, m, k, itmax, alpha, beta, gamma, 
     &  delta, x, r, f, it, iev2, k0, g, h, xc, l )

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  The exact solution is:'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '    F(3.0000,1.7321) = 1.0000'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB1'
      write ( *, '(a)' ) '  Normal end of execution.'

      stop
      end
      subroutine jfunc ( n, m, k, x, f, i, l )

c***********************************************************************
c
cc JFUNC evaluates the function F(I) at X(I,1:L).
c
c  Discussion:
c
c    This is the objective function for the Box problem.
c
      implicit none

      integer k
      integer l

      real f(k)
      integer i
      integer m
      integer n
      real x(k,l)

      f(i) = ( 9.0E+00 - ( x(i,1) - 3.0E+00 )**2 ) * x(i,2)**3 
     &  / ( 27.0E+00 * sqrt ( 3.0E+00 ) )

      return
      end
      subroutine jcnst1 ( n, m, k, x, g, h, i, l )

c***********************************************************************
c
cc JCNST1 applies the constraints.
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      real g(m)
      real h(m)
      integer i
      real x(k,l)
c
c  Apparently, if you have "implicit variables", you need to set them
c  here, every time this routine is called.
c
      x(i,3) = x(i,1) + sqrt ( 3.0E+00 ) * x(i,2)

      g(1) = 0.0E+00
      g(2) = 0.0E+00
      g(3) = 0.0E+00

      h(1) = 100.0E+00
      h(2) = x(i,1) / sqrt ( 3.0E+00 )
      h(3) = 6.0E+00

      return
      end
      function rn ( seed )

c*******************************************************************************
c
cc RN returns a unit single precision pseudorandom number.
c
c  Discussion:
c
c    This routine implements the recursion
c
c      seed = 16807 * seed mod ( 2**31 - 1 )
c      rn = seed / ( 2**31 - 1 )
c
c    The integer arithmetic never requires more than 32 bits,
c    including a sign bit.
c
c    If the initial seed is 12345, then the first three computations are
c
c      Input     Output      RN
c      SEED      SEED
c
c         12345   207482415  0.096616
c     207482415  1790989824  0.833995
c    1790989824  2035175616  0.947702
c
c  Modified:
c
c    11 August 2004
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Paul Bratley, Bennett Fox, L E Schrage,
c    A Guide to Simulation,
c    Springer Verlag, pages 201-202, 1983.
c
c    Pierre L'Ecuyer,
c    Random Number Generation,
c    in Handbook of Simulation,
c    edited by Jerry Banks,
c    Wiley Interscience, page 95, 1998.
c
c    Bennett Fox,
c    Algorithm 647:
c    Implementation and Relative Efficiency of Quasirandom
c    Sequence Generators,
c    ACM Transactions on Mathematical Software,
c    Volume 12, Number 4, pages 362-376, 1986.
c
c    P A Lewis, A S Goodman, J M Miller,
c    A Pseudo-Random Number Generator for the System/360,
c    IBM Systems Journal,
c    Volume 8, pages 136-143, 1969.
c
c  Parameters:
c
c    Input/output, integer SEED, the "seed" value, which should NOT be 0.
c    On output, SEED has been updated.
c
c    Output, real RN, a new pseudorandom variate,
c    strictly between 0 and 1.
c
      implicit none

      integer k
      integer seed
      real rn

      k = seed / 127773

      seed = 16807 * ( seed - k * 127773 ) - k * 2836

      if ( seed < 0 ) then
        seed = seed + 2147483647
      end if
c
c  Although SEED can be represented exactly as a 32 bit integer,
c  it generally cannot be represented exactly as a 32 bit real number!
c
      rn = real ( dble ( seed ) * 4.656612875D-10 )

      return
      end
SHAR_EOF
fi # end of overwriting check
if test -f 'driver2.f'
then
	echo shar: will not over-write existing file "'driver2.f'"
else
cat << "SHAR_EOF" > 'driver2.f'
      program main

c***********************************************************************
c
cc TOMS454_PRB2 tests JCONSX, ACM TOMS algorithm 454.
c
c  Modified:
c
c    23 January 2006
c
c  Author:
c
c    John Burkardt
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      parameter ( k = 6 )

      parameter ( l = 4 )
      parameter ( m = 4 )
      parameter ( n = 3 )

      real alpha
      real beta
      real delta
      real f(k)
      real g(m)
      integer gamma
      real h(m)
      integer i
      integer iev2
      integer it
      integer itmax
      integer j
      integer k0
      real r(k,n)
      real rn
      integer seed
      real x(k,l)
      real xc(n)

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB2'
      write ( *, '(a)' ) '  Test TOMS algorithm 454, which'
      write ( *, '(a)' ) '  implements the complex method of'
      write ( *, '(a)' ) '  constrained optimization.'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  Here we consider the Post Office problem.'

      itmax = 100
      alpha = 1.3E+00
      beta = 0.01E+00
      gamma = 5
      delta = 0.0001E+00
      k0 = 6

      x(1,1) = 1.0E+00
      x(1,2) = 1.0E+00
      x(1,3) = 1.0E+00
      x(1,4) = x(1,1) + 2.0E+00 * x(1,2) + 2.0E+00 * x(1,3)

      do i = 2, k
        do j = 1, l
          x(i,j) = 0.0E+00
        end do
      end do

      seed = 123456789

      do i = 1, k
        do j = 1, n
          r(i,j) = rn ( seed )
        end do
      end do

      call jconsx ( n, m, k, itmax, alpha, beta, gamma, 
     &  delta, x, r, f, it, iev2, k0, g, h, xc, l )

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  The exact solution is:'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '    F(24,12,12) = 3456'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB2'
      write ( *, '(a)' ) '  Normal end of execution.'

      stop
      end
      subroutine jfunc ( n, m, k, x, f, i, l )

c***********************************************************************
c
cc JFUNC evaluates the function F(I) at X(I,1:L).
c
c  Discussion:
c
c    This is the objective function for the Post Office problem.
c
      implicit none

      integer k
      integer l

      real f(k)
      integer i
      integer m
      integer n
      real x(k,l)

      f(i) = x(i,1) * x(i,2) * x(i,3)

      return
      end
      subroutine jcnst1 ( n, m, k, x, g, h, i, l )

c***********************************************************************
c
cc JCNST1 applies the constraints.
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      real g(m)
      real h(m)
      integer i
      real x(k,l)
c
c  Apparently, if you have "implicit variables", you need to set them
c  here, every time this routine is called.
c
      x(i,4) = x(i,1) + 2.0E+00 * x(i,2) + 2.0E+00 * x(i,3)

      g(1) = 0.0E+00
      g(2) = 0.0E+00
      g(3) = 0.0E+00
      g(4) = 0.0E+00

      h(1) = 42.0E+00
      h(2) = 42.0E+00
      h(3) = 42.0E+00
      h(4) = 72.0E+00

      return
      end
      function rn ( seed )

c*******************************************************************************
c
cc RN returns a unit single precision pseudorandom number.
c
c  Discussion:
c
c    This routine implements the recursion
c
c      seed = 16807 * seed mod ( 2**31 - 1 )
c      rn = seed / ( 2**31 - 1 )
c
c    The integer arithmetic never requires more than 32 bits,
c    including a sign bit.
c
c    If the initial seed is 12345, then the first three computations are
c
c      Input     Output      RN
c      SEED      SEED
c
c         12345   207482415  0.096616
c     207482415  1790989824  0.833995
c    1790989824  2035175616  0.947702
c
c  Modified:
c
c    11 August 2004
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Paul Bratley, Bennett Fox, L E Schrage,
c    A Guide to Simulation,
c    Springer Verlag, pages 201-202, 1983.
c
c    Pierre L'Ecuyer,
c    Random Number Generation,
c    in Handbook of Simulation,
c    edited by Jerry Banks,
c    Wiley Interscience, page 95, 1998.
c
c    Bennett Fox,
c    Algorithm 647:
c    Implementation and Relative Efficiency of Quasirandom
c    Sequence Generators,
c    ACM Transactions on Mathematical Software,
c    Volume 12, Number 4, pages 362-376, 1986.
c
c    P A Lewis, A S Goodman, J M Miller,
c    A Pseudo-Random Number Generator for the System/360,
c    IBM Systems Journal,
c    Volume 8, pages 136-143, 1969.
c
c  Parameters:
c
c    Input/output, integer SEED, the "seed" value, which should NOT be 0.
c    On output, SEED has been updated.
c
c    Output, real RN, a new pseudorandom variate,
c    strictly between 0 and 1.
c
      implicit none

      integer k
      integer seed
      real rn

      k = seed / 127773

      seed = 16807 * ( seed - k * 127773 ) - k * 2836

      if ( seed < 0 ) then
        seed = seed + 2147483647
      end if
c
c  Although SEED can be represented exactly as a 32 bit integer,
c  it generally cannot be represented exactly as a 32 bit real number!
c
      rn = real ( dble ( seed ) * 4.656612875D-10 )

      return
      end
SHAR_EOF
fi # end of overwriting check
if test -f 'driver3.f'
then
	echo shar: will not over-write existing file "'driver3.f'"
else
cat << "SHAR_EOF" > 'driver3.f'
      program main

c***********************************************************************
c
cc TOMS454_PRB3 tests JCONSX, ACM TOMS algorithm 454.
c
c  Modified:
c
c    23 January 2006
c
c  Author:
c
c    John Burkardt
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      parameter ( k = 4 )
      parameter ( l = 3 )
      parameter ( m = 3 )
      parameter ( n = 2 )

      real alpha
      real beta
      real delta
      real f(k)
      real g(m)
      integer gamma
      real h(m)
      integer i
      integer iev2
      integer it
      integer itmax
      integer j
      integer k0
      real r(k,n)
      real rn
      integer seed
      real x(k,l)
      real xc(n)

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB3'
      write ( *, '(a)' ) '  Test TOMS algorithm 454, which'
      write ( *, '(a)' ) '  implements the complex method of'
      write ( *, '(a)' ) '  constrained optimization.'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  The Beveridge and Schechter problem.'

      itmax = 100
      alpha = 1.3E+00
      beta = 0.00001E+00
      gamma = 5
      delta = 0.0001E+00
      k0 = 6

      x(1,1) = 0.0E+00
      x(1,2) = 0.0E+00
      x(1,3) = x(1,1)**2 + 2.0E+00 * x(1,2)**2 - 4.0E+00

      do i = 2, k
        do j = 1, l
          x(i,j) = 0.0E+00
        end do
      end do

      seed = 123456789

      do i = 1, k
        do j = 1, n
          r(i,j) = rn ( seed )
        end do
      end do

      call jconsx ( n, m, k, itmax, alpha, beta, gamma, 
     &  delta, x, r, f, it, iev2, k0, g, h, xc, l )

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  The exact solution is:'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '    F(0.5,1.0) = 0.0'
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS454_PRB3'
      write ( *, '(a)' ) '  Normal end of execution.'

      stop
      end
      subroutine jfunc ( n, m, k, x, f, i, l )

c***********************************************************************
c
cc JFUNC evaluates the function F(I) at X(I,1:L).
c
c  Discussion:
c
c    This is the objective function for the Beveridge and Schechter problem.
c
      implicit none

      integer k
      integer l

      real f(k)
      integer i
      integer m
      integer n
      real x(k,l)

      f(i) = - ( x(i,1) - 0.5E+00 )**2 - ( x(i,2) - 1.0E+00 )**2

      return
      end
      subroutine jcnst1 ( n, m, k, x, g, h, i, l )

c***********************************************************************
c
cc JCNST1 applies the constraints.
c
      implicit none

      integer k
      integer l
      integer m
      integer n

      real g(m)
      real h(m)
      integer i
      real x(k,l)
c
c  Apparently, if you have "implicit variables", you need to set them
c  here, every time this routine is called.
c
      x(i,3) = x(i,1)**2 + 2.0E+00 * x(i,2)**2 - 4.0E+00

      g(1) = -2.0E+00
      g(2) = -sqrt ( 2.0E+00 )
      g(3) = -4.0E+00

      h(1) = 2.0E+00
      h(2) = sqrt ( 2.0E+00 )
      h(3) = 0.0E+00

      return
      end
      function rn ( seed )

c*******************************************************************************
c
cc RN returns a unit single precision pseudorandom number.
c
c  Discussion:
c
c    This routine implements the recursion
c
c      seed = 16807 * seed mod ( 2**31 - 1 )
c      rn = seed / ( 2**31 - 1 )
c
c    The integer arithmetic never requires more than 32 bits,
c    including a sign bit.
c
c    If the initial seed is 12345, then the first three computations are
c
c      Input     Output      RN
c      SEED      SEED
c
c         12345   207482415  0.096616
c     207482415  1790989824  0.833995
c    1790989824  2035175616  0.947702
c
c  Modified:
c
c    11 August 2004
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Paul Bratley, Bennett Fox, L E Schrage,
c    A Guide to Simulation,
c    Springer Verlag, pages 201-202, 1983.
c
c    Pierre L'Ecuyer,
c    Random Number Generation,
c    in Handbook of Simulation,
c    edited by Jerry Banks,
c    Wiley Interscience, page 95, 1998.
c
c    Bennett Fox,
c    Algorithm 647:
c    Implementation and Relative Efficiency of Quasirandom
c    Sequence Generators,
c    ACM Transactions on Mathematical Software,
c    Volume 12, Number 4, pages 362-376, 1986.
c
c    P A Lewis, A S Goodman, J M Miller,
c    A Pseudo-Random Number Generator for the System/360,
c    IBM Systems Journal,
c    Volume 8, pages 136-143, 1969.
c
c  Parameters:
c
c    Input/output, integer SEED, the "seed" value, which should NOT be 0.
c    On output, SEED has been updated.
c
c    Output, real RN, a new pseudorandom variate,
c    strictly between 0 and 1.
c
      implicit none

      integer k
      integer seed
      real rn

      k = seed / 127773

      seed = 16807 * ( seed - k * 127773 ) - k * 2836

      if ( seed < 0 ) then
        seed = seed + 2147483647
      end if
c
c  Although SEED can be represented exactly as a 32 bit integer,
c  it generally cannot be represented exactly as a 32 bit real number!
c
      rn = real ( dble ( seed ) * 4.656612875D-10 )

      return
      end
SHAR_EOF
fi # end of overwriting check
if test -f 'res1'
then
	echo shar: will not over-write existing file "'res1'"
else
cat << "SHAR_EOF" > 'res1'
 
TOMS454_PRB1
  Test TOMS algorithm 454, which
  implements the complex method of
  constrained optimization.
 
  Here we consider the Box problem.
 

 ITERATION        1
                 COORDINATES AT POINT   2
  3.5610    1.3250  
                 COORDINATES AT POINT   3
  3.5071    0.9335  
                 COORDINATES AT POINT   4
  4.1311    0.9642  
                      FUNCTION VALUES
    0.0134      0.4320      0.1521      0.1480  
                      CORRECTED POINT
  3.9551    1.1209  
                      FUNCTION VALUES
    0.2436      0.4320      0.1521      0.1480  
  CENTROID COORDINATES    3.7330    1.0743  
 

 ITERATION        2
                      CORRECTED POINT
  3.0806    1.3374  
                      FUNCTION VALUES
    0.2436      0.4320      0.1521      0.4600  
  CENTROID COORDINATES    3.6744    1.1265  
 

 ITERATION        3
                      CORRECTED POINT
  3.5404    1.3676  
                      FUNCTION VALUES
    0.2436      0.4320      0.4763      0.4600  
  CENTROID COORDINATES    3.5322    1.2611  
 

 ITERATION        4
                      CORRECTED POINT
  2.6646    1.5383  
                      FUNCTION VALUES
    0.6918      0.4320      0.4763      0.4600  
  CENTROID COORDINATES    3.3940    1.3433  
 

 ITERATION        5
                      CORRECTED POINT
  2.4897    1.4373  
                      FUNCTION VALUES
    0.6918      0.5549      0.4763      0.4600  
  CENTROID COORDINATES    3.0952    1.4144  
 

 ITERATION        6
                      CORRECTED POINT
  2.6611    1.5363  
                      FUNCTION VALUES
    0.6918      0.5549      0.4763      0.6889  
  CENTROID COORDINATES    2.8982    1.4477  
 

 ITERATION        7
                      CORRECTED POINT
  2.5291    1.4601  
                      FUNCTION VALUES
    0.6918      0.5549      0.5843      0.6889  
  CENTROID COORDINATES    2.6051    1.5040  
 

 ITERATION        8
                      CORRECTED POINT
  2.7854    1.6081  
                      FUNCTION VALUES
    0.6918      0.7961      0.5843      0.6889  
  CENTROID COORDINATES    2.6183    1.5116  
 

 ITERATION        9
                      CORRECTED POINT
  2.9306    1.6919  
                      FUNCTION VALUES
    0.6918      0.7961      0.9316      0.6889  
  CENTROID COORDINATES    2.7037    1.5609  
 

 ITERATION       10
                      CORRECTED POINT
  2.9657    1.7121  
                      FUNCTION VALUES
    0.6918      0.7961      0.9316      0.9658  
  CENTROID COORDINATES    2.7935    1.6127  
 

 ITERATION       11
                      CORRECTED POINT
  2.9684    1.7137  
                      FUNCTION VALUES
    0.9685      0.7961      0.9316      0.9658  
  CENTROID COORDINATES    2.8939    1.6707  
 

 ITERATION       12
                      CORRECTED POINT
  2.9825    1.7218  
                      FUNCTION VALUES
    0.9685      0.9824      0.9316      0.9658  
  CENTROID COORDINATES    2.9549    1.7059  
 

 ITERATION       13
                      CORRECTED POINT
  2.9992    1.7315  
                      FUNCTION VALUES
    0.9685      0.9824      0.9990      0.9658  
  CENTROID COORDINATES    2.9722    1.7159  
 

 ITERATION       14
                      CORRECTED POINT
  2.9949    1.7290  
                      FUNCTION VALUES
    0.9685      0.9824      0.9990      0.9947  
  CENTROID COORDINATES    2.9834    1.7224  
 

 ITERATION       15
                      CORRECTED POINT
  2.9999    1.7319  
                      FUNCTION VALUES
    0.9997      0.9824      0.9990      0.9947  
  CENTROID COORDINATES    2.9922    1.7274  
 

 ITERATION       16
                      CORRECTED POINT
  2.9993    1.7315  
                      FUNCTION VALUES
    0.9997      0.9991      0.9990      0.9947  
  CENTROID COORDINATES    2.9980    1.7308  
 

 ITERATION       17
                      CORRECTED POINT
  2.9998    1.7319  
                      FUNCTION VALUES
    0.9997      0.9991      0.9990      0.9997  
  CENTROID COORDINATES    2.9995    1.7316  
 

 ITERATION       18
                      CORRECTED POINT
  3.0000    1.7319  
                      FUNCTION VALUES
    0.9997      0.9991      0.9998      0.9997  
  CENTROID COORDINATES    2.9997    1.7318  
 

 ITERATION       19
                      CORRECTED POINT
  3.0000    1.7319  
                      FUNCTION VALUES
    0.9997      0.9998      0.9998      0.9997  
  CENTROID COORDINATES    2.9999    1.7319  
 

 ITERATION       20
                      CORRECTED POINT
  3.0000    1.7320  
                      FUNCTION VALUES
    0.9997      0.9998      0.9998      0.9999  
  CENTROID COORDINATES    2.9999    1.7319  
 

 ITERATION       21
 
  The exact solution is:
 
    F(3.0000,1.7321) = 1.0000
 
TOMS454_PRB1
  Normal end of execution.
SHAR_EOF
fi # end of overwriting check
if test -f 'res2'
then
	echo shar: will not over-write existing file "'res2'"
else
cat << "SHAR_EOF" > 'res2'
 
TOMS454_PRB2
  Test TOMS algorithm 454, which
  implements the complex method of
  constrained optimization.
 
  Here we consider the Post Office problem.
 

 ITERATION        1
                 COORDINATES AT POINT   2
 23.5912   17.4429    2.7770  
                 COORDINATES AT POINT   3
 10.8183    4.6182    1.8408  
                 COORDINATES AT POINT   4
 26.6266    2.5925   18.8806  
                 COORDINATES AT POINT   5
 15.8455   12.7341   12.9650  
                 COORDINATES AT POINT   6
 11.7015   15.1820    9.3024  
                      FUNCTION VALUES
    1.0000   1142.7274     91.9687   1303.3401   2616.0491   1652.5928  
                      CORRECTED POINT
 20.4331   12.0600   10.4781  
                      FUNCTION VALUES
 2582.0210   1142.7274     91.9687   1303.3401   2616.0491   1652.5928  
  CENTROID COORDINATES   17.7166   10.5139    9.1532  
 

 ITERATION        2
                      CORRECTED POINT
 20.3563   12.6023   11.6151  
                      FUNCTION VALUES
 2582.0210   1142.7274   2979.6816   1303.3401   2616.0491   1652.5928  
  CENTROID COORDINATES   19.6396   12.0023   10.8806  
 

 ITERATION        3
                      CORRECTED POINT
 16.0035    6.8685   19.0645  
                      FUNCTION VALUES
 2582.0210   2095.5706   2979.6816   1303.3401   2616.0491   1652.5928  
  CENTROID COORDINATES   18.9926   11.0342   12.6482  
 

 ITERATION        4
                      CORRECTED POINT
 13.6964   14.9108   10.6714  
                      FUNCTION VALUES
 2582.0210   2095.5706   2979.6816   2179.3738   2616.0491   1652.5928  
  CENTROID COORDINATES   16.8680   11.8894   12.6850  
 

 ITERATION        5
                      CORRECTED POINT
 20.8845    9.6597   15.3355  
                      FUNCTION VALUES
 2582.0210   2095.5706   2979.6816   2179.3738   2616.0491   3093.7449  
  CENTROID COORDINATES   17.2669   11.8351   12.9588  
 

 ITERATION        6
                      CORRECTED POINT
 19.6989   15.9845    7.7595  
                      FUNCTION VALUES
 2582.0210   2443.3030   2979.6816   2179.3738   2616.0491   3093.7449  
  CENTROID COORDINATES   18.2431   12.3934   12.2130  
 

 ITERATION        7
                      CORRECTED POINT
 26.9150    9.6146   12.8776  
                      FUNCTION VALUES
 2582.0210   2443.3030   2979.6816   3332.4204   2616.0491   3093.7449  
  CENTROID COORDINATES   19.4436   12.6081   11.6306  
 

 ITERATION        8
                      CORRECTED POINT
 21.6590    8.3114   15.8358  
                      FUNCTION VALUES
 2582.0210   2850.6958   2979.6816   3332.4204   2616.0491   3093.7449  
  CENTROID COORDINATES   20.8869   11.3341   12.6542  
 

 ITERATION        9
                      CORRECTED POINT
 21.3592   10.1049   14.7813  
                      FUNCTION VALUES
 3190.2761   2850.6958   2979.6816   3332.4204   2616.0491   3093.7449  
  CENTROID COORDINATES   21.1321   10.5844   13.7258  
 

 ITERATION       10
                      CORRECTED POINT
 24.3113    9.1890   14.4544  
                      FUNCTION VALUES
 3190.2761   2850.6958   2979.6816   3332.4204   3229.0608   3093.7449  
  CENTROID COORDINATES   22.2348   10.0586   14.0890  
 

 ITERATION       11
                      CORRECTED POINT
 23.4843   11.4838   12.4978  
                      FUNCTION VALUES
 3190.2761   3370.5369   2979.6816   3332.4204   3229.0608   3093.7449  
  CENTROID COORDINATES   22.7653   10.2341   13.8128  
 

 ITERATION       12
                      CORRECTED POINT
 23.8840    9.5892   14.3751  
                      FUNCTION VALUES
 3190.2761   3370.5369   3292.3171   3332.4204   3229.0608   3093.7449  
  CENTROID COORDINATES   23.3909   10.0104   13.9893  
 

 ITERATION       13
                      CORRECTED POINT
 25.0004   10.1057   13.2973  
                      FUNCTION VALUES
 3190.2761   3370.5369   3292.3171   3332.4204   3229.0608   3359.5083  
  CENTROID COORDINATES   23.9908    9.9963   13.7972  
 

 ITERATION       14
                      CORRECTED POINT
 25.8109    9.9612   13.0841  
                      FUNCTION VALUES
 3364.0542   3370.5369   3292.3171   3332.4204   3229.0608   3359.5083  
  CENTROID COORDINATES   24.7190    9.9965   13.5004  
 

 ITERATION       15
                      CORRECTED POINT
 25.4789   10.7762   12.4282  
                      FUNCTION VALUES
 3364.0542   3370.5369   3292.3171   3332.4204   3412.3430   3359.5083  
  CENTROID COORDINATES   25.0189   10.1509   13.2264  
 

 ITERATION       16
                      CORRECTED POINT
 27.2280   11.4271   10.8374  
                      FUNCTION VALUES
 3364.0542   3370.5369   3371.9409   3332.4204   3412.3430   3359.5083  
  CENTROID COORDINATES   25.3379   10.3883   12.8370  
 

 ITERATION       17
                      CORRECTED POINT
 23.4316   12.2279   11.8458  
                      FUNCTION VALUES
 3364.0542   3370.5369   3371.9409   3394.0557   3412.3430   3359.5083  
  CENTROID COORDINATES   25.4005   10.7508   12.4290  
 

 ITERATION       18
                      CORRECTED POINT
 25.1991   12.5657   10.6325  
                      FUNCTION VALUES
 3364.0542   3370.5369   3371.9409   3394.0557   3412.3430   3366.7078  
  CENTROID COORDINATES   25.0867   11.1753   12.1387  
 

 ITERATION       19
                      CORRECTED POINT
 24.6892   12.2600   11.1817  
                      FUNCTION VALUES
 3384.5913   3370.5369   3371.9409   3394.0557   3412.3430   3366.7078  
  CENTROID COORDINATES   24.9644   11.6962   11.6483  
 

 ITERATION       20
                      CORRECTED POINT
 24.6436   11.0301   12.4899  
                      FUNCTION VALUES
 3384.5913   3370.5369   3371.9409   3394.0557   3412.3430   3395.0100  
  CENTROID COORDINATES   24.8624   11.6350   11.7582  
 

 ITERATION       21
                      CORRECTED POINT
 26.1407   11.5835   11.2748  
                      FUNCTION VALUES
 3384.5913   3414.0391   3371.9409   3394.0557   3412.3430   3395.0100  
  CENTROID COORDINATES   25.0943   11.5443   11.7566  
 

 ITERATION       22
                      CORRECTED POINT
 23.3485   11.6720   12.4984  
                      FUNCTION VALUES
 3384.5913   3414.0391   3406.1145   3394.0557   3412.3430   3395.0100  
  CENTROID COORDINATES   24.8768   11.5755   11.8441  
 

 ITERATION       23
                      CORRECTED POINT
 24.5039   10.4153   13.3109  
                      FUNCTION VALUES
 3397.1235   3414.0391   3406.1145   3394.0557   3412.3430   3395.0100  
  CENTROID COORDINATES   24.6087   11.4579   12.1074  
 

 ITERATION       24
                      CORRECTED POINT
 25.7276   10.3593   12.7610  
                      FUNCTION VALUES
 3397.1235   3414.0391   3406.1145   3401.0393   3412.3430   3395.0100  
  CENTROID COORDINATES   24.8231   11.0954   12.4004  
 

 ITERATION       25
                      CORRECTED POINT
 25.2975   10.9165   12.4317  
                      FUNCTION VALUES
 3397.1235   3414.0391   3406.1145   3401.0393   3412.3430   3433.1587  
  CENTROID COORDINATES   25.0399   10.9612   12.4546  
 

 ITERATION       26
                      CORRECTED POINT
 25.6502   11.4816   11.6080  
                      FUNCTION VALUES
 3418.6082   3414.0391   3406.1145   3401.0393   3412.3430   3433.1587  
  CENTROID COORDINATES   25.1986   11.0615   12.2788  
 

 ITERATION       27
                      CORRECTED POINT
 24.8293   11.8883   11.5850  
                      FUNCTION VALUES
 3418.6082   3414.0391   3406.1145   3419.6272   3412.3430   3433.1587  
  CENTROID COORDINATES   25.1832   11.2860   12.0482  
 

 ITERATION       28
                      CORRECTED POINT
 26.8644   11.1064   11.4542  
                      FUNCTION VALUES
 3418.6082   3414.0391   3417.5437   3419.6272   3412.3430   3433.1587  
  CENTROID COORDINATES   25.4793   11.3292   11.8655  
 

 ITERATION       29
                      CORRECTED POINT
 25.9368   11.7977   11.1784  
                      FUNCTION VALUES
 3418.6082   3414.0391   3417.5437   3419.6272   3420.5251   3433.1587  
  CENTROID COORDINATES   25.7564   11.3953   11.6707  
 

 ITERATION       30
                      CORRECTED POINT
 25.1631   11.2490   12.1411  
                      FUNCTION VALUES
 3418.6082   3436.6455   3417.5437   3419.6272   3420.5251   3433.1587  
  CENTROID COORDINATES   25.7157   11.4381   11.6515  
 

 ITERATION       31
                      CORRECTED POINT
 23.4398   11.9349   12.2239  
                      FUNCTION VALUES
 3418.6082   3436.6455   3419.6353   3419.6272   3420.5251   3433.1587  
  CENTROID COORDINATES   25.3754   11.4666   11.7888  
 

 ITERATION       32
                      CORRECTED POINT
 24.0013   11.6557   12.3072  
                      FUNCTION VALUES
 3442.9688   3436.6455   3419.6353   3419.6272   3420.5251   3433.1587  
  CENTROID COORDINATES   24.9333   11.5573   11.9120  
 

 ITERATION       33
                      CORRECTED POINT
 24.7277   11.2653   12.3629  
                      FUNCTION VALUES
 3442.9688   3436.6455   3419.6353   3443.8894   3420.5251   3433.1587  
  CENTROID COORDINATES   24.7677   11.5107   12.0565  
 

 ITERATION       34
                      CORRECTED POINT
 25.2829   11.2862   12.0616  
                      FUNCTION VALUES
 3442.9688   3436.6455   3441.7415   3443.8894   3420.5251   3433.1587  
  CENTROID COORDINATES   25.0253   11.3768   12.0843  
 

 ITERATION       35
                      CORRECTED POINT
 24.5558   11.1045   12.6127  
                      FUNCTION VALUES
 3442.9688   3436.6455   3441.7415   3443.8894   3439.2385   3433.1587  
  CENTROID COORDINATES   24.8945   11.2745   12.2609  
 

 ITERATION       36
                      CORRECTED POINT
 24.0294   11.8265   12.1221  
                      FUNCTION VALUES
 3442.9688   3436.6455   3441.7415   3443.8894   3439.2385   3444.8845  
  CENTROID COORDINATES   24.7462   11.3121   12.2971  
 

 ITERATION       37
                      CORRECTED POINT
 23.6826   11.6599   12.4912  
                      FUNCTION VALUES
 3442.9688   3449.2800   3441.7415   3443.8894   3439.2385   3444.8845  
  CENTROID COORDINATES   24.5194   11.4276   12.2933  
 

 ITERATION       38
                      CORRECTED POINT
 24.0705   12.1031   11.8222  
                      FUNCTION VALUES
 3442.9688   3449.2800   3441.7415   3443.8894   3444.1431   3444.8845  
  CENTROID COORDINATES   24.3448   11.5387   12.2690  
 

 ITERATION       39
                      CORRECTED POINT
 23.3349   11.9725   12.3248  
                      FUNCTION VALUES
 3442.9688   3449.2800   3443.2625   3443.8894   3444.1431   3444.8845  
  CENTROID COORDINATES   24.1023   11.7021   12.2211  
 

 ITERATION       40
                      CORRECTED POINT
 23.9270   11.9082   12.1173  
                      FUNCTION VALUES
 3452.5444   3449.2800   3443.2625   3443.8894   3444.1431   3444.8845  
  CENTROID COORDINATES   23.9690   11.7655   12.2247  
 

 ITERATION       41
                      CORRECTED POINT
 25.0658   11.4668   11.9990  
                      FUNCTION VALUES
 3452.5444   3449.2800   3448.7795   3443.8894   3444.1431   3444.8845  
  CENTROID COORDINATES   24.0874   11.7526   12.1831  
 

 ITERATION       42
                      CORRECTED POINT
 23.7828   12.1358   11.9462  
                      FUNCTION VALUES
 3452.5444   3449.2800   3448.7795   3447.9460   3444.1431   3444.8845  
  CENTROID COORDINATES   24.1551   11.7929   12.1104  
 

 ITERATION       43
                      CORRECTED POINT
 24.1151   11.6020   12.3386  
                      FUNCTION VALUES
 3452.5444   3449.2800   3448.7795   3447.9460   3452.1223   3444.8845  
  CENTROID COORDINATES   24.0975   11.7994   12.1351  
 

 ITERATION       44
                      CORRECTED POINT
 24.1424   11.7311   12.1968  
                      FUNCTION VALUES
 3452.5444   3449.2800   3448.7795   3447.9460   3452.1223   3454.3376  
  CENTROID COORDINATES   24.1147   11.7545   12.1785  
 

 ITERATION       45
                      CORRECTED POINT
 24.2522   11.5985   12.2745  
                      FUNCTION VALUES
 3452.5444   3449.2800   3448.7795   3452.6606   3452.1223   3454.3376  
  CENTROID COORDINATES   24.1866   11.6736   12.2286  
 

 ITERATION       46
                      CORRECTED POINT
 23.3466   11.8515   12.4687  
                      FUNCTION VALUES
 3452.5444   3449.2800   3449.9966   3452.6606   3452.1223   3454.3376  
  CENTROID COORDINATES   24.0239   11.6999   12.2837  
 

 ITERATION       47
                      CORRECTED POINT
 24.1348   11.7892   12.1413  
                      FUNCTION VALUES
 3452.5444   3454.5659   3449.9966   3452.6606   3452.1223   3454.3376  
  CENTROID COORDINATES   23.9567   11.7382   12.2792  
 

 ITERATION       48
                      CORRECTED POINT
 24.6133   11.6441   12.0479  
                      FUNCTION VALUES
 3452.5444   3454.5659   3452.9214   3452.6606   3452.1223   3454.3376  
  CENTROID COORDINATES   24.1143   11.7258   12.2137  
 

 ITERATION       49
                      CORRECTED POINT
 24.3424   11.9061   11.9176  
                      FUNCTION VALUES
 3452.5444   3454.5659   3452.9214   3452.6606   3454.0056   3454.3376  
  CENTROID COORDINATES   24.2139   11.7342   12.1556  
 

 ITERATION       50
                      CORRECTED POINT
 24.3571   11.7055   12.1153  
                      FUNCTION VALUES
 3454.2239   3454.5659   3452.9214   3452.6606   3454.0056   3454.3376  
  CENTROID COORDINATES   24.2970   11.7338   12.1156  
 

 ITERATION       51
                      CORRECTED POINT
 24.4036   11.9589   11.8359  
                      FUNCTION VALUES
 3454.2239   3454.5659   3452.9214   3454.2070   3454.0056   3454.3376  
  CENTROID COORDINATES   24.3180   11.7552   12.0838  
 

 ITERATION       52
                      CORRECTED POINT
 23.8377   12.0444   12.0329  
                      FUNCTION VALUES
 3454.2239   3454.5659   3454.7998   3454.2070   3454.0056   3454.3376  
  CENTROID COORDINATES   24.2761   11.8182   12.0414  
 

 ITERATION       53
                      CORRECTED POINT
 24.0664   11.8067   12.1599  
                      FUNCTION VALUES
 3454.2239   3454.5659   3454.7998   3454.2070   3455.1572   3454.3376  
  CENTROID COORDINATES   24.1751   11.8458   12.0645  
 

 ITERATION       54
                      CORRECTED POINT
 24.0115   11.7687   12.2246  
                      FUNCTION VALUES
 3454.2239   3454.5659   3454.7998   3454.4817   3455.1572   3454.3376  
  CENTROID COORDINATES   24.1077   11.8154   12.1293  
 

 ITERATION       55
                      CORRECTED POINT
 23.8315   11.9077   12.1744  
                      FUNCTION VALUES
 3454.8123   3454.5659   3454.7998   3454.4817   3455.1572   3454.3376  
  CENTROID COORDINATES   24.0386   11.8280   12.1511  
 

 ITERATION       56
                      CORRECTED POINT
 23.7605   12.0352   12.0814  
                      FUNCTION VALUES
 3454.8123   3454.5659   3454.7998   3454.4817   3455.1572   3454.8481  
  CENTROID COORDINATES   23.9764   11.8633   12.1466  
 

 ITERATION       57
                      CORRECTED POINT
 23.8152   12.1089   11.9794  
                      FUNCTION VALUES
 3454.8123   3454.5659   3454.7998   3454.5930   3455.1572   3454.8481  
  CENTROID COORDINATES   23.9262   11.9166   12.1180  
 

 ITERATION       58
                      CORRECTED POINT
 23.6851   12.1050   12.0494  
                      FUNCTION VALUES
 3454.8123   3454.6646   3454.7998   3454.5930   3455.1572   3454.8481  
  CENTROID COORDINATES   23.8623   11.9806   12.0856  
 

 ITERATION       59
                      CORRECTED POINT
 23.8499   11.8959   12.1777  
                      FUNCTION VALUES
 3454.8123   3454.6646   3454.7998   3455.0059   3455.1572   3454.8481  
  CENTROID COORDINATES   23.8362   11.9798   12.0996  
 

 ITERATION       60
                      CORRECTED POINT
 23.9888   11.8294   12.1746  
                      FUNCTION VALUES
 3454.8123   3454.8301   3454.7998   3455.0059   3455.1572   3454.8481  
  CENTROID COORDINATES   23.8692   11.9380   12.1253  
 

 ITERATION       61
                      CORRECTED POINT
 23.9195   11.8464   12.1928  
                      FUNCTION VALUES
 3454.8123   3454.8301   3454.9512   3455.0059   3455.1572   3454.8481  
  CENTROID COORDINATES   23.8994   11.8950   12.1536  
 

 ITERATION       62
                      CORRECTED POINT
 24.0282   11.8502   12.1351  
                      FUNCTION VALUES
 3455.3569   3454.8301   3454.9512   3455.0059   3455.1572   3454.8481  
  CENTROID COORDINATES   23.9170   11.8827   12.1573  
 

 ITERATION       63
                      CORRECTED POINT
 23.8418   11.9616   12.1167  
                      FUNCTION VALUES
 3455.3569   3455.4924   3454.9512   3455.0059   3455.1572   3454.8481  
  CENTROID COORDINATES   23.9249   11.8869   12.1494  
 

 ITERATION       64
                      CORRECTED POINT
 23.9999   11.8191   12.1808  
                      FUNCTION VALUES
 3455.3569   3455.4924   3454.9512   3455.0059   3455.1572   3455.1851  
  CENTROID COORDINATES   23.9412   11.8721   12.1564  
 

 ITERATION       65
                      CORRECTED POINT
 24.0063   11.8931   12.1036  
                      FUNCTION VALUES
 3455.3569   3455.4924   3455.7019   3455.0059   3455.1572   3455.1851  
  CENTROID COORDINATES   23.9572   11.8667   12.1540  
 

 ITERATION       66
                      CORRECTED POINT
 24.0336   11.8565   12.1267  
                      FUNCTION VALUES
 3455.3569   3455.4924   3455.7019   3455.5510   3455.1572   3455.1851  
  CENTROID COORDINATES   23.9885   11.8661   12.1392  
 

 ITERATION       67
                      CORRECTED POINT
 23.8722   11.9664   12.0971  
                      FUNCTION VALUES
 3455.3569   3455.4924   3455.7019   3455.5510   3455.7021   3455.1851  
  CENTROID COORDINATES   23.9820   11.8761   12.1326  
 

 ITERATION       68
                      CORRECTED POINT
 23.9000   12.0179   12.0314  
                      FUNCTION VALUES
 3455.3569   3455.4924   3455.7019   3455.5510   3455.7021   3455.7339  
  CENTROID COORDINATES   23.9564   11.9056   12.1158  
 

 ITERATION       69
                      CORRECTED POINT
 23.8041   12.0546   12.0431  
                      FUNCTION VALUES
 3455.7339   3455.4924   3455.7019   3455.5510   3455.7021   3455.7339  
  CENTROID COORDINATES   23.9308   11.9391   12.0951  
 

 ITERATION       70
                      CORRECTED POINT
 23.9497   11.9564   12.0686  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.7019   3455.5510   3455.7021   3455.7339  
  CENTROID COORDINATES   23.9232   11.9577   12.0804  
 

 ITERATION       71
                      CORRECTED POINT
 23.8651   12.0171   12.0499  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.7019   3455.7786   3455.7021   3455.7339  
  CENTROID COORDINATES   23.9064   11.9777   12.0687  
 

 ITERATION       72
                      CORRECTED POINT
 23.8366   12.0380   12.0432  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.7278   3455.7786   3455.7021   3455.7339  
  CENTROID COORDINATES   23.8782   12.0025   12.0580  
 

 ITERATION       73
                      CORRECTED POINT
 23.8696   12.0823   11.9824  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.7278   3455.7786   3455.7285   3455.7339  
  CENTROID COORDINATES   23.8711   12.0168   12.0472  
 

 ITERATION       74
                      CORRECTED POINT
 23.9311   12.0096   12.0245  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.8877   3455.7786   3455.7285   3455.7339  
  CENTROID COORDINATES   23.8777   12.0257   12.0351  
 

 ITERATION       75
                      CORRECTED POINT
 23.9032   11.9648   12.0832  
                      FUNCTION VALUES
 3455.7339   3455.8701   3455.8877   3455.7786   3455.7720   3455.7339  
  CENTROID COORDINATES   23.8900   12.0111   12.0435  
 

 ITERATION       76
                      CORRECTED POINT
 23.9786   11.9532   12.0570  
                      FUNCTION VALUES
 3455.7998   3455.8701   3455.8877   3455.7786   3455.7720   3455.7339  
  CENTROID COORDINATES   23.9098   11.9932   12.0515  
 

 ITERATION       77
                      CORRECTED POINT
 23.9422   11.9557   12.0731  
                      FUNCTION VALUES
 3455.7998   3455.8701   3455.8877   3455.7786   3455.7720   3455.8806  
  CENTROID COORDINATES   23.9256   11.9802   12.0567  
 

 ITERATION       78
                      CORRECTED POINT
 23.9725   11.9961   12.0175  
                      FUNCTION VALUES
 3455.7998   3455.8701   3455.8877   3455.7786   3455.9319   3455.8806  
  CENTROID COORDINATES   23.9333   11.9784   12.0546  
 

 ITERATION       79
                      CORRECTED POINT
 24.0131   11.9464   12.0470  
                      FUNCTION VALUES
 3455.7998   3455.8701   3455.8877   3455.9097   3455.9319   3455.8806  
  CENTROID COORDINATES   23.9548   11.9742   12.0481  
 

 ITERATION       80
                      CORRECTED POINT
 23.9562   11.9792   12.0426  
                      FUNCTION VALUES
 3455.9458   3455.8701   3455.8877   3455.9097   3455.9319   3455.8806  
  CENTROID COORDINATES   23.9617   11.9728   12.0461  
 

 ITERATION       81
                      CORRECTED POINT
 23.9804   12.0047   12.0050  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.8877   3455.9097   3455.9319   3455.8806  
  CENTROID COORDINATES   23.9630   11.9774   12.0409  
 

 ITERATION       82
                      CORRECTED POINT
 24.0077   12.0280   11.9678  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.8877   3455.9097   3455.9319   3455.8933  
  CENTROID COORDINATES   23.9707   11.9872   12.0273  
 

 ITERATION       83
                      CORRECTED POINT
 24.0216   11.9787   12.0104  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.9697   3455.9097   3455.9319   3455.8933  
  CENTROID COORDINATES   23.9860   11.9909   12.0160  
 

 ITERATION       84
                      CORRECTED POINT
 23.9765   11.9504   12.0613  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.9697   3455.9097   3455.9319   3455.9187  
  CENTROID COORDINATES   23.9888   11.9810   12.0245  
 

 ITERATION       85
                      CORRECTED POINT
 23.9403   12.0279   12.0018  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.9697   3455.9458   3455.9319   3455.9187  
  CENTROID COORDINATES   23.9815   11.9818   12.0274  
 

 ITERATION       86
                      CORRECTED POINT
 23.9735   12.0125   12.0005  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.9697   3455.9458   3455.9319   3455.9482  
  CENTROID COORDINATES   23.9742   11.9973   12.0155  
 

 ITERATION       87
                      CORRECTED POINT
 23.9757   12.0036   12.0086  
                      FUNCTION VALUES
 3455.9458   3455.9524   3455.9697   3455.9458   3455.9812   3455.9482  
  CENTROID COORDINATES   23.9744   12.0006   12.0121  
 

 ITERATION       88
                      CORRECTED POINT
 23.9926   12.0225   11.9810  
                      FUNCTION VALUES
 3455.9485   3455.9524   3455.9697   3455.9458   3455.9812   3455.9482  
  CENTROID COORDINATES   23.9783   12.0055   12.0053  
 

 ITERATION       89
                      CORRECTED POINT
 24.0518   11.9738   12.0001  
                      FUNCTION VALUES
 3455.9485   3455.9524   3455.9697   3455.9485   3455.9812   3455.9482  
  CENTROID COORDINATES   23.9888   12.0044   12.0011  
 

 ITERATION       90
                      CORRECTED POINT
 24.0447   11.9760   12.0016  
                      FUNCTION VALUES
 3455.9485   3455.9524   3455.9697   3455.9485   3455.9812   3455.9753  
  CENTROID COORDINATES   24.0044   11.9967   12.0010  
 

 ITERATION       91
                      CORRECTED POINT
 24.0293   11.9645   12.0208  
                      FUNCTION VALUES
 3455.9614   3455.9524   3455.9697   3455.9485   3455.9812   3455.9753  
  CENTROID COORDINATES   24.0148   11.9874   12.0051  
 

 ITERATION       92
                      CORRECTED POINT
 23.9564   12.0006   12.0212  
                      FUNCTION VALUES
 3455.9614   3455.9524   3455.9697   3455.9844   3455.9812   3455.9753  
  CENTROID COORDINATES   24.0103   11.9855   12.0093  
 

 ITERATION       93
                      CORRECTED POINT
 24.0137   11.9782   12.0150  
                      FUNCTION VALUES
 3455.9614   3455.9871   3455.9697   3455.9844   3455.9812   3455.9753  
  CENTROID COORDINATES   24.0055   11.9847   12.0125  
 

 ITERATION       94
                      CORRECTED POINT
 23.9675   12.0172   11.9990  
                      FUNCTION VALUES
 3455.9863   3455.9871   3455.9697   3455.9844   3455.9812   3455.9753  
  CENTROID COORDINATES   24.0024   11.9874   12.0113  
 

 ITERATION       95
                      CORRECTED POINT
 23.9818   12.0004   12.0086  
                      FUNCTION VALUES
 3455.9863   3455.9871   3455.9939   3455.9844   3455.9812   3455.9753  
  CENTROID COORDINATES   23.9916   11.9951   12.0091  
 

 ITERATION       96
                      CORRECTED POINT
 23.9577   12.0078   12.0133  
                      FUNCTION VALUES
 3455.9863   3455.9871   3455.9939   3455.9844   3455.9812   3455.9871  
  CENTROID COORDINATES   23.9790   12.0000   12.0105  
 

 ITERATION       97
                      CORRECTED POINT
 23.9754   12.0000   12.0124  
                      FUNCTION VALUES
 3455.9863   3455.9871   3455.9939   3455.9844   3455.9961   3455.9871  
  CENTROID COORDINATES   23.9754   12.0008   12.0114  
 

 ITERATION       98
                      CORRECTED POINT
 24.0088   12.0009   11.9947  
                      FUNCTION VALUES
 3455.9863   3455.9871   3455.9939   3455.9951   3455.9961   3455.9871  
  CENTROID COORDINATES   23.9792   12.0007   12.0097  
 

 ITERATION       99
                      CORRECTED POINT
 24.0005   11.9846   12.0152  
                      FUNCTION VALUES
 3455.9927   3455.9871   3455.9939   3455.9951   3455.9961   3455.9871  
  CENTROID COORDINATES   23.9875   11.9974   12.0088  
 

 ITERATION      100
                      CORRECTED POINT
 23.9661   12.0121   12.0049  
                      FUNCTION VALUES
 3455.9927   3455.9924   3455.9939   3455.9951   3455.9961   3455.9871  
  CENTROID COORDINATES   23.9848   11.9987   12.0088  
 
  The exact solution is:
 
    F(24,12,12) = 3456
 
TOMS454_PRB2
  Normal end of execution.
SHAR_EOF
fi # end of overwriting check
if test -f 'res3'
then
	echo shar: will not over-write existing file "'res3'"
else
cat << "SHAR_EOF" > 'res3'
 
TOMS454_PRB3
  Test TOMS algorithm 454, which
  implements the complex method of
  constrained optimization.
 
  The Beveridge and Schechter problem.
 

 ITERATION        1
                 COORDINATES AT POINT   2
  1.3180    0.1745
                 COORDINATES AT POINT   3
 -0.3388   -1.2272
                 COORDINATES AT POINT   4
 -0.9697   -1.1032
                      FUNCTION VALUES
   -1.2500     -1.3506     -5.6640     -6.5835
                      CORRECTED POINT
  1.1632    0.1381
                      FUNCTION VALUES
   -1.2500     -1.3506     -5.6640     -1.1827
  CENTROID COORDINATES    0.3264   -0.3509
 

 ITERATION        2
                      CORRECTED POINT
  1.4135    0.7592
                      FUNCTION VALUES
   -1.2500     -1.3506     -0.8925     -1.1827
  CENTROID COORDINATES    0.8271    0.1042
 

 ITERATION        3
                      CORRECTED POINT
  0.2620    0.4610
                      FUNCTION VALUES
   -1.2500     -0.3471     -0.8925     -1.1827
  CENTROID COORDINATES    0.8589    0.2991
 

 ITERATION        4
                      CORRECTED POINT
  1.4731    0.7471
                      FUNCTION VALUES
   -1.0108     -0.3471     -0.8925     -1.1827
  CENTROID COORDINATES    0.9462    0.4528
 

 ITERATION        5
                      CORRECTED POINT
  0.9756    0.9922
                      FUNCTION VALUES
   -1.0108     -0.3471     -0.8925     -0.2263
  CENTROID COORDINATES    1.0495    0.6558
 

 ITERATION        6
                      CORRECTED POINT
  0.1175    0.7250
                      FUNCTION VALUES
   -0.2219     -0.3471     -0.8925     -0.2263
  CENTROID COORDINATES    0.8837    0.7375
 

 ITERATION        7
                      CORRECTED POINT
  0.1391    0.7154
                      FUNCTION VALUES
   -0.2219     -0.3471     -0.2112     -0.2263
  CENTROID COORDINATES    0.4517    0.7261
 

 ITERATION        8
                      CORRECTED POINT
  0.6042    1.2656
                      FUNCTION VALUES
   -0.2219     -0.0814     -0.2112     -0.2263
  CENTROID COORDINATES    0.4108    0.8109
 

 ITERATION        9
                      CORRECTED POINT
  0.0631    0.8727
                      FUNCTION VALUES
   -0.2219     -0.0814     -0.2112     -0.2071
  CENTROID COORDINATES    0.2870    0.9020
 

 ITERATION       10
                      CORRECTED POINT
  0.4655    1.2453
                      FUNCTION VALUES
   -0.0614     -0.0814     -0.2112     -0.2071
  CENTROID COORDINATES    0.2688    0.9512
 

 ITERATION       11
                      CORRECTED POINT
  0.5326    1.2710
                      FUNCTION VALUES
   -0.0614     -0.0814     -0.0745     -0.2071
  CENTROID COORDINATES    0.3776    1.1279
 

 ITERATION       12
                      CORRECTED POINT
  0.5724    1.2702
                      FUNCTION VALUES
   -0.0614     -0.0814     -0.0745     -0.0783
  CENTROID COORDINATES    0.5341    1.2606
 

 ITERATION       13
                      CORRECTED POINT
  0.4186    1.2577
                      FUNCTION VALUES
   -0.0614     -0.0730     -0.0745     -0.0783
  CENTROID COORDINATES    0.5235    1.2622
 

 ITERATION       14
                      CORRECTED POINT
  0.4071    1.2500
                      FUNCTION VALUES
   -0.0614     -0.0730     -0.0745     -0.0711
  CENTROID COORDINATES    0.4722    1.2580
 

 ITERATION       15
                      CORRECTED POINT
  0.3972    1.2445
                      FUNCTION VALUES
   -0.0614     -0.0730     -0.0703     -0.0711
  CENTROID COORDINATES    0.4304    1.2510
 

 ITERATION       16
                      CORRECTED POINT
  0.4294    1.2322
                      FUNCTION VALUES
   -0.0614     -0.0589     -0.0703     -0.0711
  CENTROID COORDINATES    0.4233    1.2466
 

 ITERATION       17
                      CORRECTED POINT
  0.4613    1.2285
                      FUNCTION VALUES
   -0.0614     -0.0589     -0.0703     -0.0537
  CENTROID COORDINATES    0.4307    1.2407
 

 ITERATION       18
                      CORRECTED POINT
  0.5234    1.2234
                      FUNCTION VALUES
   -0.0614     -0.0589     -0.0505     -0.0537
  CENTROID COORDINATES    0.4521    1.2353
 

 ITERATION       19
                      CORRECTED POINT
  0.4790    1.2056
                      FUNCTION VALUES
   -0.0427     -0.0589     -0.0505     -0.0537
  CENTROID COORDINATES    0.4714    1.2281
 

 ITERATION       20
                      CORRECTED POINT
  0.5639    1.2023
                      FUNCTION VALUES
   -0.0427     -0.0450     -0.0505     -0.0537
  CENTROID COORDINATES    0.4879    1.2192
 

 ITERATION       21
                      CORRECTED POINT
  0.6011    1.1870
                      FUNCTION VALUES
   -0.0427     -0.0450     -0.0505     -0.0452
  CENTROID COORDINATES    0.5221    1.2104
 

 ITERATION       22
                      CORRECTED POINT
  0.5800    1.1656
                      FUNCTION VALUES
   -0.0427     -0.0450     -0.0338     -0.0452
  CENTROID COORDINATES    0.5480    1.1983
 

 ITERATION       23
                      CORRECTED POINT
  0.4628    1.1966
                      FUNCTION VALUES
   -0.0427     -0.0450     -0.0338     -0.0401
  CENTROID COORDINATES    0.5410    1.1912
 

 ITERATION       24
                      CORRECTED POINT
  0.4336    1.1724
                      FUNCTION VALUES
   -0.0427     -0.0341     -0.0338     -0.0401
  CENTROID COORDINATES    0.5073    1.1893
 

 ITERATION       25
                      CORRECTED POINT
  0.5092    1.1426
                      FUNCTION VALUES
   -0.0204     -0.0341     -0.0338     -0.0401
  CENTROID COORDINATES    0.4921    1.1782
 

 ITERATION       26
                      CORRECTED POINT
  0.5659    1.1129
                      FUNCTION VALUES
   -0.0204     -0.0341     -0.0338     -0.0171
  CENTROID COORDINATES    0.5076    1.1602
 

 ITERATION       27
                      CORRECTED POINT
  0.6285    1.1195
                      FUNCTION VALUES
   -0.0204     -0.0308     -0.0338     -0.0171
  CENTROID COORDINATES    0.5517    1.1404
 

 ITERATION       28
                      CORRECTED POINT
  0.5521    1.0722
                      FUNCTION VALUES
   -0.0204     -0.0308     -0.0079     -0.0171
  CENTROID COORDINATES    0.5679    1.1250
 

 ITERATION       29
                      CORRECTED POINT
  0.4305    1.0958
                      FUNCTION VALUES
   -0.0204     -0.0140     -0.0079     -0.0171
  CENTROID COORDINATES    0.5424    1.1092
 

 ITERATION       30
                      CORRECTED POINT
  0.5252    1.0300
                      FUNCTION VALUES
   -0.0015     -0.0140     -0.0079     -0.0171
  CENTROID COORDINATES    0.5162    1.0936
 

 ITERATION       31
                      CORRECTED POINT
  0.4203    1.0050
                      FUNCTION VALUES
   -0.0015     -0.0140     -0.0079     -0.0064
  CENTROID COORDINATES    0.5026    1.0660
 

 ITERATION       32
                      CORRECTED POINT
  0.5438    0.9967
                      FUNCTION VALUES
   -0.0015     -0.0019     -0.0079     -0.0064
  CENTROID COORDINATES    0.4992    1.0357
 

 ITERATION       33
                      CORRECTED POINT
  0.4602    0.9705
                      FUNCTION VALUES
   -0.0015     -0.0019     -0.0025     -0.0064
  CENTROID COORDINATES    0.4964    1.0105
 

 ITERATION       34
                      CORRECTED POINT
  0.5388    0.9971
                      FUNCTION VALUES
   -0.0015     -0.0019     -0.0025     -0.0015
  CENTROID COORDINATES    0.5097    0.9990
 

 ITERATION       35
                      CORRECTED POINT
  0.5421    1.0109
                      FUNCTION VALUES
   -0.0015     -0.0019     -0.0019     -0.0015
  CENTROID COORDINATES    0.5359    1.0079
 

 ITERATION       36
                      CORRECTED POINT
  0.5244    1.0335
                      FUNCTION VALUES
   -0.0015     -0.0017     -0.0019     -0.0015
  CENTROID COORDINATES    0.5354    1.0127
 

 ITERATION       37
                      CORRECTED POINT
  0.5130    1.0322
                      FUNCTION VALUES
   -0.0015     -0.0017     -0.0012     -0.0015
  CENTROID COORDINATES    0.5294    1.0202
 

 ITERATION       38
                      CORRECTED POINT
  0.5274    1.0019
                      FUNCTION VALUES
   -0.0015     -0.0008     -0.0012     -0.0015
  CENTROID COORDINATES    0.5257    1.0197
 

 ITERATION       39
                      CORRECTED POINT
  0.5280    0.9849
                      FUNCTION VALUES
   -0.0010     -0.0008     -0.0012     -0.0015
  CENTROID COORDINATES    0.5264    1.0104
 

 ITERATION       40
                      CORRECTED POINT
  0.5020    1.0184
                      FUNCTION VALUES
   -0.0010     -0.0008     -0.0012     -0.0003
  CENTROID COORDINATES    0.5228    1.0063
 

 ITERATION       41
                      CORRECTED POINT
  0.5231    0.9819
                      FUNCTION VALUES
   -0.0010     -0.0008     -0.0009     -0.0003
  CENTROID COORDINATES    0.5191    1.0017
 

 ITERATION       42
                      CORRECTED POINT
  0.5038    1.0213
                      FUNCTION VALUES
   -0.0005     -0.0008     -0.0009     -0.0003
  CENTROID COORDINATES    0.5175    1.0007
 

 ITERATION       43
                      CORRECTED POINT
  0.5071    1.0242
                      FUNCTION VALUES
   -0.0005     -0.0008     -0.0006     -0.0003
  CENTROID COORDINATES    0.5110    1.0138
 

 ITERATION       44
                      CORRECTED POINT
  0.5005    1.0244
                      FUNCTION VALUES
   -0.0005     -0.0006     -0.0006     -0.0003
  CENTROID COORDINATES    0.5043    1.0213
 

 ITERATION       45
                      CORRECTED POINT
  0.4956    1.0176
                      FUNCTION VALUES
   -0.0005     -0.0006     -0.0003     -0.0003
  CENTROID COORDINATES    0.5021    1.0213
 

 ITERATION       46
                      CORRECTED POINT
  0.5003    1.0121
                      FUNCTION VALUES
   -0.0005     -0.0001     -0.0003     -0.0003
  CENTROID COORDINATES    0.5004    1.0191
 

 ITERATION       47
                      CORRECTED POINT
  0.4934    1.0093
                      FUNCTION VALUES
   -0.0001     -0.0001     -0.0003     -0.0003
  CENTROID COORDINATES    0.4993    1.0160
 

 ITERATION       48
                      CORRECTED POINT
  0.4892    1.0061
                      FUNCTION VALUES
   -0.0001     -0.0001     -0.0003     -0.0002
  CENTROID COORDINATES    0.4964    1.0130
 

 ITERATION       49
                      CORRECTED POINT
  0.4927    0.9981
                      FUNCTION VALUES
   -0.0001     -0.0001     -0.0001     -0.0002
  CENTROID COORDINATES    0.4943    1.0092
 

 ITERATION       50
                      CORRECTED POINT
  0.5036    1.0071
                      FUNCTION VALUES
   -0.0001     -0.0001     -0.0001     -0.0001
  CENTROID COORDINATES    0.4955    1.0065
 

 ITERATION       51
                      CORRECTED POINT
  0.4917    0.9953
                      FUNCTION VALUES
   -0.0001     -0.0001     -0.0001     -0.0001
  CENTROID COORDINATES    0.4966    1.0048
 

 ITERATION       52
                      CORRECTED POINT
  0.4977    0.9943
                      FUNCTION VALUES
    0.0000     -0.0001     -0.0001     -0.0001
  CENTROID COORDINATES    0.4960    1.0002
 

 ITERATION       53
                      CORRECTED POINT
  0.5021    1.0028
                      FUNCTION VALUES
    0.0000      0.0000     -0.0001     -0.0001
  CENTROID COORDINATES    0.4980    0.9998
 

 ITERATION       54
                      CORRECTED POINT
  0.4955    0.9956
                      FUNCTION VALUES
    0.0000      0.0000     -0.0001      0.0000
  CENTROID COORDINATES    0.4975    0.9984
 

 ITERATION       55
                      CORRECTED POINT
  0.5021    0.9972
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.4984    0.9975
 

 ITERATION       56
                      CORRECTED POINT
  0.5039    0.9997
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5006    0.9981
 

 ITERATION       57
                      CORRECTED POINT
  0.5035    1.0008
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5027    0.9999
 

 ITERATION       58
                      CORRECTED POINT
  0.5008    1.0009
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5026    1.0002
 

 ITERATION       59
                      CORRECTED POINT
  0.4992    0.9996
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5017    1.0003
 

 ITERATION       60
                      CORRECTED POINT
  0.5002    1.0024
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5007    1.0011
 

 ITERATION       61
                      CORRECTED POINT
  0.4988    0.9998
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.5001    1.0010
 

 ITERATION       62
                      CORRECTED POINT
  0.4994    0.9994
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.4996    1.0001
 

 ITERATION       63
                      CORRECTED POINT
  0.5011    1.0002
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.4998    1.0000
 

 ITERATION       64
                      CORRECTED POINT
  0.4996    0.9994
                      FUNCTION VALUES
    0.0000      0.0000      0.0000      0.0000
  CENTROID COORDINATES    0.4999    0.9998
 

 ITERATION       65
 
  The exact solution is:
 
    F(0.5,1.0) = 0.0
 
TOMS454_PRB3
  Normal end of execution.
SHAR_EOF
fi # end of overwriting check
cd ..
if test ! -d 'Src'
then
	mkdir 'Src'
fi
cd 'Src'
if test -f 'src.f'
then
	echo shar: will not over-write existing file "'src.f'"
else
cat << "SHAR_EOF" > 'src.f'
      SUBROUTINE JCONSX ( N, M, K, ITMAX, ALPHA, BETA, GAMMA,
     &  DELTA, X, R, F, I, IEV2, KO, G, H, XC, L )
C
C  PURPOSE:
C
C    TO FIND THE CONSTRAINED MAXIMUM OF A FUNCTION OF
C    SEVERAL VARIABLES BY THE COMPLEX METHOD OF M. J. BOX.
C    THIS IS THE PRIMARY SUBROUTINE AND COORDINATES THE
C    SPECIAL PURPOSE SUBROUTINES ( JCEK1, JCENT, JFUNC,
C    JCONST1).  INITIAL GUESSES OF THE INDEPENDENT VARIABLES,
C    RANDOM NUMBERS, SOLUTION PARAMETERS, DIMENSION LIMITS
C    AND PRINTER CODE DESIGNATIONS ARE OBTAINED FROM THE MAIN
C    PROGRAM.  FINAL FUNCTION AND INDEPENDENT VARIABLE
C    VALUES ARE TRANSFERRED TO THE MAIN PROGRAM FOR
C    PRINTOUT.  INTERMEDIATE PRINTOUTS ARE PROVIDED IN THIS
C    SUBROUTINE.  THE USER MUST PROVIDE THE MAIN PROGRAM AND
C    THE SUBROUTINES THAT SPECIFY THE FUNCTION (JFUNC) AND
C    CONSTRAINTS (JCNST1).  FORMAT CHANGES MAY BE REQUIRED
C    WITHIN THIS SUBROUTINE DEPENDING ON THE PARTICULAR
C    PROBLEM UNDER CONSIDERATION.
C
C  USAGE:
C
C    CALL JCONSX(N,M,K,ITMAX,ALPHA,BETA,GAMMA,DELTA,X,R,F,
C    IT,IEV2,KO,G,H,XC,L)
C
C  SUBROUTINES REQUIRED:
C
C    JCEK1(N,M,K,X,G,H,I,KODE,XC,DELTA,L,K1)
C      CHECKS ALL POINTS AGAINS EXPLICIT AND IMPLICIT
C      CONSTRAINTS AND APPLIES CORRECTION IF VIOLATIONS ARE
C      FOUND.
C
C    JCENT(N,M,K,IEV1,I,XC,X,L,K1)
C      CALCULATES THE CENTROID OF POINTS.
C
C    JFUNC(N,M,K,X,F,I,L)
C      SPECIFIES THE OBJECTIVE FUNCTION (USER-SUPPLIED).
C
C    JCNST1(N,M,K,X,G,H,I,L)
C      SPECIFIES EXPLICIT AND IMPLICIT CONSTRAINT LIMITS
C      (USER-SUPPLIED).  ORDER EXPLICIT CONSTRAINTS FIRST.
C
C  DESCRIPTION OF PARAMETERS:
C
C    N     NUMBER OF EXPLICIT INDEPENDENT VARIABLES - DEFINE
C          IN MAIN PROGRAM.
C
C    M     NUMBER OF SETS OF CONSTRAINTS - DEFINE IN MAIN
C          PROGRAM.
C
C    K     NUMBER OF POINTS IN THE COMPLEX - DEFINE IN MAIN
C          PROGRAM.
C
C    ITMAX MAXIMUM NUMBER OF ITERATIONS - DEFINE IN MAIN
C          PROGRAM.
C
C    ALPHA REFLECTION FACTOR - DEFINE IN MAIN PROGRAM.
C
C    BETA  CONVERGENCE PARAMETER - DEFINE IN MAIN PROGRAM.
C
C    GAMMA CONVERGENCE PARAMETER - DEFINE IN MAIN PROGRAM.
C
C    DELTA EXPLICIT CONSTRAINT VIOLATION CORRECTION - DEFINE
C          IN MAIN PROGRAM.
C
C    X     INDEPENDENT VARIABLES - DEFINE INITIAL VALUES IN
C          MAIN PROGRAM.
C
C    R     RANDOM NUMBERS BETWEEN 0 AND 1 - DEFINE IN MAIN
C          PROGRAM.
C
C    F     OBJECTIVE FUNCTION - DEFINE IN SUBROUTINE JFUNC.
C
C    IT    ITERATION INDEX - DEFINED IN SUBROUTINE JCONSX.
C
C    IEV2  INDEX OF POINT WITH MAXIMUM FUNCTION VALUE - 
C          DEFINED IN SUBROUTINE JCONSX.
C
C    IEV1  INDEX OF POINT WITH MINIMUM FUNCTION VALUE -
C          DEFINED IN SUBROUTINE JCONSX AND JCEX1.
C
C    KO    PRINTER UNIT NUMBER - DEFINE IN MAIN PROGRAM.
C
C    G     LOWER CONSTRAINT - DEFINE IN SUBROUTINE JCNST1.
C
C    H     UPPER CONSTRAINT - DEFINE IN SUBROUTINE JCNST1.
C
C    XC    CENTROID - DEFINED IN SUBROUTINE JCENT.
C
C    L     TOTAL NUMBER OF INDEPENDENT VARIABLES (EXPLICIT +
C          IMPLICIT) - DEFINE IN MAIN PROGRAM.
C
C    I     PRINT INDEX - DEFINED IN SUBROUTINE JCONSX.
C
C    KODE  KEY USED TO DETERMINE IF IMPLICIT CONSTRAINTS ARE
C          PROVIDED - DEFINED IN SUBROUTINE JCONSX AND JCEX1.
C
C    K1    DO LIMIT - DEFINED IN SUBROUTINE JCONSX.
C
      IMPLICIT NONE

      INTEGER K
      INTEGER L
      INTEGER M
      INTEGER N

      REAL ALPHA
      REAL BETA
      REAL DELTA
      REAL F(K)
      REAL G(M)
      INTEGER GAMMA
      REAL H(M)
      INTEGER I
      INTEGER ICM
      INTEGER IEV1
      INTEGER IEV2
      INTEGER II
      INTEGER IT
      INTEGER ITMAX
      INTEGER J
      INTEGER JB
      INTEGER JJ
      INTEGER K1
      INTEGER KO
      INTEGER KODE
      INTEGER KOUNT
      REAL R(K,N)
      REAL X(K,L)
      REAL XC(N)

      IT = 1
      WRITE ( KO, 99995 ) IT
      KODE = 0
      IF ( M - N ) 20, 20, 10
10    KODE = 1
20    CONTINUE

      DO 40 II = 2, K
        DO 30 J = 1, N
          X(II,J) = 0.0E+00
30      CONTINUE
40    CONTINUE
C
C  CALCULATE COMPLEX POINTS AND CHECK AGAINST CONSTRAINTS.
C
      DO 60 II = 2, K
        DO 50 J = 1, N
          I = II
          CALL JCNST1 ( N, M, K, X, G, H, I, L )
          X(II,J) = G(J) + R(II,J) * ( H(J) - G(J) )
50      CONTINUE
        K1 = II
        CALL JCEK1 ( N, M, K, X, G, H, I, KODE, XC, DELTA, L, K1 )
        WRITE ( KO, 99999 ) II, ( X(II,J), J = 1, N )
60    CONTINUE

      K1 = K

      DO 70 I = 1, K
        CALL JFUNC ( N, M, K, X, F, I, L )
70    CONTINUE

      KOUNT = 1
C
C  FIND POINT WITH LOWEST FUNCTION VALUE.
C
      WRITE ( KO, 99998 ) ( F(I), I = 1, K )
80    IEV1 = 1

      DO 100 ICM = 2, K
        IF ( F(IEV1) - F(ICM) ) 100, 100, 90
90      IEV1 = ICM
100   CONTINUE
C
C  FIND POINT WITH HIGHEST FUNCTION VALUE.
C
      IEV2 = 1

      DO 120 ICM = 2, K
        IF ( F(IEV2) - F(ICM) ) 110, 110, 120
110     IEV2 = ICM
120   CONTINUE
C
C  CHECK CONVERGENCE CRITERIA.
C
      IF ( F(IEV2) - ( F(IEV1) + BETA ) ) 140, 130, 130
130   KOUNT = 1
      GO TO 150
140   KOUNT = KOUNT + 1
      IF ( KOUNT - GAMMA ) 150, 240, 240
C
C  REPLACE POINT WITH LOWEST FUNCTION VALUE.
C
150   CALL JCENT ( N, M, K, IEV1, I, XC, X, L, K1 )

      DO 160 J = 1, N
        X(IEV1,J) = ( 1.0E+00 + ALPHA ) 
     &    * ( XC(J) ) - ALPHA * ( X(IEV1,J) )
160   CONTINUE

      I = IEV1
      CALL JCEK1 ( N, M, K, X, G, H, I, KODE, XC, DELTA, L, K1 )
      CALL JFUNC ( N, M, K, X, F, I, L )
C
C  REPLACE NEW POINT IF IT REPEATS AS LOWEST FUNCTION VALUE.
C
170   IEV2 = 1

      DO 190 ICM = 2, K
        IF ( F(IEV2) - F(ICM) ) 190, 190, 180
180     IEV2 = ICM
190   CONTINUE

      IF ( IEV2 - IEV1 ) 220, 200, 220

200   DO 210 JJ = 1, N
        X(IEV1,JJ) = ( X(IEV1,JJ) + XC(JJ) ) / 2.0E+00
210   CONTINUE

      I = IEV1
      CALL JCEK1 ( N, M, K, X, G, H, I, KODE, XC, DELTA, L, K1 )
      CALL JFUNC ( N, M, K, X, F, I, L )
      GO TO 170

220   CONTINUE
      WRITE ( KO, 99997 ) ( X(IEV1,JB), JB = 1, N )
      WRITE ( KO, 99998 ) ( F(I), I = 1, K )
      WRITE ( KO, 99996 ) ( XC(J), J = 1, N )
      IT = IT + 1
      IF ( IT - ITMAX ) 230, 230, 240

230   CONTINUE
      WRITE ( KO, 99995 ) IT
      GO TO 80

240   RETURN
99999 FORMAT ( " ", 15X, " COORDINATES AT POINT", I4/8(F8.4, 2X) )
99998 FORMAT ( " ", 20X, " FUNCTION VALUES", /8(F10.4, 2X ) )
99997 FORMAT ( " ", 20X, " CORRECTED POINT", /8(F8.4, 2X ) )
99996 FORMAT ( " ", " CENTROID COORDINATES", 2X, 5(F8.4, 2X) )
99995 FORMAT ( " ", //" ITERATION", 4X, I5 )
      END
      SUBROUTINE JCEK1 ( N, M, K, X, G, H, I, KODE, XC, DELTA, L,
     &  K1 )
C
C  PURPOSE:
C
C    TO CHECK ALL POINTS AGAINST THE EXPLICIT AND IMPLICIT
C    CONSTRAINTS AND TO APPLY CORRECTIONS IF VIOLATIONS ARE
C    FOUND.
C
C  USAGE:
C
C    CALL JCEK1(N,M,K,X,G,H,I,KODE,XC,DELTA,L,K1)
C
C  SUBROUTINES REQUIRED:
C
C    JCENT(N,M,K,IEV1,I,XC,X,L,K1)
C    JCNST1(N,M,K,X,G,H,I,L)
C
C  DESCRIPTION OF PARAMETERS:
C
C    PREVIOUSLY DEFINED IN SUBROUTINE JCONSX
C
      IMPLICIT NONE

      INTEGER K
      INTEGER L
      INTEGER M
      INTEGER N

      REAL DELTA
      REAL G(M)
      REAL H(M)
      INTEGER I
      INTEGER IEV1
      INTEGER J
      INTEGER JJ
      INTEGER K1
      INTEGER KODE
      INTEGER KT
      INTEGER NN
      REAL X(K,L)
      REAL XC(N)

10    KT = 0
      CALL JCNST1 ( N, M, K, X, G, H, I, L )
C
C  CHECK AGAINST EXPLICIT CONSTRAINTS.
C
      DO 50 J = 1, N
        IF ( X(I,J) - G(J) ) 20, 20, 30
20      X(I,J) = G(J) + DELTA
        GO TO 50
30      IF ( H(J) - X(I,J) ) 40, 40, 50
40      X(I,J) = H(J) - DELTA
50    CONTINUE

      IF ( KODE ) 110, 110, 60
C
C  CHECK AGAINST THE IMPLICIT CONSTRAINTS.
C
60    CONTINUE

      NN = N + 1

      DO 100 J = NN, M
        CALL JCNST1 ( N, M, K, X, G, H, I, L )
        IF ( X(I,J) - G(J) ) 80, 70, 70
70      IF ( H(J) - X(I,J) ) 80, 100, 100
80      IEV1 = I
        KT = 1
        CALL JCENT ( N, M, K, IEV1, I, XC, X, L, K1 )
        DO 90 JJ = 1, N
          X(I,JJ) = ( X(I,JJ) + XC(JJ) ) / 2.0E+00
90      CONTINUE
100   CONTINUE

      IF ( KT ) 110, 110, 10

110   RETURN
      END
      SUBROUTINE JCENT ( N, M, K, IEV1, I, XC, X, L, K1 )
C
C  PURPOSE:
C
C    TO CALCULATE THE CENTROID OF POINTS.
C
C  USAGE:
C
C    CALL JCENT ( N, M, K, IEV1, I, XC, X, L, K1 )
C
C  SUBROUTINES REQUIRED:
C
C    NONE.
C
C  DESCRIPTION OF PARAMETERS:
C
C    PREVIOUSLY DEFINED IN SUBROUTINE JCONSX.
C
      IMPLICIT NONE

      INTEGER K
      INTEGER L
      INTEGER N

      INTEGER I
      INTEGER IEV1
      INTEGER IL
      INTEGER J
      INTEGER K1
      INTEGER M
      REAL RK
      REAL X(K,L)
      REAL XC(N)

      DO 20 J = 1, N
        XC(J) = 0.0E+00
        DO 10 IL = 1, K1
          XC(J) = XC(J) + X(IL,J)
10      CONTINUE
        RK = K1
        XC(J) = ( XC(J) - X(IEV1,J) ) / ( RK - 1.0E+00 )
20    CONTINUE

      RETURN
      END
SHAR_EOF
fi # end of overwriting check
cd ..
cd ..
cd ..
#       End of shell archive
exit 0
