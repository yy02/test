#如何创建字典
dictA = {'pro':'yishu','school':'qinghua'}
# 添加字典数据

dictA['name'] = 'zhangsan'   #  key:value
dictA['age'] = 30
dictA['pos'] = 'singer'

# 结束添加
# print(type(dictA))
print(dictA)
# print('字典的长度为:{}'.format(len(dictA)))
# print(dictA['name'])# 通过键获取对应的值
# dictA['name'] = 'lisi'
# print(dictA['name'])
# print(dictA.keys()) # 获取所有的键
# print(dictA.values()) #获取所有的值
#
#
# # print(dictA.items()) #获取所有的键值对
# for item in dictA.items():
#     print(item)

dictA.update({'age':'32'})
dictA.update({'high':'180'})  #可以进行添加或者修改
#删除操作,通过指定键进行删除
# del dictA['name']
# dictA.pop('age')
# for item in dictA.items():
#     print(item)

# 如何对字典进行排序   按照key

print(sorted(dictA.items(),key=lambda d:d[0]))

# 如何对字典进行排序   按照value

print(sorted(dictA.items(),key=lambda d:d[1]))










