module test_MCMC
  use testdrive, only : new_unittest, unittest_type, error_type, check
  implicit none
  private

  public:: collect_MCMCtests

contains

!> Collect all exported unit tests
subroutine collect_MCMCtests(testsuite)
  !> Collection of tests
  type(unittest_type), allocatable, intent(out):: testsuite(:)

  testsuite = [ &
    new_unittest("valid", test_valid), &
    new_unittest("invalid", test_invalid, should_fail=.true.) &
    ]

end subroutine collect_MCMCtests

subroutine test_valid(error)
  type(error_type), allocatable, intent(out):: error
  ! ...
end subroutine test_valid

subroutine test_invalid(error)
  type(error_type), allocatable, intent(out):: error
  ! ...
end subroutine test_invalid

end module test_MCMC