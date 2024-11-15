program tester
  use, intrinsic:: iso_fortran_env, only : error_unit
  use testdrive, only : run_testsuite, new_testsuite, testsuite_type
  use test_common, only : collect_commontests
  !use test_MCMC, only : collect_MCMCtests
  use test_DEMCz, only : collect_DEMCztests
  implicit none
  integer:: stat, is
  type(testsuite_type), allocatable:: testsuites(:)
  character(len=*), parameter:: fmt = '("#", *(1x, a))'

  stat = 0

  testsuites = [ &
    new_testsuite("commontests", collect_commontests), &
    !new_testsuite("MCMCtests", collect_MCMCtests), &
    new_testsuite("DEMCztests", collect_DEMCztests) &
     ]

  do is = 1, size(testsuites)
    write(error_unit, fmt) "Testing:", testsuites(is)%name
    call run_testsuite(testsuites(is)%collect, error_unit, stat)
  end do

  if (stat > 0) then
    write(error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
    error stop
  end if

end program tester
