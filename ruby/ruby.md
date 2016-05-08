## object method block proc lambda
 
 block / method(封装了call-return 的block) are not objects,just a piece of codes
 *return相当于call的显式返回；默认最后一行expresssion隐式返回 @proc & lambda*
 
 proc / lambda (method版本的proc) are objects

`test = Proc.new { # does something }
test.call`

##object functions

auto returns last expression 



- puts print 
	- print "aaa, #{var} aaa "
- str.methond
	- str.methond! #save value to var
	- .length .reverse .upcase .downcase  
	- .capitalize #upcase on first char 
	- var.capitalize #capitalize and update var
	- `if user_input.include? "str1"
  			user_input.gsub!(/str2/, "th")`
  	- .split(",,") .split
  	- .include?"str"
  	- .gsub! `if user_input.include? "aa"
  				user_input.gsub!(/aa/, "th")`
- data struct
	- .sort_by
	- .sort!
		- `books.sort! { |firstBook, secondBook| secondBook <=> firstBook } #"<=>" return either 1, 0, -1`
	- .reverse!
- other
	- .object_id 
	- .nil?
	- .is_a? Symbol
	- ||= #nil 下赋值
	- .respond_to?(:function_name)
	- `n.is_a? Integer`(
	- array.collects {block} array.collects(&proc)# copy of {} returns ;& convert proc to block
	- .map
	- Time.now #sys time

##block function

Blocks are not objects blocks can't be saved to variables @proc

methods that accept blocks have a way of transferring control from the calling method to the block and back again

	def block_test
		puts "We're in the method!"
		puts "Yielding to the block..."
		yield
		puts "We're back in the method!"
	end

	block_test { puts ">>> We're in the block!" }
	
`def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end
yield_name("Eric") { |n| puts "My name is #{n}." }`

##proc

convert to block : &proc 

Procs are great for keeping your code DRY, which stands for Don't Repeat Yourself.

`multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end
cube = Proc.new { |x| x ** 3 }
(1..100).to_a.select!(&multiples_of_3)`

`multiples_of_3.call`

##lambda

lambda_demo(&lambda { puts "I'm the lambda!" })

lambda_demo(&lambda_var)

####vs proc

	

- checking arguments
- @example  
	- when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method
	- 设计上感觉**lambda是嵌入的一个method ，proc是嵌入的一段代码**
`lambda { puts "Hello!" }` == `Proc.new { puts "Hello!" }`


####proc vs lambda

lambda 的return嵌入method中；proc的return抢断了method得call回调

`def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end`

`puts batman_ironman_proc`

`def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end`

`puts batman_ironman_lambda`

result >> Batman will win!
Iron Man will win!
nil

##example 

`colors = colors.sort_by do |color, count|
  count
end`

- upto
- downto



`95.upto(100) { |num| print num, " " }
# Prints 95 96 97 98 99 100`

`"L".upto("P") { |let| puts let, " " }`

- <<


	`[1, 2, 3] << 4`
	`"Yukihiro " << "Matsumoto"`
- ;end `class Dragon < Person; end`

##convertion

- .to_i
- .to_s #{}
- .to_a `(1..100).to_a`
- .to_sym or .intern
- proc vertion >> `(&:to_i)`



##symbols

`my_first_symbol = :asf `

	symbol_hash = {
		:one => 1,
	}

In Ruby, a string is mutable, whereas a symbol is immutable. That means that only one copy of a symbol needs to be created. Thus, if you have

x = :my_str
y = :my_str

:my_str will only be created once, and x and y point to the same area of memory


##array hash symbol-hash

<< instead of .push .add

- .collect {block}
- .map {block}
####array

- .push .push! <<
	numbers = [["aa","cc"][1,2]]
- .select
- each——连续访问集合的所有元素
- map/collect—-从集合中获得各个元素传递给block，block返回的结果生成新的集合。
- inject——遍历集合中的各个元素，将各个元素累积成返回一个值。

####hash

 hash lookup is faster with symbol keys than with string keys

- .new
- .add
- .delete
- .select `grades.select {|name, grade| grade < 97}`
- `my_hash.each_key { |k| print k, " " }`
- `my_hash.each_value { |v| print v, " " }`


	`var = Hash.new`
	`var = {}`
	
	
`my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}`


`new_hash = { one: 1,
  two: 2,
  three: 3
}#symbol-hash`

	my_hash { |x, y| puts "#{x}: #{y}" } #print key-value
	my_hash { |x| puts x[1] } #print value
	my_hash = Hash.new
	my_hash = Hash.new(0) # default value 0
	my_hash = Hash.new("default value")
	
##comments
	# comment
	
	=begin
	**mutil lines**
	=end

## I/O

	gets.chomp # chomp removes that extra line. 
	print
	puts

##condition flow

###simple

	boolean ? Do this if true: Do this if false
	
	expression if boolean
	
	expression unless boolean
	
	
###complex
	
	if exp
	elsif 
	else
	end
	
	next if
	break if
	
	unless
	else
	end
	
	while
	end
	
	until
	end
	
	case
	when
	else 
	end
	
	for num in 1...10
	# not include 10
	end
	
	for num in 1..10
	#include 10
	end
	
	i = 0
	loop do
		i += 1
		print "#{i}"
		next if i > 3
		break if i > 5
	end
	
	array.each do |x|
		print "#{x}"
	end
	
	array.each { |item| print item * 2 }
	
	30.times { print "Ruby!" }
##logic 

! && ||

##time 

	string_time = Benchmark.realtime do
		100_000.times { string_AZ["r"] }
	end

##math

	2**3
	
	Prime.instance

##class

	class ClassName
		def initialize(param)
		end
		def ClassName.classFunc
		end
		def self.classFunc
		end
		@class_member
		private / public
		def func
		end
	end
	
	class SuperClass < ClassName
	end
	
	SuperClass.new(param)

- `$var` global variable
- `@@var` class variable
	- `def self.get_var
    @@var
  end`
- `@var` class instance variable
- `var` local variable;;used inside class code
- super

####attr

`attr_reader :name, :password; attr_writer :name; attr_accessor:name` == 
`def name
  @name
end
def name=(value)
  @name = value
end`

##module namespcing

	module Name
		def func
			@var = 33
		end
	end
	
	Math::PI
	
	require 'date'
	
	include 'date' #no need Data:: or Date.
	
##mixins - include / extend module in class

- include #mixes a module's methods in at the **instance level** 
- extend #mixes a module's methods at the **class level**