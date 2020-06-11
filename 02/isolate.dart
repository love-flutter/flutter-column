import 'dart:async';
import 'dart:isolate';

Isolate isolate;

String name = 'dart';

void main() {
	// 执行新线程创建函数
 	isolateServer();
}

/// 多线程函数
void isolateServer()async{
	// 创建新的线程，并且执行回调 changName 
	final receive = ReceivePort();
	isolate = await Isolate.spawn(changName, receive.sendPort);

	// 监听线程返回信息 
	receive.listen((data){
		print("Myname is $data"); // 打印线程返回的数据
		print("Myname is $name"); // 打印全局 name 的数据
	});
}

/// 线程回调处理函数
void changName(SendPort port){
	name = 'dart isloate'; // 修改当前全局 name 属性
	port.send(name); // 将当前name发送给监听方
	print("Myname is $name in isloate"); // 打印当前线程中的 name
}