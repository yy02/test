str = 'hello world'
# 转换大小写
# print(str.lower())
# print(str.upper())


# 切片操作
#    slice[start:end:step]  左闭右开原则，start < value < end
# print(str[2:5])
# print(str[2:])
# print(str[:5])
# print(str[::-1])

# 共有方法
# 相加操作,对字符串列表和元组都可以使用
strA = '人生苦短'
strB = '我用Python'
listA = list(range(10))
listB = list(range(11,20))
# print(strA+strB)
# print(listA+listB)


# 复制操作 *
# print(strA*3)
# print(listA*3)


# in操作，检测对象是否存在
print('生' in strA)
print(9 in listA)
dictA = {'name':'zhangsan'} #对于字典判断的是key是否在字典中
print('name' in dictA)
print('zhangsan' in dictA)

