#!/usr/bin/env ruby

def test_method
  some_var = ""
  [1,2,3].each do |n|
    some_var = n
  end
  puts "myVar = #{some_var}"
  some_var
end
