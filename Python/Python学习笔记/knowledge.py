"""
序列：在Python中，序列就是一种按照顺序排序的值【数据集合】

在Python中存在三种内置的序列类型：字符串元组和列表
优点：支持索引和切片
特征：第一个正索引为0，指向左端，第一个索引为负数的时候指向右端


切片：【高级特性】可以根据下标来获取序列对象的任意部分数据
语法结构：【start:end:step】 step默认是1


list:Python当中重要的数据结构，是一种有序的数据集合
特点：
1.支持增删改查
2.列表中的数据是可变的【数据项可变，内存地址不会发生变化】
3.用[]来创建列表类型，数据项之间用逗号进行分割，数据项可以是任何类型的数据
4.支持索引和切片操作


元组：是一种不可变的序列，在创建之后不可以做任何的修改
1.不可变
2.用()创建元组类型，数据项之间用逗号分割
3.可以是任何数据类型
4.当元组中只有一个元素时，要加上逗号，不然解释器会当做其他类型来处理
5.同样支持切片操作


字典：也是Python中重要的数据类型，字典是键值对组成的集合，通常使用键来访问数据，
效率非常高，和list一样，支持对数据的增删改查

特点：
1.不是序列类型，没有下表概念，是一个无序的键值集合，是内置的高级数据类型
2.用{}来表示字典对象，每个键值之间用逗号分割
3.键必须是不可变的类型【元组、字符串】  值可以是任意类型
4.每个键必定是唯一的，如果存在重复的键，后置会覆盖前者




Python函数的学习：
def 函数名():
    函数体【一系列的Python语句表示独立的功能】

函数的调用：
    本质就是执行函数定义里面的代码块，在调用之前必须先定义

参数的分类：
必选参数、默认参数【缺省参数】、可选参数、关键字参数
参数：其实就是函数为了实现某项特定的功能，进而为了得到实现功能所需要的数据
        就是为了得到外部数据的
"""

'''1.必选参数'''

# def sum(a, b):  # 这里a和b简称形式参数：形参知识意义上的一个参数，想当于一个标记，定义的时候不占内存地址
#     sum = a + b
#     print(sum)
#     pass


# sum(1, 3)  # 这里的1和3就是实际参数，是占用内存地址的

'''默认参数（缺省参数），始终处在参数列表的尾部，赋值之后后面必须不可以出现必选参数了'''

# def sum1(a=20, b=30):
#     print('默认参数的使用=%d' % (a + b))


# sum1()
# sum1(10)  # 调用时未赋值的值将会使用函数给定时的默认值

'''可变参数（不定长参数）当参数的个数不确定时使用比较灵活'''

# def getComputer(*args):
#     # 计算累加和
#     # print(args)
#     result = 0
#     for item in args:
#         result += item
#     print(result)
#     pass


# getComputer(1, 2, 3, 45, 5)

'''关键字参数'''

# 用**来定义，在函数体内，参数关键字是一个字典类型，key的键是一个字符串
# def keyFunc(**kwargs):
#     print(kwargs)


# 调用
#  keyFunc(1,2,3),不可以这样传
# dictA = {'name': 'alian', 'age': 6}


# keyFunc(**dictA)
# keyFunc(name='peter', age=26)
# keyFunc()  # 不传参数也是可以的，就是一个空字典


# def complexFunc(*args, **kwargs):  # 可选参数必须在关键字参数的前面
#     print(args)
#     print(kwargs)


'''可选参数接受的是一个元组类型，关键字参数接受的是一个字典类型'''

# complexFunc()
# complexFunc(1, 2, 3, 4, name='张三')
# complexFunc(age='36')


'''
函数的返回值：
        函数执行完后会返回一个对象，如果有return将可以返回实际的值，否则就返回none
    类型：可以返回任意类型，返回值类型应该取决于return后面的类型
    用途：给调用方返回数据
    在一个函数体内可以出现多个return关键字，但肯定只能返回一次return
    如果在一个函数体内执行了return就意味着函数推出了，return后面的代码将不会继续执行
    
'''
# def sum(a,b):
#     sum = a+b
#     return sum
#
# print(sum(10,20))
# def calComputer(num):
#     li =[]
#     res = 0
#     i=1
#     while i<=num:
#         res +=i
#         i +=1
#     li.append(res)
#     return li
#
# print(calComputer(10))
# def returnType():
#     # return 1,2,3  #元组类型的返回值
#     return {'name':'li'}  #字典类型的返回值
#
#
# print(type(returnType()))


'''
函数嵌套
'''


def fun1():
    print("------------------fun1 start---------------------")
    print("------------------执行过程省略---------------------")
    print("------------------fun1 end---------------------")


def fun2():
    print("------------------fun2 start------------------")
    fun1()
    print("------------------fun2 end---------------------")


# fun2()

'''
函数的基本类型分类
    1.有参数无返回值的
    def fun(a)
    pass
    2.有参数有返回值的
    def fun(a,b):
        c=a+b
    3.无参数有返回值的
    def fun():
    return info
    4.无参数无返回值的
    def fun():
    print()
'''

'''
全局变量和局部变量

在函数内部定义的变量即为局部变量，作用域仅仅局限在函数的内部
函数外部定义的变量就是全局变量，在所有函数中都可以使用

局部变量可以在函数内部重新给全局变量赋值，相当于更新（当全局变量和局部变量重复定义时，函数优先使用局部变量）

'''

pro = "aaaaaa"  # 定义全局变量


def changeGlobal():
    '''
    修改全局变量
    :return:
    '''
    # global pro # 此处global关键字的作用是知名此处的局部变量为全局变量，这样就可以对全局变量进行修改
    pro = "mmmmmm"  # 定义局部变量


