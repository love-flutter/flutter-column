import 'dart:async';
import 'dart:isolate';

Isolate isolate;

void main() {
	print('project start'); // 打印项目启动标记

	ctask(); // 分配并执行 C 任务

	// 大循环，等待
	//for(int i=0; i<1000000000; i++){
	//}

	// 执行判断为微任务，添加到微任务队列
	scheduleMicrotask((){
		// 执行判断为微任务，添加到微任务队列
		scheduleMicrotask((){
			print('h1-1 task complete'); // 执行微任务，并打印微任务优先级h1-1
		});

		// 执行判断为事件任务，添加到事件任务队列
		Timer.run((){
        	print('l1-1 task complete'); // 执行事件任务，并打印事件任务优先级l1-1
        });
        print('H1 task complete'); // 打印H1微任务执行标记
	});

	// 执行判断为微任务，添加到微任务队列
	scheduleMicrotask((){
		// 执行判断为微任务，添加到微任务队列
		scheduleMicrotask((){
			print('h2-1 task complete'); // 执行微任务，并打印微任务优先级h2-1
		});

		// 执行判断为事件任务，添加到事件任务队列
		Timer.run((){
        	print('l2-1 task complete'); // 执行事件任务，并打印事件任务优先级l2-1
        });
        print('H2 task complete'); // 打印H2微任务执行标记
	});

	// 执行判断为事件任务，添加到事件任务队列
	Timer.run((){
		// 执行判断为微任务，添加到微任务队列
		scheduleMicrotask((){
			print('h3-1 task complete'); // 执行微任务，并打印微任务优先级h3-1
		});

		// 执行判断为事件任务，添加到事件任务队列
		Timer.run((){
        	print('l3-1 task complete'); // 执行事件任务，并打印事件任务优先级l3-1
        });
		print('L3 task complete'); // 打印L3事件任务执行标记
    });
	
	// 执行判断为事件任务，添加到事件任务队列
	Timer.run((){
		// 执行判断为微任务，添加到微任务队列
		scheduleMicrotask((){
			print('h4-1 task complete'); // 执行微任务，并打印微任务优先级h4-1
		});

		// 执行判断为事件任务，添加到事件任务队列
		Timer.run((){
        	print('l4-1 task complete'); // 执行事件任务，并打印事件任务优先级l4-1
        });
		print('L4 task complete'); // 打印L4事件任务执行标记
    });
}

/// C 任务具体代码，创建新的线程，并监听线程返回数据 
void ctask()async{
	final receive = ReceivePort();
	isolate = await Isolate.spawn(doCtask, receive.sendPort);
	receive.listen((data){
        print(data);
	});
}

/// 创建的新线程，具体执行的任务代码
void doCtask(SendPort port){
	// 执行判断为微任务，添加到微任务队列
	scheduleMicrotask((){
		print('ch5-1 task complete'); // 执行微任务，并打印微任务优先级ch5-1 
	});

	// 执行判断为事件任务，添加到事件任务队列
	Timer.run((){
        print('cl5-1 task complete'); // 打印cl5-1事件任务执行标记
    });

	port.send('C1 task complete'); // 打印 C 任务执行标记
}


