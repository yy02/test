# 递归案例：树形结构的遍历
# 模拟文件搜索：对C盘ATTO文件夹下的所有文件进行检索
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