changeGlobal()  # 执行修改的函数
# print(pro) # 查看全局变量pro是否被修改

# 运行结果显示没有修改，说明局部变量pro和全局变量pro是两回事，想要修改的话要借助关键字global



'''

参数的传递

1.在Python中 万物皆对象 在函数调用的时候，实参传递的就是对象的引用。
2.了解了原理之后就可以更好的把控函数内部的处理是否会影响到外部数据的变化
    
    
    参数传递是通过对象的引用来完成的


匿名函数

Python中使用lambda关键字创建匿名函数，匿名函数就是不需要def关键字创建标准的函数
    主要代码为  
        lambda 参数1,参数2,参数3:执行语句
    匿名函数自带return，返回的结果就是匿名函数的计算结果，所以需要创建一个变量来接收
    
    缺点就是lambda只能是单个表达式不是一个代码块。它的设计就是为了满足简单函数的场景。
    仅能封装有限的逻辑，对于复杂逻辑，只能用def标准函数来做。
    
    使用lambda表达式计算两个数之和：
        test = lambda x,y : x+y
        test(1,3)
    换成普通标准函数就是：
        def test(x,y):
            return x+y

三元运算符的简化：
    age = 15
    if age> = 18:
        print('可以参军')
    else:
        print('继续上学')

简化后：
age = 15
print('可以参军' if age >= 18 else '继续上学')


对于匿名函数：
    funcTest = lambda x,y: x if x>y else y
    funcTest(12,13)
也可以在定义的时候直接赋值：
    rs = (lambda x,y:x if x>y else y)(12,13)
    print(rs)




递归函数：
    在函数内部调用自己本身的函数，递归函数必须满足一个结束递归的条件
    优点：逻辑简单，定义简单
    缺点：容易导致栈溢出，内存资源紧张甚至内存纰漏
    
    
# 求10的阶乘
def func(n):
    res = 1
    for i in range(1,n+1):
        res *= i
    return res

print(func(4))


# 递归的方式去实现：
def digui(n):
    if n == 1:
        return 1
    else:
        return n*digui(n-1)

print(digui(5))


39集 16分21秒有自己关于递归返回的注释



递归案例：树形结构的遍历
模拟文件搜索：对C盘ATTO文件夹下的所有文件进行检索
import os
def findFile(file_Path):
    listRs = os.listdir(file_Path) #得到该路径下的文件夹
    for fileItem in listRs:
        full_Path = os.path.join(file_Path,fileItem) #获取完整的文件路径
        if os.path.isdir(full_Path): #判断是否是文件夹
            findFile(full_Path) #如果是一个文件夹再次去递归搜索
        else:
            print(fileItem)
    else:
        return

findFile('C:\\ATTO')



Python内置运算函数：

abs()取绝对值 
round()四舍五入
pow()求幂   pow(3,3)相当于3的三次方或者3**3也可以表示
divmod() 求商和余数  例如divmod(9,3) 结果是(3,0)
max() 最大值  接收的参数可以是一个序列
min() 最小值
sum() 求和
eval() 可以动态执行表达式的函数，表达式可以是一个字符串
a,b,c = 1,2,3
eval('a+b+c') 是一个简单的表达式函数，相当于把字符串的引号去掉当成一串代码来执行



序列操作：字符串，元组，列表

all()  对象的元素除了0，空，false 外都是true，包括空元组和列表

any()  对象的元素只要有一个为真那么结果就是返回真，类似于逻辑运算符or的判断

sorted() 可以对所有可迭代对象进行排序，默认升序排列。sorted()方法排序后返回的是一个新的list，而不是在原来的数据上进行操作，所以可以对所有的可迭代对象进行操作

sort() 只可以对列表对象进行排序，是在原来的对象上进行操作，所以不能对元组进行操作，因为元组一旦定义就不可以修改

li = [1,3,6,5,8,7,]
# li.sort()  #list的排序方法直接修改原始对象


print('-----------修改之前---------'.format(li))
varList = sorted(li)
# 默认生序排列，想要降序排列的话可以在后面加上关键字reverse
# 比如 varList = sorted(li,reverse=true)  #降序排列
# 此处由于sorted()排序完成后会生成一个新的list，所以需要一个变量来接收新的list
print('-----------修改之后---------'.format(varList))


reverse()  函数用于反向列表中的元素

range(start,stop,step)

zip() 主要用于将可迭代的对象作为参数，将对象中的元素打包成元组，然后返回一个列表

#打包压缩图书信息

def bookInfo():
    books = []
    id = input('请输入图书编号：（空格分隔）')
    name = input('请输入图书名称：（空格分隔）')
    pos = input('请输入图书位置：（空格分隔）')
    idList = id.split(' ')
    nameList = name.split(' ')
    posList = pos.split(' ')
    booksInfo = zip(idList,nameList,posList)
    for items in booksInfo:
        dictInfo = {'编号':items[0],'书名':items[1],'位置':items[2]}
        books.append(dictInfo)
        pass
    for i in books:
        print(i)

bookInfo()




enumerate() #用于讲一个可遍历的数据对象用时取出数据和数据下标，一般用在for循环中
listobj = ['a','b','c']
for item in enumerate(listobj):
    print(item)

for index,item in enumerate(listobj):
    print(index,item)

for index,item in enumerate(listobj,5):#表示下标从5开始
    print(index,item)

# 创建字典添加元素
dicObj = {}
dicObj['name'] = 'gsy'
dicObj['age'] = '18'
dicObj['sex'] = 'm'
print(dicObj)
for item in enumerate(dicObj):
    print(item)








47

'''






