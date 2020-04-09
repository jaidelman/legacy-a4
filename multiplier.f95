! Joshua Aidelman
! 1000139
! jaidelma@uoguelph.ca

! This program applies the Russian Peasant Multiplication algorithm
! in C, both recursively and non recursively.
program multiplier
  integer :: a,b,c,aIn,bIn ! To store output and input

  ! Get input from user
  write(*,*) 'Please enter your first number: '
  read(*,"(1I10)") aIn
  write(*,*) 'Please enter your second number: '
  read(*,"(1I10)") bIn

  ! Set variables to be sent to the function
  a = aIn
  b = bIn

  ! Call recursive function and print result
  c = multiplierRecursive(a,b)
  write(*,*)  'Recursively: ', aIn, ' * ', bIn, ' = ', c

  ! Set variables to be sent to the function
  a = aIn
  b = bIn

  ! Call non recursive function and print result
  c = multiplierNonRecursive(a,b)
  write(*,*)  'Non Recursively: ', aIn, ' * ', bIn, ' = ', c

end

! This function applies the algorithm non resursively
integer function multiplierNonRecursive(a,b)

  integer, intent(inout) :: a,b
  integer :: c = 0

  do while (a > 1)
    if (modulo(a,2) == 1) then
      c = c + b
    end if
    a = a/2
    b = b*2
  end do

  c = c + b
  multiplierNonRecursive = c

end function multiplierNonRecursive

! This function applies the algorithm non resursively
integer recursive function multiplierRecursive(a,b) result(c)

  integer, intent(in) :: a,b

  if (a == 0) then
    c = 0
  else if (a == 1) then
    c = b
  else if (a > 1 .and. modulo(a,2) == 0) then
    c = multiplierRecursive(a/2, b*2)
  else if (a > 1 .and. modulo(a,2) == 1) then
    c = multiplierRecursive(a/2, b*2) + b
  end if

end function multiplierRecursive
