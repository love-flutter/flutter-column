import 'dart:async';

void main() {
	print('flow start');  // 执行打印开始

  // 执行判断为事件任务，添加到事件任务队列
	Timer.run((){ 
        for(int i=0; i<1000000000; i++){ // 大循环，为了卡住事件任务执行时间，检查是否会卡住其他任务执行
          if(i == 1000000){

            // 执行判断为微任务，添加到微任务队列
            scheduleMicrotask((){ 
                print('microtask in event'); // 执行微任务，打印微任务标记
            });
          }
        }
        print('event'); // 执行完事件任务，打印执行完事件任务标记
   	});

  // 执行判断为微任务，添加到微任务队列
	scheduleMicrotask((){ 
        print('microtask'); // 执行微任务，打印微任务标记

        // 执行判断为事件任务，添加到事件任务队列
        Timer.run((){
        	print('event in microtask'); // 执行事件任务，打印事件任务标记
        });
    });

	print('flow end'); // 打印结束标记
}