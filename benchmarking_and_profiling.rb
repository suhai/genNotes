puts 'Benchmarking and Profiling'
# Once your code is bug-free and working properly, it’s natural to think it’s ready for release. In the real world, however, code can often be inefficient or run more slowly than it needs to. As of version 1.8, the Ruby interpreter is not particularly fast, although Ruby 1.9, with its entirely new implementation, is significantly faster (double the speed at the time of writing). However, it is always important to benchmark your code to make sure it’s running as efficiently as possible.
# Benchmarking is the process in which you get your code or application to perform a function (often many hundreds of times in succession to average out discrepancies), and the time it takes to execute is measured. You can then refer to these times as you optimize your code. If future benchmarks run faster than previous ones, you’re heading in the right direction. Luck- ily, Ruby provides a number of tools to help you benchmark your code.

puts 'Simple Benchmarking'
# Ruby’s standard library includes a module called          .           provides several methods that measure the speed it takes to complete the code you provide. For example:
require 'benchmark'
aa = Benchmark.measure { 1000.times { print '.' } }
puts aa # 0.000000   0.000000   0.000000 (  0.000372)
puts 
# This code measures how long it takes to print 10,000 periods to the screen. Ignoring the periods produced, the output (on my machine; yours might vary) is shown above. The columns, in order, represent the amount of user CPU time, system CPU time, total CPU, and “real” time taken. 

# Note that 'measure' can accept code blocks so the code can be as elaborate as needed and 'measure' would still accept it.
# Two identical ways of performing an iteration can be meaured against each other by assigning their Benchmar.measure to variables and puts-ing them one after the other.
iteration = 1000
bb = Benchmark.measure do 
  for i in 1..iteration do
    i
  end
end

cc = Benchmark.measure do 
  iteration.times do |i|
    i
  end
end
puts bb # 0.000000   0.000000   0.000000 (  0.000053)
puts cc # 0.000000   0.000000   0.000000 (  0.000045)
puts 
# Benchmark also includes a way to make completing multiple tests more convenient. You can rewrite the preceding benchmarking scenario like this:
counter = 1_000_000
Benchmark.bm do |bm|

  bm.report("for:") do 
    for i in 1..counter do
      i
    end
  end

  bm.report("times:") do
    counter.times do |i|
      i
    end
  end

end
puts 
#         user       system     total       real
# for:    0.050000   0.000000   0.050000    (  0.052237)
# times:  0.050000   0.000000   0.050000    (  0.047843)
# The primary difference with using the    method is that it allows you to collect a group of benchmark tests together and display the results in a prettier way, like the code above.

# Another method, bmbm, repeats the benchmark set twice, using the first as a “rehearsal” and the second for the true results, as in some situations CPU caching, memory caching, and other factors can taint the results. Therefore, repeating the test can lead to more accurate figures. Replacing the bm method with bmbm in the preceding example (for the benchmark method) gives results like these:
Benchmark.bmbm do |bm|

  bm.report("for:") do 
    for i in 1..counter do
      i
    end
  end

  bm.report("times:") do
    counter.times do |i|
      i
    end
  end

end
# Rehearsal ------------------------------------------
# for:     0.050000   0.000000   0.050000 (  0.055666)
# times:   0.050000   0.000000   0.050000 (  0.053671)
# --------------------------------- total: 0.100000sec

#              user     system      total        real
# for:     0.060000   0.000000   0.060000 (  0.063146)
# times:   0.050000   0.000000   0.050000 (  0.050782)
puts    

puts 'Profiling'
# Whereas benchmarking is the process of measuring the total time it takes to achieve something and comparing those results between different versions of code, profiling tells you what code is taking what amount of time. For example, you might have a single line in your code that’s causing the program to run slowly, so by profiling your code you can immediately see where you should focus your optimization efforts.    
    
require 'profile'
class Calculator
  def self.count_to_large_number
    x = 0
    100_000.times { x += 1 }
  end

  def self.count_to_small_number
    x = 0
    1000.times { x += 1 }
  end 
end
Calculator.count_to_large_number
Calculator.count_to_small_number
#   %   cumulative   self              self     total
#  time   seconds   seconds    calls  ms/call  ms/call  name
#  68.38     0.80      0.80        2   400.00   585.00  Integer#times
#  31.62     1.17      0.37   100001     0.00     0.02  Calculator.count_to_lar
#   0.00     1.17      0.00        2     0.00     0.00  BasicObject#singleton_me
#   0.00     1.17      0.00        1     0.00     0.00  TracePoint#enable
#   0.00     1.17      0.00        1     0.00     0.00  Class#inherited
#   0.00     1.17      0.00     1001     0.00     0.01  Calculator.count_to_smal
#   0.00     1.17      0.00        1     0.00     0.00  TracePoint#disable
#   0.00     1.17      0.00        1     0.00  1170.00  #toplevel

# Note that You can use a library called profiler (which profile uses to do its work) to profile a specific section of your program rather than the entire thing. To do this, use require 'profiler' and the commands Profiler_::start_profile, Profiler_::stop_profile, and Profiler_::print_profile($stdout) in the relevant locations.
