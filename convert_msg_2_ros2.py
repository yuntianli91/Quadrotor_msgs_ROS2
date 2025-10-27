#!/usr/bin/env python3
import re
import os
import sys

def convert_field_name(name):
    """将字段名转换为ROS2兼容格式"""
    # 如果是全大写，转为小写
    if name.isupper():
        return name.lower()
    
    # 如果是驼峰命名，转为下划线命名
    # 例如: Kp -> kp, MaxSpeed -> max_speed
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    s2 = re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1)
    return s2.lower()

def convert_msg_file(filepath):
    """转换单个msg文件"""
    with open(filepath, 'r') as f:
        lines = f.readlines()
    
    converted_lines = []
    for line in lines:
        # 跳过注释和空行
        if line.strip().startswith('#') or not line.strip():
            converted_lines.append(line)
            continue
        
        # 匹配字段定义 (type field_name)
        match = re.match(r'^(\S+)\s+(\S+)(.*)$', line)
        if match:
            field_type = match.group(1)
            field_name = match.group(2)
            rest = match.group(3)
            
            # 转换字段名
            new_field_name = convert_field_name(field_name)
            
            # 处理常量定义（移除等号）
            if '=' in rest:
                rest = rest.replace('=', ' ', 1)
            
            converted_line = f"{field_type} {new_field_name}{rest}\n"
            converted_lines.append(converted_line)
            
            if field_name != new_field_name:
                print(f"  {field_name} -> {new_field_name}")
        else:
            converted_lines.append(line)
    
    # 写回文件
    with open(filepath, 'w') as f:
        f.writelines(converted_lines)

def convert_all_msgs(msg_dir):
    """转换目录下所有的msg文件"""
    for filename in os.listdir(msg_dir):
        if filename.endswith('.msg'):
            filepath = os.path.join(msg_dir, filename)
            print(f"Converting {filename}...")
            convert_msg_file(filepath)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 convert_msgs_to_ros2.py <msg_directory>")
        sys.exit(1)
    
    msg_dir = sys.argv[1]
    convert_all_msgs(msg_dir)
    print("Conversion completed!")