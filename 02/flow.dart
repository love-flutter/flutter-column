import 'dart:async';

void main() {
	print('flow start'); // 执行打印开始 

	// 执行判断为事件任务，添加到事件任务队列
	Timer.run((){ 
       print('event'); // 执行事件任务，打印标记
   	});

   	// 执行判断为微任务，添加到微任务队列 
	scheduleMicrotask((){ 
        print('microtask'); // 执行微任务，打印标记
    });

	print('flow end'); // 打印结束标记
}