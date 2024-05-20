# frozen_string_literal: true
require 'minitest/test_task'
require 'rake/extensiontask'
#begin
#  require 'mingw-make'
#rescue LoadError
#  # ignore
#end

# Create the following public tasks:
# * compile       : Compile all the extensions
# * compile:mygem : Compile mygem
# * clean         : Remove any temporary products
# * clobber       : Remove any generated files
Rake::ExtensionTask.new 'mygem'
desc 'alias for `compile`'
task default: :compile

# Create the following tasks:
# * test          : run tests
# * test:cmd      : print the testing command
# * test:isolated : run tests independently to surface order dependencies
# * test:deps     : (alias of test:isolated)
# * test:slow     : run tests and reports the slowest 25
Minitest::TestTask.create do |t|
  t.extra_args << '-Werror' # Raise exceptions for warnings: https://github.com/minitest/minitest/commit/f0f17b9
  if RUBY_VERSION > '3.3'
    t.test_prelude = 'Warning[:performance] = true' # … including `performance` warnings which are off even with `-w`
  end
end
