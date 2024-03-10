require 'mkmf'

#include = File.expand_path '../../include/', __FILE__
#find_header '.h', include

create_makefile 'mygem'
