puts "公钥密钥生成程序开始"
$bitlen = 1024 # 素数二进制长度
$t = 500 # 费马小素性测试次数
# 生成随机大整数且为奇数
def bignum()
	len = $bitlen
	len -= 2
	ret = 1
	len.times do
		ret <<= 1
		ret += rand(2)
	end
	ret <<= 1
	ret += 1
	return ret
end
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
# 费马小定理素性测试
def is_prime (x)
	$t.times do
		w = rand(x)
		w = 1 if(w==0)
		return 0 if(pow_mod(w,x-1,x)!=1)
	end
	return 1
end
# 找出大素数
def bigprime()
	x = bignum()
	x -= 2 until(is_prime(x)==1)
	return x
end
# 求最大公因数
def gcd(a,b)
	return a if(b == 0)
	return gcd(b,a%b)
end
# 拓展欧几里得
def extgcd(a,b)
	if b == 0
		[a, 1, 0]
	else 
		g, x, y = extgcd(b, a % b)
		[g, y, x - a / b * y]
	end
end
# 逆元
def modinv(a,m)
	g, x, y = extgcd(a, m)
	x %= m
	while x < 0
		x += m		
	end
	return x 
end
# 求一个互质的数
def coprime(x)
	y = 10000
	y+=1 until(gcd(x,y)==1)
	return y
end


t1 = Time.now 

P = bigprime()
puts "P :"
puts P
puts "****************"

Q = bigprime()
puts "Q :"
puts Q
puts "****************"

N = P*Q
puts "N :"
puts N
puts "****************"

K = (P-1)*(Q-1)
puts "K :"
puts K
puts "****************"

E = coprime(K)
puts "E :"
puts E
puts "****************"

D = modinv(E,K)
puts "D :"
puts D
puts "****************"

t2 = Time.now
puts "总计用时#{t2 - t1}s"



