import os
import subprocess

# 创建存储生成程序的目录
output_dir = "csmith_output"
os.makedirs(output_dir, exist_ok=True)

# 生成 1000 个随机程序
for i in range(1, 1001):
    output_file = os.path.join(output_dir, f"program_{i}.c")
    with open(output_file, "w") as f:
        subprocess.run(["csmith"], stdout=f)
    print(f"Generated {output_file}")

print(f"All 1000 programs are generated in {output_dir}")
