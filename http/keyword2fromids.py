#!/usr/bin/python
#coding=utf8
import types
import math
import sys
import urllib2
import urllib
import json
reload(sys)
#这里的目的是为了对中文设置utf-8的默认编码
sys.setdefaultencoding('utf-8')

class fromidInfo:
	def __init__(self,id,name):
		self.id=id
		self.name=name

#读写文件
def keywords2fromids():
	keywords_file_object = open('keywords.txt')
	fromids_file_object = open('fromids.txt','w+')
	try:
		for keyword in keywords_file_object:
			keyword=keyword.strip()
			fromidScoreTupList=keyword2fromidScoreTupList(keyword)
			if len(fromidScoreTupList)==0:
				continue
			fromids_file_object.write(keyword)
			fromids_file_object.write('\t')
			for fromidScoreTup in fromidScoreTupList:
#				print fromidScoreTup
				fromids_file_object.write(fromidScoreTup[0])
				fromids_file_object.write(':')
				fromids_file_object.write(fromidScoreTup[1])
				fromids_file_object.write('\t')
			fromids_file_object.write('\n')

	finally:
		keywords_file_object.close()
		fromids_file_object.close()
#对中文进行编码，然后发送请求，对json结果进行解析
def keyword2fromidScoreTupList(keyword):
        fromidScoreTupList=[]
	encodedKeyWord=None
	try:
		encodedKeyWord=urllib.quote(str(keyword))
	except  Exception,e:
		print "error happened when quote keyword: "+keyword,e
	if encodedKeyWord is None:
		return fromidScoreTupList
	req=urllib2.Request('http://lc1.haproxy.yidian.com:8902/service/assistant?word='+urllib.quote(str(keyword)))
        try:
                resonse=urllib2.urlopen(req)
	except urllib2.URLError, e:
		if hasattr(e, 'reason'):
			print keyword
			print 'We failed to reach a server.'
			print 'Reason: ', e.reason
		elif hasattr(e, 'code'):
			print 'The server couldn\'t fulfill the request.'
        		print 'Error code: ', e.code
	else:
                res=resonse.read()
                rootList=json.loads(res)
                channels=rootList['channels']
                for channel in channels:
                        fromidScoreTup=(channel['id'],channel['name'])
                        fromidScoreTupList.append(fromidScoreTup)
        return fromidScoreTupList
if __name__ == "__main__":
	keywords2fromids()
