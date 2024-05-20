require 'minitest/test_task'
# Create the following tasks:
# * test          : run tests
# * test:cmd      : print the testing command
# * test:isolated : run tests independently to surface order dependencies
# * test:deps     : (alias of test:isolated)
# * test:slow     : run tests and reports the slowest 25
Minitest::TestTask.create do |t|
  t.extra_args << '-Werror' # Raise exceptions for warnings: https://github.com/minitest/minitest/commit/f0f17b9
  t.test_prelude = 'Warning[:performance] = true' # … including `performance` warnings which are off even with `-w`
end
