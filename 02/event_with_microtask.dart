import 'dart:async';

void main() {
	print('flow start'); // 执行打印开始

  // 执行判断为事件任务，添加到事件任务队列
	Timer.run((){ 
       	print('event'); // 执行事件任务，打印事件任务标记

        // 执行判断为微任务，添加到微任务队列 
       	scheduleMicrotask((){ 
        	print('microtask in event'); // 执行微任务，打印微任务标记
    	});
   	});

  // 执行判断为微任务，添加到微任务队列 
	scheduleMicrotask((){ 
        print('microtask'); // 执行微任务，打印微任务执行标记

        // 执行判断为事件任务，添加到事件任务队列 
        Timer.run((){ 
        	print('event in microtask'); // 执行事件任务，打印事件任务标记
        });
    });

	print('flow end'); // 打印结束标记
}