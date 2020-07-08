#!/bin/bash

# 代码美化
dartfmt -w --fix lib/

# 代码规范检查
dartanalyzer lib

# 单元测试通过
flutter test