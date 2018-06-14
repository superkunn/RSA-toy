# 快速幂取模
def pow_mod(a,i,mod)
	ret = 1
	while i > 0
		ret = ret*a%mod if((i&1)==1)
		a = a*a%mod
		i >>= 1
	end
	return ret
end
puts "请输入N"
N = gets.to_i
puts "请输入E"
E = gets.to_i
puts "请输入要加密的数字"
w = gets.to_i
puts "************"
puts "密文是："
w = pow_mod(w,E,N)
puts w
puts "************"